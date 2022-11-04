DATA_DIR		=	/home/cproesch/data/
DATA_SUB_DIR	=	mdb wp
DATA			=	$(addprefix $(DATA_DIR), $(DATA_SUB_DIR))
DC_FILE			=	srcs/docker-compose.yml
HOSTS_FILE		=	/etc/hosts

MKDIR 			=	mkdir -p
MOD				=	sudo chmod
ECHO 			=	echo
SED 			=	sed
D_CMD 			=	docker
DC_CMD			=	docker-compose
RM				=	rm -rf

all:
		# $(MKDIR) $(DATA)
		$(MKDIR) /home/cproesch/data/mdb
		$(MKDIR) /home/cproesch/data/wp
		$(MOD) 666 $(HOSTS_FILE)
		$(ECHO) "127.0.0.1 cproesch.42.fr" >> $(HOSTS_FILE)
		$(MOD) 644 $(HOSTS_FILE)

up:
		$(DC_CMD) -f $(DC_FILE) up -d

down:
		$(DC_CMD) -f $(DC_FILE) down

clean:
		$(D_CMD) system prune -f
		$(RM) $(DATA_DIR)
		$(MOD) 666 $(HOSTS_FILE)
		$(SED) '/cproesch/d' $(HOSTS_FILE)
		$(MOD) 644 $(HOSTS_FILE)

fclean:	down clean

re:		fclean all

.PHONY:	all, up, down, clean, fclean, re