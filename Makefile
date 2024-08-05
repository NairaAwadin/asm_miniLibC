##
## EPITECH PROJECT, 2024
## B-ASM-400-PAR-4-1-asmminilibc-naira.awadin
## File description:
## Makefile
##

ASM	=	nasm

SRC	=	strlen.asm	\
		strchr.asm	\
		strrchr.asm	\
		memset.asm	\
		memcpy.asm	\
		strcmp.asm	\

OBJ	=	$(SRC:.asm=.o)

NAME	=	libasm.so

ASFLAGS	= -f elf64

LDFLAGS	= -shared

TSRC	=	tests/test_libc.c


all:	$(OBJ)
		ld -fPIC $(LDFLAGS) $(OBJ) -o $(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $<

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

tests_run:
	$(CC) $(TSRC) $(CPPFLAGS) --coverage -lcriterion -o unit_tests
	./unit_tests

.PHONY:	re clean fclean all
