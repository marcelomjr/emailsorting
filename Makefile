# Macros para compilacao
LEX = flex
CC = gcc
CFLAGS = -Wextra -ll
DIR = src
FILENAME = $(DIR)/main.l
TARGET = ./main
SRCS := $(shell find $(DIR) -name '*.c')
OBJS = lex.yy.o


# Macros para teste
BASH = sh
TEST_SCRIPT = test.sh
VERBOSE ?= 1

# Macros para construcao do zip
ZIP = zip
USERNAME ?= $(USER)
ZIPFILE = $(USERNAME).zip
EXTENSIONS = *.c *.h *.in *.out *.sh

.PHONY: depend clean

all:$(TARGET)

$(TARGET):$(OBJS)
	$(CC) -o$(TARGET) $(OBJS) $(CFLAGS)

$(OBJS):lex.yy.c
	$(CC) $(CFLAGS) -c $< -o $@

lex.yy.c:$(FILENAME)
	flex $(FILENAME)

test:all
	$(BASH) $(TEST_SCRIPT) $(TARGET) $(VERBOSE)

zip:clean
	$(ZIP) -R $(ZIPFILE)  Makefile $(EXTENSIONS)

clean:
	$(RM) ./$(TARGET)
	$(RM) $(DIR)/*.o
	$(RM) ./$(ZIPFILE)
	$(RM) $(DIR)/lex.yy.c
