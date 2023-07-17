MODULES ?= npc_enchanter npc_quest_dk npc_trainer npc_weapons wowhead npc_class_trainer
ACTION ?= up

DATABASE_CONTAINER := ac-database
DOCKER_COMPOSE := docker compose
TARGET_PART := $(subst _, ,$(MAKECMDGOALS))

.PHONY: help
help: ## Prints this help
	@VAR=$$(echo $(MAKEFILE_LIST)|xargs -n1 grep -E '^[^.]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'); \
	echo "$$VAR"|sort|uniq;

install: $(MODULES) ## [module_name] Run the SQL of all modules to activate it

.PHONY: $(MODULES)
$(MODULES): database_up ## Run the SQL of a module to activate it
	@$(DOCKER_COMPOSE) cp ./scripts/lua/$@/sql/database/world/$(ACTION).sql $(DATABASE_CONTAINER):/tmp/file.sql && \
	$(DOCKER_COMPOSE) exec $(DATABASE_CONTAINER) bash -c "mysql -uroot -ppassword acore_world < /tmp/file.sql" && \
	$(DOCKER_COMPOSE) exec $(DATABASE_CONTAINER) rm /tmp/file.sql

uninstall: database_up ## Run the SQL of all modules in the container to deactivate the module
uninstall: ACTION=down
uninstall: $(MODULES)
	@echo "sql modules uninstalled"

.PHONY: database_up
database_up: ## up the database service
	$(DOCKER_COMPOSE) up -d $(DATABASE_CONTAINER)
