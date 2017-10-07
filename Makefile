.PHONY: website
website: ## Update malice.io
	@docker pull malice/docs
	@docker-compose up -d --build

.PHONY: hugo
hugo: ## Start hugo docs server with SSL
	@open https://localhost
	@docker-compose -f docker-compose.hugo.yml up -d --build

.PHONY: log-docs
log-docs: ## Show docs logs
	@docker-compose logs -f docs

.PHONY: log-portal
log-portal: ## Show nginx+SSL logs
	@docker-compose logs -f https-portal

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
