#include <string.h>
#include <stdio.h>
#include <stdarg.h>
#ifndef HOST
#include "console.h"
#endif
#include "conv_test.h"
#include "sw_conv.h"
#include "hw_conv.h"

#define BATCH

#define TIMER (*(volatile unsigned int *) 0x60000000)

static signed char feature_maps[CHANS][ROWS][COLS] =

  {{{  1,  2,  3,  4,  5,  6,  7,  8,  9, 10 },
    { 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 },
    { 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 },
    { 31, 32, 33, 34, 35, 36, 37, 38, 39, 40 },
    { 41, 42, 43, 44, 45, 46, 47, 48, 49, 50 },
    { 51, 52, 53, 54, 55, 56, 57, 58, 59, 60 },
    { 61, 62, 63, 64, 65, 66, 67, 68, 69, 70 },
    { 71, 72, 73, 74, 75, 76, 77, 78, 79, 80 },
    { 81, 82, 83, 84, 85, 86, 87, 88, 89, 90 },
    { 91, 92, 93, 94, 95, 96, 97, 98, 99, 100 }},

   {{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 },
    { 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 },
    { 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 },
    { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 },
    { 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 },
    { 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 },
    { 8, 8, 8, 8, 8, 8, 8, 8, 8, 8 },
    { 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 }}};

static signed char kernels[FILTERS][CHANS][3][3] = 

   {{{{ 0,  0, 0 },
      { 0,  1, 0 },
      { 0,  0, 0 }},

     {{ 0,  0, 0 },
      { 0,  0, 0 },
      { 0,  0, 0 }}},

    {{{ 0,  0, 0 },
      { 0,  1, 0 },
      { 0,  0, 0 }},

     {{ 0,  0, 0 },
      { 0,  2, 0 },
      { 0,  0, 0 }}},

    {{{  0,  0,  0 },
      {  0,  1,  0 },
      {  0,  0,  0 }},

     {{  0,  0,  0 },
      {  0, -2,  0 },
      {  0,  0,  0 }}}};


static signed char sw_results[FILTERS][ROWS][COLS];
static signed char hw_results[FILTERS][ROWS][COLS];

void print_results(signed char results[FILTERS][ROWS][COLS])
{
   int f;
   int r;
   int c;

   for (f=0; f<FILTERS; f++) {
      console_out("filter: %d \n", f);
      for (r=0; r<ROWS; r++) {
         for (c=0; c<COLS; c++) {
            console_out("%d ", results[f][r][c]);
         }
         console_out("\n");
      }
      console_out("\n");
   }
}

int check_results(signed char results[FILTERS][ROWS][COLS],
                  signed char expected_results[FILTERS][ROWS][COLS])
{
   int f;
   int r;
   int c;
   int err = 0;

   for (f=0; f<FILTERS; f++) {
      for (r=0; r<ROWS; r++) {
         for (c=0; c<COLS; c++) {
            if (results[f][r][c] != expected_results[f][r][c]) {
               console_out("error: filter: %d row: %d col: %d, got: %d expected %d \n",
                                   f, r, c, (int)results[f][r][c], (int)expected_results[f][r][c]);
               err++;
            }
         }
      }
   }

   console_out("Errors: %d \n", err);
   return err;
}


int main()
{
   int errors;
   int sw_start, sw_end;
   int hw_start, hw_end;

   console_out("\n\n\n");
   console_out("***================================================*** \n");
   console_out("***                                                *** \n");
   console_out("*** Catapult Platform Acceleration Demo Vehicle    *** \n");
   console_out("*** Version 0 - RISC-V Ibex        Rev 3 Patch 0   *** \n");
   console_out("***                                                *** \n");
   console_out("***================================================*** \n");
   console_out("\n\n\n");

#ifdef BATCH 

   console_out("Running convolution in software: \n");
   sw_start = TIMER;
   sw_conv(feature_maps, kernels, sw_results);
   sw_end   = TIMER;
   console_out("Software convolution complete \n");
   print_results(sw_results);

   console_out("Running convolution in hardware: \n");
   hw_start = TIMER;
   hw_conv(feature_maps, kernels, hw_results);
   hw_end   = TIMER;
   console_out("Hardware Convolution complete \n");
   print_results(hw_results);

   errors = check_results(hw_results, sw_results);

   if (errors > 0) {
       console_out("\n%d errors found \n", errors);
   } else {
       console_out("\nNo errors found \n");
   }

   console_out("sw elaped clocks: %d \n", sw_end-sw_start);
   console_out("hw elsped clocks: %d \n", hw_end-hw_start);

   return 0;

#else

   char c;

   while(1) {

      console_out("\n");
      console_out("   1) sw convolution \n");
      console_out("   2) catapult convolution \n");
      console_out("   Q) quit \n");
      console_out("\n");
      console_out("=> ");

      c = get_char();
      
      switch (c) {
        case '1' :  console_out("1 \n");
                    sw_conv(feature_maps, kernels, sw_results);     break;
        case '2' :  console_out("2 \n");
                    hw_conv(feature_maps, kernels, sw_results);     break;
        case 'q' :
        case 'Q' :  console_out("Q \n");
                    console_out("   Thank you for flying with Catapult! \n");
                    console_out("   Goodbye    :-) \n");
                    return 1;
        default  :  break;
      } 
   } 

#endif
}
