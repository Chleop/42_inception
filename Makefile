DATA			=	$(addprefix $(DATA_DIR), $(DATA_SUB_DIR))
DATA_DIR		=	/home/cproesch/data/
DATA_SUB_DIR	=	mdb wp
RM				=	rm -rf

all:	$(NAME)

$(NAME):
			# mkdir $(DATA)
			mkdir /home/cproeschel/data
			mkdir /home/cproeschel/data/mdb
			mkdir /home/cproeschel/data/wp
			sudo chmod 666 /etc/hosts
			echo "127.0.0.1 cproesch.42.fr" >> /etc/hosts
			sudo chmod 644 /etc/hosts
			docker-compose -f srcs/docker-compose.yml up -d

clean:
			# docker-compose -f srcs/docker-compose.yml down
			sudo chmod 666 /etc/hosts
			echo "127.0.0.1 cproesch.42.fr" >> /etc/hosts
			sudo chmod 644 /etc/hosts
			rm -rf /home/cproeschel/data

fclean:		clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:		re, all, clean, fclean