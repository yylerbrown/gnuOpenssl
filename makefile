ROOT := openssl-3.0.1
DIRS = \
apps\
crypto\

SEARCH  := $(foreach dir, $(DIRS), $(ROOT)/$(dir)/*.c) 
SOURCES := $(wildcard $(SEARCH))

all: 
	@echo $(SOURCES)
