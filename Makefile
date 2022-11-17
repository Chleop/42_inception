DATA_DIR		=	/home/cproesch/data/
DATA_SUB_DIR	=	mariadb wordpress
DATA			=	$(addprefix $(DATA_DIR), $(DATA_SUB_DIR))
DC_FILE			=	srcs/docker-compose.yml
HOSTS_FILE		=	/etc/hosts
ENV_FILE		=	srcs/.env
UID				=	$(shell id -r -u ${USER})
GID				=	$(shell id -r -g ${USER})

MKDIR 			=	mkdir -p
MOD				=	sudo chmod
ECHO 			=	echo
SED 			=	sed -i
D_CMD 			=	docker
DC_CMD			=	docker-compose
RM				=	rm

all:
		$(MKDIR) $(DATA)
		$(MOD) 666 $(HOSTS_FILE)
		$(ECHO) "127.0.0.1 cproesch.42.fr" >> $(HOSTS_FILE)
		$(MOD) 644 $(HOSTS_FILE)
		$(ECHO) "USER_ID=$(UID)" >> $(ENV_FILE)
		$(ECHO) "GROUP_ID=$(GID)" >> $(ENV_FILE)
		$(DC_CMD) -f $(DC_FILE) up -d

up:
		$(DC_CMD) -f $(DC_FILE) up -d

down:
		$(DC_CMD) -f $(DC_FILE) down

clean:	stop rm-containers rm-images rm-volumes rm-network rm-domain

stop:
		$(D_CMD) stop $(shell $(D_CMD) ps -q)

rm-containers:
		$(D_CMD) $(RM) -f $(shell $(D_CMD) ps -a -q)

rm-images:
		$(D_CMD) rmi $(shell $(D_CMD) images -a -q)

rm-volumes:
		$(D_CMD) volume $(RM) -f $(shell $(D_CMD) volume ls -q)
		$(RM) -rf $(DATA_DIR)

rm-network:
		$(D_CMD) network rm inception-network

rm-domain:
		$(MOD) 666 $(HOSTS_FILE)
		$(MOD) 777 /etc
		$(SED) '/cproesch.42.fr/d' $(HOSTS_FILE)
		$(MOD) 755 /etc
		$(MOD) 644 $(HOSTS_FILE)
		$(SED) '/USER_ID=/d' $(ENV_FILE)
		$(SED) '/GROUP_ID=/d' $(ENV_FILE)

re:		clean all

.PHONY:	all, up, down, clean, re, stop, rm-containers, rm-images, rm-volumes, rm-network, rm-domain
