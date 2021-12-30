
#include <ac_int.h>
#include <ac_channel.h>

#pragma design top
void mac(
      ac_int<7> factor_0,
      ac_int<9> factor_1,
      ac_int<15> term_0,
      ac_int<32> &result)
{

      ac_int<16> product;
      ac_int<17> sum;

      product = factor_0 * factor_1;
      sum = product + term_0;
      result = sum;
}

