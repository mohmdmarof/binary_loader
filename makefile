# Makefile for experiment23002
CXX = g++
CXXFLAGS = -Wall -Wextra -O2 -Iinc
LDFLAGS = -lbfd -lopcodes -ldl
SRC = main.cpp inc/loader.cc
OBJ = $(SRC:.cpp=.o)
TARGET = loader

# Default target
all: $(TARGET)

# Link step
$(TARGET): $(OBJ)
    $(CXX) $(OBJ) -o $(TARGET) $(LDFLAGS)

# Compile step
%.o: %.cpp
    $(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up build artifacts
clean:
    rm -f $(OBJ) $(TARGET)

# Convenience target
run: $(TARGET)
    ./$(TARGET)
