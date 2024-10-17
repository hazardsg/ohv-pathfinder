.ONESHELL:
.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Run Ansible playbook to build Pathfinder configs.
	ansible-playbook -i inventory.yml build.yml

.PHONY: deploy
deploy: ## Run Ansible Playbook to deploy Pathfinder config for OHV CE Lab.
	ansible-playbook -i inventory.yml -e @env.yml --ask-vault-pass deploy.yml