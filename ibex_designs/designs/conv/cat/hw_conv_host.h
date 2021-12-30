#include <ac_int.h>
#include <ac_channel.h>
#include <mc_scverify.h>

#define WORD_SIZE          8
#define BUS_SIZE          32
#define RING_BUFFER_BITS   9
#define FILTER_SIZE        3
#define FILTER_BITS        8

#define WORDS_PER_BUS_CYCLE (BUS_SIZE/WORD_SIZE)
#define MAX_WIDTH (1<<RING_BUFFER_BITS)

typedef ac_int<RING_BUFFER_BITS + 3, true> wide_index_type;
typedef ac_int<RING_BUFFER_BITS, false>    index_type;
typedef ac_int<WORD_SIZE, true>            feature_map_type;
typedef ac_int<FILTER_BITS, true>          filter_type;
typedef ac_int<BUS_SIZE, false>            bus_type;


void conv(
    wide_index_type            height,
    wide_index_type            width,
    uint1                      max_pool,
    filter_type                filter[3][3],
    uint2                      op,
    ac_channel<uint1>          & go,
    ac_channel<uint1>          & done,
    ac_channel<bus_type>       & image_word_array,
    ac_channel<bus_type>       & result_word_array
);


    wide_index_type   HEIGHT;
    wide_index_type   WIDTH;
    uint1          MAX_POOL;
    filter_type           FILTER[3][3];
    uint2          OP;
    ac_channel<uint1>      go;
    ac_channel<uint1>      done;
    ac_channel<bus_type>   image_word_array;
    ac_channel<bus_type>   result_word_array;
    
#define RESULT_WORD_ARRAY result_word_array.read() 

