#include <string.h>
#include <stdio.h>
#include <stdarg.h>

#define UART_CHAR_PORT ((unsigned char *)(0xA0000000))
#define UART_CHAR_READY ((unsigned char *)(0xA0000018))

#define ESC (27)

char check_for_escape(void)
{
    int flags;
    char key_pressed;

    flags = *UART_CHAR_READY;
    if (flags & 0x10) return 0;

    key_pressed = *UART_CHAR_PORT;

    if (key_pressed == ESC) return 1;
    else return 0;
}


char get_char(void)
{
    int flags;
    char key_pressed;

    do {
        flags = *UART_CHAR_READY;
    } while (flags & 0x10);

    key_pressed = *UART_CHAR_PORT;

    return key_pressed;
}

void itox(int n, char *s)
{
   char t[16];
   int i;
   int d;
   int len;

   if (!n) {
      s[0] = '0';
      s[1] = 0;
      return;
   }

   for (i=0; n; i++) {
      d = (n % 16);
      if (d > 9) {
          t[i] = 'A' + (d - 10);
      } else { 
          t[i] = '0' + d;
      }
      n = n >> 4;
   }

   t[i] = 0;
   len = i;

   for (i=1; i<=len; i++) {
      s[len - i] = t[i-1];
   }

   s[len] = 0;

   return;
}


void itoa(int n, char *s)
{
   char t[10];
   int neg = 0;
   int i;
   int len;

   if (!n) {
      s[0] = '0';
      s[1] = 0;
      return;
   }

   if (n < 0) {
      neg = 1;
      n = -1 * n;
   }

   for (i=0; n; i++) {
      t[i] = '0' + (n % 10);
      n = n / 10;
   }

   if (neg) t[i++] = '-';

   t[i] = 0;
   len = i;

   // reverse string
   for (i=1; i<=len; i++) {
      s[len-i] = t[i-1];
   }

   s[len] = 0;

   return;
}


void console_out(char *s, ...)
{
   va_list args;
   int count;
   char number[10];
   char *string;
   int i;
   int n;

   va_start(args, s);
   while (*s) {
      if (*s == '\n') *UART_CHAR_PORT = '\r';

      if ((s[0] == '%') && (s[1] == 'd')) {
         s += 2;
         n = va_arg(args, int);
         itoa(n, number);
         for (i=0; number[i]; i++) {
            *UART_CHAR_PORT = number[i];
         }
      }        

      if ((s[0] == '%') && (s[1] == 'x')) {
         s += 2;
         n = va_arg(args, int);
         itox(n, number);
         for (i=0; number[i]; i++) {
            *UART_CHAR_PORT = number[i];
         }
      }        

      if ((s[0] == '%') && (s[1] == 's')) {
         s += 2;
         string = va_arg(args, char *);
         for (i=0; string[i]; i++) {
            *UART_CHAR_PORT = string[i];
         }
      }

      *UART_CHAR_PORT = *s;
      s++;
   }
}

