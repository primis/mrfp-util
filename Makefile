# Makefile

.PHONY: all install clean

CC 	?= gcc
CFLAGS  ?= -Wall -Wextra -O2
PREFIX  ?= /usr
LDFLAGS ?= -lmrfp

TARGET		:= mrfp-util
SOURCES 	!= find . -type f -name '*.c'
OBJS 		:= $(SOURCES:.c=.o)
DEPS		:= $(OBJS:.o=.d)

all: ${TARGET}

$(TARGET): $(OBJS)
	$(CC) ${LDFLAGS} -o $@ $^

$(DEPS):%.d:%.c
	@$(CC) $(CFLAGS) -MM $< >$@

include $(DEPS)

clean:
	@printf "\033[1mCLEAN\033[0m\n"
	@rm -rf ${OBJS} ${DEPS} ${TARGET}

install: ${TARGET}
	install -d $(DESTDIR)$(PREFIX)/bin/
	install -m 644 ${TARGET} $(DESTDIR)${PREFIX}/bin/
