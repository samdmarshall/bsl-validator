 BSL_SOURCES = \
	bsl-parse/BSLContext.c            \
	bsl-parse/BSLParse.c              \
	bsl-parse/BSLStatement_Iterate.c  \
	bsl-parse/BSLTokenDefinitions.c   \
	bsl-parse/BSLDatabase.c           \
	bsl-parse/BSLScript.c             \
	bsl-parse/BSLStatement_Return.c   \
	bsl-parse/BSLVariable.c           \
	bsl-parse/BSLEvaluate.c           \
	bsl-parse/BSLStack.c              \
	bsl-parse/BSLStatement_Schedule.c \
	bsl-parse/FileAccess.c            \
	bsl-parse/BSLExecute.c     				\
	bsl-parse/BSLStatement.c          \
	bsl-parse/BSLStatement_Sleep.c    \
	bsl-parse/OniScript.c	            \
	bsl-parse/BSLExpression.c         \
	bsl-parse/BSLStatement_Conditional.c \
	bsl-parse/BSLStatement_Var.c         \
	bsl-parse/TimeUtil.c			           \
	bsl-parse/BSLFunction.c              \
	bsl-parse/BSLStatement_Fork.c        \
	bsl-parse/BSLSymbol.c              	 \
	bsl-parse/main.c                     \
	bsl-parse/BSLOperation.c             \
	bsl-parse/BSLStatement_Func.c        \
	bsl-parse/BSLToken.c                 \
	bsl-parse/cmap.cpp


CC = clang
CC_FLAGS = \
	-std=gnu++0x \
	-Wno-c++11-compat-deprecated-writable-strings \
	-Wno-writable-strings


.PHONY: clean all bsl stdlib

all:| stdlib bsl
	$(CC) -x c++ -c $(BSL_SOURCES) -I bsl-parse/ -I stdlib/ $(CC_FLAGS)

stdlib:
	@echo "building stdlib"

bsl:
	@echo "building the validator"

clean:
	rm -v *.o
