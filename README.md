/*******************************/
[[4/10/2026 | 8:43:45]]
[[author : mohammed abd al marof gobara]]
[[tag : experiment 23002]]
[[name : simple binary loader]]
/*******************************/
tools like readelf, objdump and so on, depend on binary loader for static analysis and this couldn't be done with a specific library called "binary file descriptor", or simply bfd. the bfd is a framework which exposes interfaces which allows to read and parse common binary formats, like ELF and PE, and it's compiled for the widely adopted architectures like x86 and x86-64. this advantage allows to base your binary loader on this library without the need to implement a format-specific support.
the libbfd library is part of GNU project and is used by many application in the binutils suit, It provides
generic abstractions for all common components used in binary formats,
such as headers describing the binary’s target and properties, lists of sec
tions, sets of relocations, symbol tables, and so on. On Ubuntu, libbfd is part
of the binutils-dev package.
/******************************/
the program i am about to implement is gonna be written in C++, the entry point is main.cpp where the "main" function is gonna be implemented. we need to implement an wrapper functions that wraps/hides the libbfd functions and data structures, these wrapper functions are to reside in a seperate header file called "inc/loader.h" inside a directory called "inc".
/*****************************/ 