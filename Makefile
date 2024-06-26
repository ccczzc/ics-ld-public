CC = gcc

DIR = testcases

SRC := $(wildcard $(DIR)/*.c)
OBJ := $(patsubst $(DIR)/%.c,$(DIR)/%.o,$(SRC))

all: $(OBJ)
	mkdir -p build && cd build && cmake .. && make
	python3 autograder.py

$(DIR)/%.o: $(DIR)/%.c | $(DIR)
	$(CC) -c $< -o $@

clean:
	rm -rf $(DIR)/*.o
