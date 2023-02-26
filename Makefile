
all: 
	docker-compose -f ./srcs/docker-compose.yml build
	docker-compose -f ./srcs/docker-compose.yml up -d

info:
	@docker image ls -a && echo
	@docker container ls -a && echo
	@docker network ls && echo
	@docker volume ls && echo

clean:
	docker container stop nginx mariadb wordpress

fclean: clean
	@sudo rm -rf /var/www/html/wordpress
	@sudo rm -rf /home/yatang/data/mariadb/*
	@sudo rm -rf /home/yatang/data/wordpress/*
	@docker system prune -af

re: fclean all
