// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

void  hsG_0__0 (struct dummyq_struct * I1248, EBLK  * I1242, U  I672);
void  hsG_0__0 (struct dummyq_struct * I1248, EBLK  * I1242, U  I672)
{
    U  I1499;
    U  I1500;
    U  I1501;
    struct futq * I1502;
    struct dummyq_struct * pQ = I1248;
    I1499 = ((U )vcs_clocks) + I672;
    I1501 = I1499 & ((1 << fHashTableSize) - 1);
    I1242->I712 = (EBLK  *)(-1);
    I1242->I716 = I1499;
    if (I1499 < (U )vcs_clocks) {
        I1500 = ((U  *)&vcs_clocks)[1];
        sched_millenium(pQ, I1242, I1500 + 1, I1499);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I672 == 1)) {
        I1242->I718 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I712 = I1242;
        peblkFutQ1Tail = I1242;
    }
    else if ((I1502 = pQ->I1147[I1501].I730)) {
        I1242->I718 = (struct eblk *)I1502->I729;
        I1502->I729->I712 = (RP )I1242;
        I1502->I729 = (RmaEblk  *)I1242;
    }
    else {
        sched_hsopt(pQ, I1242, I1499);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
