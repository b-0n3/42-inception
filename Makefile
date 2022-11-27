include ./srcs/.env


COMPOSE		= cd srcs && docker-compose
COMPOSE_BONUS = cd srcs/requirements/bonus && docker-compose

WP_DIR		= /home/ubuntu/data/wp
DB_DIR		= /home/ubuntu/data/db
STATE_DIR = /home/ubuntu/data/db_states

.init:
	@echo "Initializing..."
ifneq ($( -d $(WP_DIR)), 0)
	@mkdir -p $(WP_DIR)
endif
ifneq ($(-d $(DB_DIR)), 0)
	@mkdir -p $(DB_DIR)
endif
ifneq ($(-d $(STATE_DIR)), 0)
	@mkdir -p $(STATE_DIR)
endif

all: build up


up: .init
	@${COMPOSE} up -d --remove-orphans

down:
	@${COMPOSE} down

build: .init
	@${COMPOSE} build

re: fclean build up	

rm-images: 
	@docker rmi `docker image ls -q` || true
 
clean: down rm-images rm
	

fclean: clean
	docker volume rm `docker volume ls -qf dangling=true` 2>/dev/null || true

rm:
	@${COMPOSE} rm -f || true

bonus-up:
	@${COMPOSE_BONUS} up -d --remove-orphans
bonus: .init bonus-build bonus-up
	@${COMPOSE_BONUS} up -d --remove-orphans

bonus-down:
	@${COMPOSE_BONUS} down

bonus-build: .init
	@${COMPOSE_BONUS} build

bonus-rm-images: 
	@docker rmi `docker image ls -q` || true

bonus-fclean: bonus-down bonus-rm-images bonus-rm
	docker volume rm `docker volume ls -qf dangling=true` 2>/dev/null || true

bonus-rm:
	@${COMPOSE_BONUS} rm -f || true
	
	
bonus-re: bonus-fclean bonus-build bonus-up 


.PHONY: .init up down build re clean fclean rm