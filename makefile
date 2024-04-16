CC = g++
CFLAGS = -Wall -Wextra -pedantic -std=c++11

# Include directory
INCLUDES = -I./include

# Source files
SRCS = src/main.cpp src/network/*.cpp src/user_interface/*.cpp
# Target executable
TARGET = tests/atlasc2.o

all: compile run

compile: $(SRCS)
	$(CC) $(CFLAGS) -g $(INCLUDES) $(SRCS) -o $(TARGET)
	strip $(TARGET)

run:
	$(TARGET)

debug: $(SRCS)
	$(CC) $(CFLAGS) -g $(INCLUDES) $(SRCS) -o $(TARGET)
	strip $(TARGET)
	lldb $(TARGET)
