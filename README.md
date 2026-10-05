## binary loader
### description:
in binary analysis, in order to inspect any executable file, object file or static/dynamic library, we need to load them and parse them in order to be printed, this is where the binary loader comes to play this role, relying on libbfd library, which is part of the well known GNU project, the program can open the binary, tell which architecture it belongs to, it's format (whether it's PE or ELF), tell it's type (an object file, a shared library, or an executable), among other properties, and when we are done from parsing the program just prints file property, its sections, it dynamic and static symbol table and other thing about it.
### view:
#### main.cpp 
the main function resides in `main.cpp`, which calls two function we implement them as an abstraction of the `libbfd` library function, the reason for this is to avoid format specific support and want both support all formats, like PE and ELF.
#### inc
if you noticed in `main.cpp`, we included a user-implemented header called `inc/loader.h`, inside that directory, there is a header file and a C++ file, inside the header file, we defined three structure:
- `Binary` class defined as an abstraction of the loaded binary file after it has been parsed, which includes: the name of the file, its size, its entry vma, its type, it's table of symbols of type `vector<Symbol>` and its table of sections of the type `vector<Section>`.
- `Symbol` class defined as an abstraction of the individual symbol in the symbols table, and defines its property: the name of the symbol, it's type, and it's address.
- `Section` class defined as an abstraction of the individual section in the Section table and defines the sections property: the name of it, its binary, its type, it's vma, its address, its size and it bytes.

after that comes the signature of the two most important functions, `load_binary` and `unload_binary`, these two functions are implemented to load, parse and then unload when we are done with printing it's content, both of them are defined in loader.cc which includes the `bfd.h` header so that we can use it functions the retrieve the binary file's property to be parsed.
