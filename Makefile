NAME = inception
TARGET = ./srcs/docker-compose.yml
VOLUME_DIR = /home/seowokim/data
DC=docker compose


all : up

up :
	@sudo mkdir -p ${VOLUME_DIR}/wordpress ${VOLUME_DIR}/mariadb
	@docker compose -f ${TARGET} up -d --build

down :
	@docker compose -f ${TARGET} down

start :
	@docker compose -f ${TARGET} start

stop :
	@docker compose -f ${TARGET} stop

ps :
	@docker compose -f ${TARGET} ps

clean :
	@docker compose -f ${TARGET} down -v --rmi all


fclean : clean
	@sudo rm -rf ${VOLUME_DIR}

re : fclean all

.PHONY: all up down stop start restart ps clean fclean re
