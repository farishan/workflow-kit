CC ?= cc
CFLAGS ?= -Wall -Wextra -O2

.PHONY: build test clean

build: main.c
	$(CC) $(CFLAGS) -o main main.c

test: main.c test.c
	$(CC) $(CFLAGS) -DTEST -c main.c -o main.o
	$(CC) $(CFLAGS) test.c main.o -o test
	./test

clean:
	rm -f main test main.o
