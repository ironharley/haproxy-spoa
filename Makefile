DESTDIR =
PREFIX  = /usr/local
BINDIR  = $(PREFIX)/bin

CC = gcc
LD = $(CC)

CFLAGS  = -g -O2 -Wall -Werror -pthread
INCS += -I../../ebtree -I./include
LIBS = -lpthread -levent -levent_pthreads

OBJS = spoa.o


spoa: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ $(LIBS)

install: spoa
	install spoa $(DESTDIR)$(BINDIR)

clean:
	rm -f spoa $(OBJS)
	
tar:
	cd ..;	tar cfz spoa_example/spoa_example.tar.gz spoa_example/ 	

%.o:	%.c
	$(CC) $(CFLAGS) $(INCS) -c -o $@ $<
