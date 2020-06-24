TARGET=runner
HARSHLIB=../
FSPLIB=fsp_0.2.0
SOURCE=main.c rasp_wrapper.c $(HARSHLIB)/harshlib/harshlib.c $(FSPLIB)/fsp/fsp.c $(FSPLIB)/fsp/crc16.c

CC=gcc
FLAGS=-Wall -I$(LIBS) -o

all:
	$(CC) $(FLAGS) $(TARGET).x $(SOURCE)

clean:
	rm *.x