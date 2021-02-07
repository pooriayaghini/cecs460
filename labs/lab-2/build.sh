echo "### Building ..."
echo
g++ -std=c++98 -I. -I$SYSTEMC_HOME/include -L. -L$SYSTEMC_HOME/lib-linux64 -Wl,-rpath=$SYSTEMC_HOME/lib-linux64 -o runme top.cpp -lsystemc -lm
###

echo "Build is finished and you can try running it using: "
echo "  ./runme"

