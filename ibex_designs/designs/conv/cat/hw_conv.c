#include "conv_test.h"
#include "hw_conv.h"

#ifdef HOST
#include <stdio.h>
#include "hw_conv_host.h"
#else
#include "conv.h"
#include "console.h"
#endif


#ifdef HOST
#define start_processing  /* this is a comment */
#define wait_for_done \
               go.write(sync_bit);  \
               conv(HEIGHT, WIDTH, MAX_POOL, FILTER, OP, go, done, image_word_array, result_word_array); \
               sync_bit = done.read();   
#else
#define start_processing while(!GO_READY); GO = sync_bit;
#define wait_for_done while (!DONE_VALID); sync_bit = DONE;
#endif

void hw_conv(
    signed char feature_maps[CHANS][ROWS][COLUMNS],
    signed char  kernels[FILTERS][CHANS][3][3],
    signed char results[FILTERS][ROWS][COLUMNS])
{
   int f;
   int ch;
   int a;
   uint1 sync_bit = 1;

   // set up filters

   HEIGHT = ROWS;
   WIDTH = COLUMNS;

   for (f=0; f<FILTERS; f++) {
      OP = 2;

      start_processing;
      wait_for_done;

      OP = 0;

      for (ch = 0; ch<CHANS; ch++) {
#ifdef HOST
         FILTER[0][0] = kernels[f][ch][0][0];         
         FILTER[0][1] = kernels[f][ch][0][1];
         FILTER[0][2] = kernels[f][ch][0][2];
         FILTER[1][0] = kernels[f][ch][1][0];         
         FILTER[1][1] = kernels[f][ch][1][1];
         FILTER[1][2] = kernels[f][ch][1][2];
         FILTER[2][0] = kernels[f][ch][2][0];         
         FILTER[2][1] = kernels[f][ch][2][1];
         FILTER[2][2] = kernels[f][ch][2][2];
#else    
         FILTER(0) = * (((int *) &kernels[f][ch][0][0]));
         FILTER(1) = * (((int *) &kernels[f][ch][0][0]) + 1);
         FILTER(2) = * (((int *) &kernels[f][ch][0][0]) + 2);
#endif
         start_processing;
          
         for (a=0; a<((ROWS*COLUMNS)/4); a++) {
#ifdef HOST
            image_word_array.write(*(((int *) &feature_maps[ch][0][0]) + a));
#else
            IMAGE_WORD_ARRAY = * (((int *) &feature_maps[ch][0][0]) + a);
#endif
         }
         wait_for_done;
      }
   
      OP = 1;

      start_processing;
 
#ifdef HOST
      wait_for_done;
#endif     
      for (a=0; a<(ROWS*COLUMNS)/4; a++) {
         * (((int *) &results[f][0][0]) + a) = RESULT_WORD_ARRAY;
      }

#ifndef HOST
      wait_for_done;
#endif
   }     
}
