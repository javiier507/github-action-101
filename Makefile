current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SHELL = /bin/sh

docker-build:
  docker build -t github-action-demo-api:v1.0.0 .

docker-run:
  docker run -e PORT=3000 -e APP_KEY=lorem37378378key -e DRIVE_DISK=local -p 3000:3000 github-action-demo-api:v1.0.0

github-action-run:
  act --secret-file github-action.secrets --var-file=github-action.variables
