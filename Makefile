
BSL_SOURCES_C = \
	bsl-parse/BSLContext.c 					\
	bsl-parse/BSLDatabase.c					\
	bsl-parse/BSLEvaluate.c 				\
	bsl-parse/BSLExecute.c 					\
	bsl-parse/BSLExpression.c				\
	bsl-parse/BSLFunction.c 				\
	bsl-parse/BSLOperation.c 				\
	bsl-parse/BSLParse.c 					\
	bsl-parse/BSLScript.c 					\
	bsl-parse/BSLStack.c 					\
	bsl-parse/BSLStatement_Conditional.c 	\
	bsl-parse/BSLStatement_Fork.c 			\
	bsl-parse/BSLStatement_Func.c 			\
	bsl-parse/BSLStatement_Iterate.c 		\
	bsl-parse/BSLStatement_Return.c 		\
	bsl-parse/BSLStatement_Schedule.c 		\
	bsl-parse/BSLStatement_Sleep.c 			\
	bsl-parse/BSLStatement_Var.c 			\
	bsl-parse/BSLStatement.c 				\
	bsl-parse/BSLSymbol.c 					\
	bsl-parse/BSLToken.c					\
	bsl-parse/BSLTokenDefinitions.c 		\
	bsl-parse/BSLVariable.c 				\
	bsl-parse/TimeUtil.c 					\
	bsl-parse/FileAccess.c
BSL_SOURCES_CXX = \
	bsl-parse/cmap.cpp
BSL_SOURCES = $(BSL_SOURCES_C) $(BSL_SOURCES_CXX)

BSL_OBJECTS = $(BSL_SOURCES_C:.c=.o) $(BSL_SOURCES_CXX:.cpp=.o)

VALIDATOR_SOURCES = \
	bsl-parse/OniScript.c 	\
	bsl-parse/main.c
VALIDATOR_OBJECTS = $(VALIDATOR_SOURCES:.c=.o)

STDLIB_SOURCES = \
	./stdlib/BSL_stdlib_div.c 		\
	./stdlib/BSL_stdlib_mul.c 		\
	./stdlib/BSL_stdlib_print.c 	\
	./stdlib/BSL_stdlib_strlen.c 	\
	./stdlib/BSL_stdlib.c
STDLIB_OBJECTS = $(STDLIB_SOURCES:.c=.o)



CC = clang
CXX = clang++
LD = ld.lld

C_FLAGS = -x c -fPIC -std=gnu99 -Wall -g -DDEBUG=1
CXX_FLAGS = -x c++ -fPIC -std=gnu++11 -stdlib=libc++ -Wall -g -DDEBUG=1 -I/usr/include/c++/7 -I/usr/include/x86_64-linux-gnu/c++/7

HEADER_SEARCH_PATHS = -I/usr/include -Ibsl-parse -Istdlib -I.

LD_FLAGS = -std=gnu++11 -Wl,--warn-unresolved-symbols -Wl,-L. -Wl,--rpath=/usr/lib -Wl,--rpath=/home/linuxbrew/.linuxbrew/lib -Wl,--rpath=.

.cpp.o:
	$(CXX) $(CXX_FLAGS) $(HEADER_SEARCH_PATHS) -c $< -o $@

.c.o:
	$(CC) $(C_FLAGS) $(HEADER_SEARCH_PATHS) -c $< -o $@

bsl: $(BSL_OBJECTS)
	$(CXX) $(LD_FLAGS) -shared -lbsd $(BSL_OBJECTS) -o libbsl.so

additions: $(STDLIB_OBJECTS) bsl
	$(CC) $(LD_FLAGS) -shared -lbsl -DUSE_STD_LIB=0 $(STDLIB_OBJECTS) -o libbsl-additions.so

validator: $(VALIDATOR_OBJECTS) bsl additions
	$(CC) $(LD_FLAGS) -lbsl -lbsl-additions $(VALIDATOR_OBJECTS) -o bsl-validator

all:| bsl additions validator

build:| clean validator

clean:
	-rm -v bsl-parse/*.o
	-rm -v stdlib/*.o
	-rm -v *.so
	-rm -v bsl-validator

.PHONY: all bsl additions validator clean build