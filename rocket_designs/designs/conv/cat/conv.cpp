#include <ac_int.h>
#include <ac_channel.h>
#include <mc_scverify.h>
#include <stdio.h>

#define WORD_SIZE          8
#define BUS_SIZE          32
#define RING_BUFFER_BITS   9
#define FILTER_SIZE        3
#define FILTER_BITS        8

#define WORDS_PER_BUS_CYCLE (BUS_SIZE/WORD_SIZE)
#define MAX_WIDTH (1<<RING_BUFFER_BITS)

#define BUFF_ITER_SIZE    (ac::nbits<(WORDS_PER_BUS_CYCLE+1)>::val)
#define FILTER_ITER_SIZE  (ac::nbits<(FILTER_SIZE+1)>::val)

typedef ac_int<RING_BUFFER_BITS + FILTER_SIZE, true>  wide_index_type;
typedef ac_int<RING_BUFFER_BITS, false>     index_type;
typedef ac_int<WORD_SIZE, true>             feature_map_type;
typedef ac_int<FILTER_BITS, true>           filter_type;
typedef ac_int<BUS_SIZE, false>             bus_type;
typedef ac_int<BUFF_ITER_SIZE, false>       buff_iter_type;
typedef ac_int<FILTER_ITER_SIZE, false>     filter_iter_type;

typedef enum op_enum {CONVOLVE = 0, RETURN_RESULTS = 1, CLEAR_SUMS = 2, NOOP = 3} operations;

class input_buffer {
    
public:
    input_buffer(ac_channel<bus_type> *);
    feature_map_type read(void);
    void load_more_data(void);

private:
    index_type              index;
    bus_type                wide_word;
    feature_map_type        in_buffer[WORDS_PER_BUS_CYCLE];
    ac_channel<bus_type>   *input_channel;
};


input_buffer::input_buffer(ac_channel<bus_type> *in_chan)
{
   input_channel = in_chan;
   index = WORDS_PER_BUS_CYCLE;
}

void input_buffer::load_more_data(void) 
{
   // printf("performed a read... \n");
   wide_word = input_channel->read();
   for (buff_iter_type i=0; i<WORDS_PER_BUS_CYCLE; i++) {
      in_buffer[i] = wide_word & ((1<<WORD_SIZE) - 1);
      wide_word = wide_word >> WORD_SIZE;
   }
   index = 0;
}

feature_map_type input_buffer::read(void)
{
   if (index >= WORDS_PER_BUS_CYCLE) {
      load_more_data();
   }

   return(in_buffer[index++]);
}
    


class output_buffer {

public:

   output_buffer(ac_channel<bus_type> *out_chan);
   void flush(void); 
   void send(feature_map_type data);

private:
   ac_channel<bus_type>   *output_channel;
   bus_type                wide_word;
   feature_map_type        buffer[WORDS_PER_BUS_CYCLE];
   index_type              index;

};

output_buffer::output_buffer(ac_channel<bus_type> *out_chan)
{
   index = 0;
   wide_word = 0;
   output_channel = out_chan;
   
   for (buff_iter_type i=0; i<WORDS_PER_BUS_CYCLE; i++) {
      buffer[i] = 0;
   }
}

void output_buffer::flush(void)
{
   if (index > 0) {
      for (buff_iter_type i=0; i<index; i++) {
         wide_word = (wide_word << WORD_SIZE) + buffer[(WORDS_PER_BUS_CYCLE-1)-i];
         buffer[(WORDS_PER_BUS_CYCLE-1)-i] = 0;
      }
      output_channel->write(wide_word);
      index = 0;
   }
}   

void output_buffer::send(feature_map_type data)
{
   buffer[index++] = data;

   if (index >= WORDS_PER_BUS_CYCLE) {
      for (buff_iter_type i=0; i<WORDS_PER_BUS_CYCLE; i++) {
         wide_word = (wide_word << WORD_SIZE) + buffer[(WORDS_PER_BUS_CYCLE-1) - i];
         buffer[(WORDS_PER_BUS_CYCLE-1) - i] = 0;
      }
      output_channel->write(wide_word);
      index = 0;
   }
}


bool in_bounds(
    wide_index_type row,
    wide_index_type col,
    wide_index_type height,
    wide_index_type width)
{
    if (
         (row >= 0) && (row < height) &&
         (col >= 0) && (col < width)

       ) return true;
    else return false;
}


