#!make
DOCKER:=@docker
APP_NAME=redis-master
DOCKER_REPO=registry.gitlab.com/server1/redis
VERSION=$(shell git rev-parse --short HEAD)
IMAGE=registry.gitlab.com/server1/redis/redis-master

env:=.env
-include $(env)

login:
	${DOCKER} login

build:
	${DOCKER} build -t ${APP_NAME} .

start:
	${DOCKER} run -it ${APP_NAME}

tag:
	@echo "create tag $(VERSION)"
	${DOCKER} tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):$(VERSION)
	${DOCKER} tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):latest

push: build tag
	${DOCKER} push $(DOCKER_REPO)/$(APP_NAME):$(VERSION)
	${DOCKER} push $(DOCKER_REPO)/$(APP_NAME):latest

${APP_NAME}: login build start
