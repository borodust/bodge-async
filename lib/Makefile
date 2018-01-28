BIN = libuv

ENV_CFLAGS := $(CFLAGS)
CCFLAGS := $(ENV_CFLAGS) -std=gnu99 -pedantic -O2 -fPIC -Iuv/include/ -I../ -Luv/.libs/


SRC = main.c
OBJ = $(SRC:.c=.o)
LIBS = -lpthread
STATIC_LIBS = -luv


ifeq ($(OS),Windows_NT)
	BIN := $(BIN).dll.bodged
	CCFLAGS := $(CCFLAGS) -Wl,-soname,$(BIN)
	LFLAGS := -Wl,--whole-archive -Wl,-Bstatic $(STATIC_LIBS) -Wl,--no-whole-archive -Wl,-Bdynamic $(LIBS)
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		BIN := $(BIN).dylib.bodged
		CCFLAGS := $(CCFLAGS) -Wl,-install_name,$(BIN)
		LFLAGS := $(LIBS) -all_load $(STATIC_LIBS)
	else
		BIN := $(BIN).so.bodged
		CCFLAGS := $(CCFLAGS) -Wl,-soname,$(BIN)
		LFLAGS := -Wl,--whole-archive -Wl,-Bstatic $(STATIC_LIBS) -Wl,--no-whole-archive -Wl,-Bdynamic $(LIBS)
	endif
endif

build: $(BIN)


$(BIN):
	cd uv/ && \
		./autogen.sh && \
		./configure --disable-shared --with-pic && \
		make
	$(CC) -shared $(SRC) $(CCFLAGS) -o $(BIN) $(LFLAGS)

clean:
	rm -f $(BIN) $(OBJS)
