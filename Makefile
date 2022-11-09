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
RM				=	rm

all:
		# $(MKDIR) $(DATA)
		$(MKDIR) /home/cproesch/data/mdb
		$(MKDIR) /home/cproesch/data/wp
		$(MOD) 666 $(HOSTS_FILE)
		$(ECHO) "127.0.0.1 cproesch.42.fr" >> $(HOSTS_FILE)
		$(MOD) 644 $(HOSTS_FILE)
		$(DC_CMD) -f $(DC_FILE) up -d

down:
		$(DC_CMD) -f $(DC_FILE) down

clean:
		#$(DC_CMD) -f $(DC_FILE) down
		$(D_CMD) stop $($(D_CMD) ps -q)
		$(D_CMD) $(RM) -f $($(D_CMD) ps -a -q)
		$(D_CMD) rmi $($(D_CMD) images -a -q)
		$(D_CMD) volume $(RM) -f $($(D_CMD) volume ls -q)
		$(D_CMD) network rm inception-network
		$(D_CMD) system prune -f
		$(RM) -rf $(DATA_DIR)
		$(MOD) 666 $(HOSTS_FILE)
		$(SED) '/cproesch.42.fr/d' $(HOSTS_FILE)
		$(MOD) 644 $(HOSTS_FILE)

re:		clean all

.PHONY:	all, up, down, clean, re

