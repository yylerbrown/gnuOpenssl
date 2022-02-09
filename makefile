ROOT := openssl-3.0.1

DIRS = \
crypto\
crypto/aes\
crypto/aria\
crypto/asn1\
crypto/async\
crypto/async/arch\
crypto/bf\
crypto/bio\
crypto/bn\
crypto/bn/asm\
crypto/buffer\
crypto/camellia\
crypto/cast\
crypto/chacha\
crypto/cmac\
crypto/cmp\
crypto/cms\
crypto/comp\
crypto/conf\
crypto/crmf\
crypto/ct\
crypto/des\
crypto/dh\
crypto/dsa\
crypto/dso\
crypto/ec\
crypto/ec/curve448\
crypto/encode_decode\
crypto/engine\
crypto/err\
crypto/ess\
crypto/evp\
crypto/ffc\
crypto/hmac\
crypto/http\
crypto/idea\
crypto/kdf\
crypto/lhash\
crypto/md2\
crypto/md4\
crypto/md5\
crypto/mdc2\
crypto/modes\
crypto/objects\
crypto/ocsp\
crypto/pem\
crypto/pkcs12\
crypto/pkcs7\
crypto/poly1305\
crypto/property\
crypto/rand\
crypto/rc2\
crypto/rc4\
crypto/rc5\
crypto/ripemd\
crypto/rsa\
crypto/seed\
crypto/sha\
crypto/siphash\
crypto/sm2\
crypto/sm3\
crypto/sm4\
crypto/srp\
crypto/stack\
crypto/store\
crypto/ts\
crypto/txt_db\
crypto/ui\
crypto/whrlpool\
crypto/x509\
ssl\
ssl/record\
ssl/statem\

SEARCH  := $(foreach dir, $(DIRS), $(ROOT)/$(dir)/*.c) 
SOURCES := $(wildcard $(SEARCH))
OBJECTS := $(subst .cpp,.o, $(SOURCES))
OBJECTS := $(subst .c,.o, $(OBJECTS))

all: test
	@echo $(OBJECTS)

%.o:	%.c*
	$(CC) -c $< -o $@

test:	$(OBJECTS)	
	$(CC) $(OBJECTS) -o test

clean:
	rm -rf *.o test	