COLLEEN_BIN =	Colleen
GRACE_BIN	=	Grace
SULLY_BIN	=	Sully

CC			=	gcc
ASM			=	nasm
CFLAGS		=	-Wall -Werror -Wextra

all : $(COLLEEN_BIN) $(GRACE_BIN) $(SULLY_BIN)
	@printf "\033[1;32m"
	@printf "\n[-] You can now proceed to execution and manual diff\n"
	@printf "\033[0;m"

.s.o :
	@printf "\033[1;33m"
	@printf "[+] Assembling $@\n"
	@printf "\033[0;m"
	@$(ASM) $< -f macho64 -o $@

$(COLLEEN_BIN) : Colleen.o
	@printf "\033[1;33m"
	@printf "[+] Compiling $(COLLEEN_BIN)\n"
	@printf "\033[0;m"
	@$(CC) $(CFLAGS) Colleen.o -o $(COLLEEN_BIN)

$(GRACE_BIN) : Grace.o
	@printf "\033[1;33m"
	@printf "[+] Compiling $(GRACE_BIN)\n"
	@printf "\033[0;m"
	@$(CC) $(CFLAGS) Grace.o -o $(GRACE_BIN)

$(SULLY_BIN) : Sully.o
	@printf "\033[1;33m"
	@printf "[+] Compiling $(SULLY_BIN)\n"
	@printf "\033[0;m"
	@$(CC) $(CFLAGS) Sully.o -o $(SULLY_BIN)

clean :
	@printf "\033[1;31m"
	@printf "[!] Cleaning up object and outputed files.\n"
	@printf "\033[0;m"
	@rm -f *.o Sully_* Grace_kid.s

fclean : clean
	@printf "\033[1;31m"
	@printf "[!] Cleaning up binary files.\n"
	@printf "\033[0;m"
	@rm -f $(COLLEEN_BIN) $(GRACE_BIN) $(SULLY_BIN)

re : fclean all
