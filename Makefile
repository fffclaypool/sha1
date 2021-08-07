g++ command options (https://linux.die.net/man/1/g++) \

	-Wall \
	This enables all the warnings about constructions that some users consider questionable, \
	and that are easy to avoid (or modify to prevent the warning), even in conjunction with \
	macros. This also enables some language-specific warnings described in C ++ Dialect \
	Options and Objective-C and Objective-C ++ Dialect Options. \

	-Wextra \
	This enables some extra warning flags that are not enabled by -Wall. (This option used \
	to be called -W. \

	-std \
	Determine the language standard. This option is currently only supported when compiling \
	C or C ++ . The compiler can accept several base standards, such as c89 or c++98, and \
	GNU dialects of those standards, such as gnu89 or gnu++98. By specifying a base standard, \
	the compiler will accept all programs following that standard and those using GNU \
	extensions that do not contradict it. \

	-o file \
	Place output in file file. This applies regardless to whatever sort of output is being \
	produced, whether it be an executable file, an object file, an assembler file or \
	preprocessed C code. If -o is not specified, the default is to put an executable file in \
	a.out, the object file for source.suffix in source.o, its assembler file in source.s, a \
	precompiled header file in source.suffix.gch, and all preprocessed C source on standard \
	output. \

CROSS =
CXX   = $(CROSS)g++
RM    = rm -f

all: demo_sha1 test_sha1

demo_sha1: demo_sha1.cpp sha1.hpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -Wall -Wextra -std=c++11 -o $@ demo_sha1.cpp

test_sha1: test_sha1.cpp test_sha1_file.cpp sha1.hpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -Wall -Wextra -std=c++11 -o $@ test_sha1.cpp test_sha1_file.cpp

check: test_sha1
	./test_sha1

clean:
	$(RM) demo_sha1 test_sha1
