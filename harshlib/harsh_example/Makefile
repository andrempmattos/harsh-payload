TARGET=harsh_runner
LIBS=../
SOURCE=main.c rasp_wrapper.c $(LIBS)/harshlib/harshlib.c

CC=gcc
FLAGS=-Wall -I$(LIBS) -o

all:
	$(CC) $(FLAGS) $(TARGET).x $(SOURCE)

clean:
	rm *.x