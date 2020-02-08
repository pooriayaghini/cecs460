// All systemc modules should include systemc.h header file
#include "systemc.h"

// hello_world is the module name
SC_MODULE (hello_world) {
  SC_CTOR (hello_world) {
    // Nothing in constructor 
  }
  void start() {
    cout << "Hello from CECS-460 !!!!\n";
  }
};

// sc_main in top level function like in C++ main
int sc_main(int argc, char* argv[]) {

  hello_world hello("HELLO");

  // Print the hello world
  hello.start();
  return(0);
}
