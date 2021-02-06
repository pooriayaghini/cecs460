# cecs460

1- Make sure you add this line to your ~/.bashrc file

export SYSTEMC_HOME=/PATH/TO/YOUR/SYSTEMC

2- If you get an error regarding std::gets, do the following:

sudo vim $SYSTEMC_HOME/include/systemc.h

#** replace this line 

using std::gets;

#** with this:

#if defined(__cplusplus) && (__cplusplus < 201103L)
using std::gets;
#endif


