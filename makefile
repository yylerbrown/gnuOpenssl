ROOT := openssl-1.1.1m

DIRS = \
fuzz\
ssl\
crypto\
external\

SEARCH  := $(foreach dir, $(DIRS), $(ROOT)/*.c $(ROOT)/$(dir)/**/*.c $(ROOT)/$(dir)/*.c) 

SOURCES := $(wildcard $(SEARCH))
OBJECTS := $(subst .cpp,.o, $(SOURCES))
OBJECTS := $(subst .c,.o, $(OBJECTS))

all: test

%.o:	%.c
	$(CC) -I./openssl-1.1.1m/include/ -I./openssl-1.1.1m/ -c $< -o $@

test:	$(OBJECTS)	
	$(CC) $(OBJECTS) -o test

clean:
	rm -rf *.o test	