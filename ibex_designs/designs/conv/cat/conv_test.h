#ifndef CONV_TEST_H_INCLUDED
#define CONV_TEST_H_INCLUDED

#define ERROR_PORT   ((unsigned long *)(0xFF001000))
#define DONE_PORT    ((unsigned long *)(0xFF000000))

#define NO_PROBLEM           (0x600D)
#define PROBLEM              (0x0BAD)

#define FILTERS 3
#define CHANS   2
#define ROWS    10
#define COLUMNS    10

#ifdef HOST
#define console_out(fmt,...) printf(fmt, ##__VA_ARGS__)
#endif

#endif

