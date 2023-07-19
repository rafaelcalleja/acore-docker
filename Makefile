-include .env
export
DOCKER_VERSION ?= 0.0.6
DOCKER_IMAGE ?= rafaelcalleja/ac-wotlk-worldserver:$(DOCKER_VERSION)
MYSQL_USER ?= root
MYSQL_PASSWORD ?= password
SQL_FOLDERS := world characters auth

MODULES ?= npc_enchanter npc_quest_dk npc_trainer npc_weapons wowhead npc_class_trainer all_portals auctionhousebot globalchat buff_command assistant
ACTION ?= up

DATABASE_CONTAINER := ac-database
DOCKER_COMPOSE := docker compose

.PHONY: help
help: ## Prints this help
	@VAR=$$(echo $(MAKEFILE_LIST)|xargs -n1 grep -E '^[^.]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'); \
	echo "$$VAR"|sort|uniq;

restart: ## Start/Restart Server
	@$(DOCKER_COMPOSE) up -d --force-recreate

install: $(MODULES) ## [module_name] Run the SQL of all modules to activate it

.PHONY: $(MODULES)
$(MODULES): database_up ## Run the SQL of a module to activate it
	@for FOLDER in $(SQL_FOLDERS); do \
		if [ -f ./scripts/lua/$@/sql/database/$${FOLDER}/$(ACTION).sql ]; then \
			$(DOCKER_COMPOSE) cp ./scripts/lua/$@/sql/database/$${FOLDER}/$(ACTION).sql $(DATABASE_CONTAINER):/tmp/file.sql && \
			$(DOCKER_COMPOSE) exec $(DATABASE_CONTAINER) bash -c "mysql -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) acore_$${FOLDER} < /tmp/file.sql" && \
			$(DOCKER_COMPOSE) exec $(DATABASE_CONTAINER) rm /tmp/file.sql; \
		fi; \
	done

uninstall: database_up ## Run the SQL of all modules in the container to deactivate the module
uninstall: ACTION=down
uninstall: $(MODULES)
	@echo "sql modules uninstalled"

.PHONY: database_up
database_up: ## up the database service
	$(DOCKER_COMPOSE) up -d $(DATABASE_CONTAINER)

build: ## compile azerothcore world server and build docker image
	docker build -t $(DOCKER_IMAGE)	-f docker/worldserver/Dockerfile .
