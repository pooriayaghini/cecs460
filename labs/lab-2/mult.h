
#include "systemc.h"

SC_MODULE(Mult)
{
  sc_in<int>  in_1;
  sc_in<int>  in_2;
  sc_out<int> out;

  void body(){ out = in_1 * in_2;}

  SC_CTOR(Mult){
    SC_METHOD(body);
    sensitive << in_1 << in_2; 
  }

};
