COMPOSE_FILE = ./srcs/docker-compose.yml

all:
	@docker-compose -f $(COMPOSE_FILE) up 

build:
	@docker-compose -f $(COMPOSE_FILE) build

down:
	@docker-compose -f $(COMPOSE_FILE) down

re: down
	@docker-compose -f $(COMPOSE_FILE) up -d --build


clean:
	@docker system prune -af


.PHONY: fclean re down build all