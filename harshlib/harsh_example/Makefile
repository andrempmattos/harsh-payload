#
# This is a Makefile for an library example program. 
# This program uses both the harshlib library and the fsp module.
# Typing 'make' or 'make runner' will create the executable file.
#
# Define some Makefile variables for the compiler and compiler flags
# to use Makefile variables later in the Makefile: $()
#
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
#
CC = gcc
CFLAGS  = -g -Wall
RM = rm

# Typing 'make' will invoke the first target entry in the file 
# (in this case the default target entry)
# you can name this target entry anything, but "default" or "all"
# are the most commonly used names by convention
#
default: runner

# To create the executable file runner we need the object files
# main.o, rasp_wrapper.o, harshlib.o, and fsplib.o:
#
runner:  main.o rasp_wrapper.o harshlib.o fsplib.o
	$(CC) $(CFLAGS) -o runner main.o rasp_wrapper.o harshlib.o fsp.o crc16.o
	$(RM) *.o

# To create the object file main.o, we need the source
# files main.c, rasp_wrapper.h and harshlib.h:
#
main.o:  main.c rasp_wrapper.h ../harshlib/harshlib.h
	$(CC) $(CFLAGS) -c main.c

# To create the object file rasp_wrapper.o, we need the source
# files rasp_wrapper.c and rasp_wrapper.h 
#
rasp_wrapper.o:  rasp_wrapper.c rasp_wrapper.h
	$(CC) $(CFLAGS) -c rasp_wrapper.c

# To create the object file harshlib.o, we need the source
# files harshlib.c, harshlib.h, rasp_wrapper.h and fsp.h
#
harshlib.o:  ../harshlib/harshlib.c ../harshlib/harshlib.h rasp_wrapper.h fsp_0.2.0/fsp/fsp.h
	$(CC) $(CFLAGS) -c ../harshlib/harshlib.c

# To create the object file fsplib.o, we need the source
# files fsp.c, crc16.c, fsp.h and crc.h:
#
fsplib.o:  fsp_0.2.0/fsp/fsp.c fsp_0.2.0/fsp/fsp.h fsp_0.2.0/fsp/crc16.c fsp_0.2.0/fsp/crc.h
	$(CC) $(CFLAGS) -c fsp_0.2.0/fsp/fsp.c fsp_0.2.0/fsp/crc16.c

# To start over from scratch, type 'make clean'.  This
# removes the executable file, as well as old .o object
# files and *~ backup files:
#
clean: 
	$(RM) runner *.o
