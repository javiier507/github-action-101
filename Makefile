current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SHELL = /bin/sh

docker-build:
	docker build -t github-action-demo-api .

docker-run:
	docker run --env-file .env -p 3000:3333 github-action-demo-api

github-action-run:
	act --secret-file github-action.secrets --var-file=github-action.variables
