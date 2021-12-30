#include <stdio.h>
#include "mac.h"
#include "console.h"

#define TIMER (*(volatile unsigned int *) 0x60000000)

void mac_test()
{
   int i, j, k;
   int r;
   volatile int e;
   int errors = 0;
   int start, end;

   console_out("Testing the multiply accumulate peripheral \n");

   for (i=1; i<10; i++) {
      for (j=i; j<10; j++) {
         for (k=j; k<10; k++) {
            FACTOR_0 = i;
            FACTOR_1 = j;
            TERM_0 = k;

            r = RESULT;
            e = i*j+k;
            if (r != i*j+k) {
              console_out("%d * %d + %d == Got: %d expected: %d \n", i, j, k, r, e);
              console_out("Error - result was not what was expected! \n");
              errors++;
            }
         }
      }
   }
   console_out("\nErrors: %d \n\n", errors);

   start = TIMER;
   for (i=0; i<1000; i++) {
      e = i * i + i;
   }
   end = TIMER;

   console_out("Software done - elapsed clocks: %d \n", end-start);

   start = TIMER;
   for (i=0; i<1000; i++) {
      FACTOR_0 = i;
      FACTOR_1 = i;
      TERM_0 = i;
      e = RESULT;
   }
   end = TIMER;

   console_out("Hardware done - elapsed clocks: %d \n", end-start);
}


int perf_test(int n)
{
   int start, end;
   int p = 1;
   int i, j;

   start = TIMER;
   for (i=0; i<n; i++) {
      for (j=0; j<i; j++) {
         p = p * i * j;
      }
   }
   end = TIMER;
   console_out("timer start: %d end: %d \n", start, end);
   console_out("elapsed time = %d \n", end-start);
   return p;
}

int main()
{
   int n;

   console_out("\n\n\n");
   console_out("***================================================*** \n");
   console_out("***                                                *** \n");
   console_out("*** Catapult Platform Acceleration Demo Vehicle    *** \n");
   console_out("*** Version 0.1 - Ibex RISC-V Rev 3 Patch 0        *** \n");
   console_out("***                                                *** \n");
   console_out("***================================================*** \n");
   console_out("\n\n\n");

   mac_test();

   //n = perf_test(23);
   //console_out("perf_test says: %d \n", n);
}
