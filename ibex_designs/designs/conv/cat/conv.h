/*************************************************************************** 
 *  accelerator interface header                                             
 ***************************************************************************/
   
#define ACCEL_ADDR ((volatile unsigned int *) 0x70000000) 
   
   
// register map 
   
#define HEIGHT (*(ACCEL_ADDR + 0)) 
#define WIDTH (*(ACCEL_ADDR + 1)) 
#define MAX_POOL (*(ACCEL_ADDR + 2)) 
#define FILTER_IN(IDX) (*(ACCEL_ADDR + (3 + (IDX)))) 
#define OP (*(ACCEL_ADDR + 6)) 
#define GO (*(ACCEL_ADDR + 7)) 
#define GO_READY (*(ACCEL_ADDR + 8)) 
#define DONE (*(ACCEL_ADDR + 9)) 
#define DONE_VALID (*(ACCEL_ADDR + 10)) 
#define IMAGE_WORD_ARRAY (*(ACCEL_ADDR + 11)) 
#define IMAGE_WORD_ARRAY_READY (*(ACCEL_ADDR + 12)) 
#define RESULT_WORD_ARRAY (*(ACCEL_ADDR + 13)) 
#define RESULT_WORD_ARRAY_VALID (*(ACCEL_ADDR + 14)) 
