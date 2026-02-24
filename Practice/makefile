# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c11

# File names
TARGET = pointers
SRC = pointers.c

# Default rule: build and run
all: $(TARGET) run

# Compile
$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

# Run program
run:
	./$(TARGET)

# Clean build files
clean:
	rm -f $(TARGET)