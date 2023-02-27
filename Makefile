
all: 
	docker-compose -f ./srcs/docker-compose.yml build
	docker-compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker container stop nginx mariadb wordpress

fclean: clean
	@sudo rm -rf /var/www/html/wordpress
	@sudo rm -rf /home/yatang/data/mariadb/*
	@sudo rm -rf /home/yatang/data/wordpress/*
	@docker system prune -af

re: fclean all
