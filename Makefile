CXX = g++
CPPFLAGS = -I$(shell git rev-parse --show-toplevel)/Catch2/single_include -std=c++11 -g3 -MMD -O0
TARGET = sample
SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:%.cpp=%.o)
DEPS = $(SRCS:%.cpp=%.d)
RM = rm -f

.PHONY: all
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $^ -o $@ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $< -c $(CPPFLAGS)

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJS) $(DEPS)

-include *.d