#pragma hls_design top
void CCS_BLOCK(conv)(
    wide_index_type          height,
    wide_index_type          width,
    uint1                    max_pool,
    filter_type              filter_in[FILTER_SIZE][FILTER_SIZE],
    uint2                    op,
    ac_channel<uint1>        &go,
    ac_channel<uint1>        &done,
    ac_channel<bus_type>     &image_word_array,
    ac_channel<bus_type>     &result_word_array
)
{
    static feature_map_type    output_image[MAX_WIDTH][MAX_WIDTH];  
    static bool b_dummy = ac::init_array<AC_VAL_DC>(&output_image[0][0], sizeof(output_image)/sizeof(output_image[0][0]));
    static class input_buffer feature_map_in(&image_word_array);
    static class output_buffer results_out(&result_word_array);
    filter_type filter[FILTER_SIZE][FILTER_SIZE];

    filter_bs_row: for (filter_iter_type r=0; r<FILTER_SIZE; r++) {
       filter_bs_col: for (filter_iter_type c=0; c<FILTER_SIZE; c++) {    
          filter[r][c] = filter_in[r][c];  // catapult should be able to do this without my help!
       }
    }
    
#ifndef __SYNTHESIS__
    if (!go.available(1)) return;
#else
    while (!go.size());
#endif
    go.read();
    
    if (op == 0) { // CONVOLVE) {

      index_type                buf_ptr = 0;      
      feature_map_type          image_tap[FILTER_SIZE][FILTER_SIZE];
      static feature_map_type   ring_buffer[FILTER_SIZE-1][MAX_WIDTH];
      static bool a_dummy = ac::init_array<AC_VAL_DC>(&ring_buffer[0][0], sizeof(ring_buffer)/sizeof(ring_buffer[0][0]));
      
      int count = 0;
      main_rows: for (wide_index_type row=0; row<(height+1); row++) {
         main_cols: for (wide_index_type col=0; col<(width+1); col++) {

            index_type idx = buf_ptr + (index_type) ((width+1) - FILTER_SIZE); // intended to overflow
   
            image_load: for (filter_iter_type t=0; t<FILTER_SIZE; t++) {
               image_shift: for (filter_iter_type i=0; i<FILTER_SIZE-1; i++) {
                  image_tap[t][i] = image_tap[t][i+1];
               }
               if (t<FILTER_SIZE-1) {
                  image_tap[t][FILTER_SIZE-1] = ring_buffer[t][buf_ptr];
                  ring_buffer[t][idx] = image_tap[t+1][0];
               } else {
                  if (in_bounds(row, col, height, width)){
                     image_tap[t][FILTER_SIZE-1] = feature_map_in.read();
                  } else {
                     image_tap[t][FILTER_SIZE-1] = 0;
                  }
               }
            }
   
            buf_ptr++; // intended to overflow
            
            if (in_bounds(row-1, col-1, height, width)) {

               ac_int<WORD_SIZE * 2, true> sums[FILTER_SIZE][FILTER_SIZE];
               ac_int<WORD_SIZE * 2, true> grand_total = 0;
                  
               outer_conv: for(filter_iter_type r=0; r<FILTER_SIZE; r++) {
                  inner_conv: for(filter_iter_type c=0; c<FILTER_SIZE; c++) {
                     wide_index_type rr = (row-(FILTER_SIZE-1)) + r;
                     wide_index_type cc = (col-(FILTER_SIZE-1)) + c;
                     if (in_bounds(rr, cc, height, width)) {
                        sums[r][c] = filter[r][c] * image_tap[r][c]; 
                     } else {
                        sums[r][c] = 0;
                     }
                  }
               }

               outer_summation: for (filter_iter_type r=0; r<FILTER_SIZE; r++) {
                  inner_summation: for (filter_iter_type c=0; c<FILTER_SIZE; c++) {
                     grand_total += sums[r][c];
                  }
               }
               output_image[row-1][col-1] += grand_total;
            }
         }
      }
         
   } else if (op == RETURN_RESULTS) {  
            
      if (max_pool) { // fixed stride of 2
         out_row_max: for (wide_index_type row=0; row<height-1; row+=2) {
            out_col_max: for (wide_index_type col=0; col<width-1; col+=2) {
                              
                feature_map_type m0 = output_image[row][col];
                feature_map_type m1 = output_image[row][col+1];
                feature_map_type m2 = output_image[row+1][col];
                feature_map_type m3 = output_image[row+1][col+1];
                
                feature_map_type m01 = (m0 > m1) ? m0 : m1;
                feature_map_type m23 = (m2 > m3) ? m2 : m3;
                
                feature_map_type max = (m01 > m23) ? m01 : m23;
                
                results_out.send(max);
                
                output_image[row][col] = 0;
                output_image[row][col+1] = 0;
                output_image[row+1][col] = 0;
                output_image[row+1][col+1] = 0;
                
             }
         }
        
      } else {
    
         out_row: for (wide_index_type row=0; row<height; row++) {
           out_col: for (wide_index_type col=0; col<width; col++) {
              results_out.send(output_image[row][col]);
              output_image[row][col] = 0;
           }
         }
      }

      results_out.flush();
   
   } else if (op == CLEAR_SUMS) {
       
      clear_row: for (wide_index_type row=0; row<height; row++) {
        clear_col: for (wide_index_type col=0; col<width; col++) {
           output_image[row][col] = 0;
        }
      }
      
   } else if (op == NOOP) {

   }
   
   done.write(1);
}
