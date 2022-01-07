#include "conv_test.h"
#ifdef HOST
#include <stdio.h>
#else
#include "console.h"
#endif

void *memset(void *s, int c, int n)
{
   int i;
   char *s1 = s;
console_out("a: %d \n", n);
   for (i=0; i<n; i++) s1[i]=c;
console_out("b\n");
   return s;

}

int in_range(int r, int c, int h, int w)
{
   if ( (0<=r) && (r<h) && (0<=c) && (c<w) ) return 1;
  return 0;
}


void sw_conv(
    signed char feature_maps[CHANS][ROWS][COLS],
    signed char kernels[FILTERS][CHANS][4][3],
    signed char results[FILTERS][ROWS][COLS])
{
   int r;
   int c;
   int x;
   int y;
   int f;
   int ch;
   int sum;

   for (f=0; f<FILTERS; f++) {
      for (r=0; r<ROWS; r++) {
         for (c=0; c<COLS; c++) {
            results[f][r][c] = 0;
         }
      }
   }
   for (f=0; f<FILTERS; f++) {
      for (ch=0; ch<CHANS; ch++) {
         for (r=0; r<ROWS; r++) {
            for (c=0; c<COLS; c++) {
               sum = 0.0;
               for (y=0; y<3; y++) {
                  for (x=0; x<3; x++) {
                     if (in_range(r+y-1,c+x-1,ROWS,COLS)) {
                        sum += feature_maps[ch][r+y-1][c+x-1] * kernels[f][ch][y][x];
                     }
                  }
               }
               results[f][r][c] += sum;
            }
         }
      }
   }
}
