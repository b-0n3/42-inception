include ./srcs/.env


COMPOSE		= cd srcs && docker-compose
COMPOSE_BONUS = cd srcs/requirements/bonus && docker-compose

WP_DIR		= /home/aait-ham/data/wp
DB_DIR		= /home/aait-ham/data/db

.init:
	@echo "Initializing..."
ifneq ($(grep -q $(DOMAIN_NAME) /etc/hosts), 0)
	@echo "Adding domain name to /etc/hosts..."
	@DOMAIN_IS_OK=$(echo "127.0.0.1 $(DOMAIN_NAME)" >> /etc/hosts)
	@$$DOMAIN_IS_OK || echo "Domain name added to /etc/hosts"
	@$$DOMAIN_IS_OK && echo "Failed to add domain name to /etc/hosts"
	@echo "skipping..."
endif

ifneq ($( -d $(WP_DIR)), 0)
	@mkdir -p $(WP_DIR)
endif
ifneq ($(-d $(DB_DIR)), 0)
	@mkdir -p $(DB_DIR)
endif

up: .init
	@${COMPOSE} up -d --remove-orphans

down:
	@${COMPOSE} down

build: .init
	@${COMPOSE} build

re: fclean build up	

clean: down rm
	@docker image rm $(shell docker images -aq) || true

fclean: clean
	@${COMPOSE} images -q | xargs docker rmi 2>/dev/null || true
	docker volume rm `docker volume ls -qf dangling=true` 2>/dev/null || true

rm:
	@${COMPOSE} rm -f || true

bonus-up:
	@${COMPOSE_BONUS} up -d --remove-orphans
bonus: .init
	@${COMPOSE_BONUS} up -d --remove-orphans

bonus-down:
	@${COMPOSE_BONUS} down

bonus-build: .init
	@${COMPOSE_BONUS} build

bonus-fclean: bonus-down bonus-rm
	@${COMPOSE_BONUS} images -q | xargs docker rmi 2>/dev/null || true
	docker volume rm `docker volume ls -qf dangling=true` 2>/dev/null || true
	@docker image rm $(shell docker images -aq) || true
bonus-rm:
	@${COMPOSE_BONUS} rm -f || true
	
	
bonus-re: bonus-fclean bonus-build bonus-up


.PHONY: .init up down build re clean fclean rm