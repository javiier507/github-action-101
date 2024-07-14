current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SHELL = /bin/sh

# variables

VERSION := ''

docker-build:
	docker build -t cpenalba/github-action-demo-api .

docker-tag:
	docker tag cpenalba/github-action-demo-api cpenalba/github-action-demo-api:$(VERSION)

	docker tag cpenalba/github-action-demo-api cpenalba/github-action-demo-api:latest

docker-push:
	docker push cpenalba/github-action-demo-api:$(VERSION)

	docker push cpenalba/github-action-demo-api:latest

##

docker-run:
	docker run --env-file .env -p 3000:3333 github-action-demo-api

github-action-run:
	act --secret-file github-action.secrets --var-file=github-action.variables
