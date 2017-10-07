.PHONY: website
website:
	@docker pull malice/docs
	@docker-compose up -d --build

.PHONY: hugo
hugo:
	@open https://localhost
	@docker-compose -f docker-compose.hugo.yml up -d --build

.PHONY: log-docs
log-docs:
	@docker-compose log -f docs

.PHONY: log-portal
log-portal:
	@docker-compose log -f https-portal

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
