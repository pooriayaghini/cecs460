
#include "systemc.h"
#include "mult.h"
#include "mult_tb.h"

SC_MODULE(TbTop){
  sc_clock       clk;
  sc_signal<int> sig_din1;
  sc_signal<int> sig_din2;
  sc_signal<int> sig_dout;

  Mult    mult_inst;
  MultTb  mult_tb_inst;

  SC_CTOR(TbTop)
  :clk("tb_clk", 2, SC_NS),
	mult_inst("Multiplier"),
	mult_tb_inst("Mult_tb")
  {
    mult_inst.in_1(sig_din1);
    mult_inst.in_2(sig_din2);
    mult_inst.out (sig_dout);

    mult_tb_inst.clk (clk);
    mult_tb_inst.din1(sig_din1);
    mult_tb_inst.din2(sig_din2);
    mult_tb_inst.dout(sig_dout);

  }

};
