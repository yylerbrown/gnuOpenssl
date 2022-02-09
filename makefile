ROOT := openssl-1.1.1m

DIRS = \
crypto\
ssl\

SEARCH  := $(foreach dir, $(DIRS), $(ROOT)/$(dir)/**/*.c $(ROOT)/$(dir)/*.c) 
SOURCES := $(wildcard $(SEARCH))
OBJECTS := $(subst .cpp,.o, $(SOURCES))
OBJECTS := $(subst .c,.o, $(OBJECTS))

all: #test
	@echo $(SEARCH)
	# @echo $(OBJECTS)

# %.o:	%.c*
# 	$(CC) -c $< -o $@

# test:	$(OBJECTS)	
# 	$(CC) $(OBJECTS) -o test

# clean:
# 	rm -rf *.o test	