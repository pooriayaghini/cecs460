# cecs460

### Important Info:

Make sure you add this line to your ~/.bashrc file

export SYSTEMC_HOME=/PATH/TO/YOUR/SYSTEMC

If you are using a 32-bit installation or operating system, make sure to remove the "64" from all build scripts. For example, `build_hello.sh` in Lab 1 should be the following:

`g++ -std=c++98 -I. -I$SYSTEMC_HOME/include -L. -L$SYSTEMC_HOME/lib-linux -Wl,-rpath=$SYSTEMC_HOME/lib-linux -o hello hello.cpp -lsystemc -lm`
