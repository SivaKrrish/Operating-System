CC = gcc
CFLAGS = -g
TARGET = doenv
OBJS = doenv.o
.SUFFIXES: .c .o

$(TARGET):$(OBJS)
	$(CC) -o $@ $(OBJS)

.c.o:
	$(CC) $(CFLAGS) -c $<

clean:
	/bin/rm -f *.o $(TARGET)
