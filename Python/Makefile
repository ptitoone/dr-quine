COLLEEN 	=	Colleen.py
GRACE		=	Grace.py
SULLY		=	Sully.py


all : Colleen Grace Sully
	@printf "\033[1;32m"
	@printf "\n[+] You can now proceed to manual diff\n"
	@printf "\033[0;m"

Colleen :
	@printf "\033[1;33m"
	@printf "\n[+] Executing Colleen.py\n\n"
	@printf "\033[0;m"
	@python $(COLLEEN)
	@python $(COLLEEN) > Colleen_kid.py
	@printf "\033[1;36m"
	@printf "[?] Output has been piped to Colleen_kid.py\n"
	@printf "\033[0;m"

Grace :
	@printf "\033[1;33m"
	@printf "\n[+] Executing Grace.py\n"
	@printf "\033[0;m"
	@python $(GRACE)

Sully :
	@printf "\033[1;33m"
	@printf "\n[+] Executing Sully.py\n"
	@printf "\033[0;m"
	@python $(SULLY)

fclean :
	@printf "\033[1;31m"
	@printf "[!] Cleaning up outputed files.\n"
	@printf "\033[0;m"
	@rm -f Colleen_kid.py Grace_kid.py Sully_*

re : fclean all

