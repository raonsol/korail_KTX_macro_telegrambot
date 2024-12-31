include .env
IMAGE_NAME := geunsam2/korailbot:v3

help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: mac-setup
mac-setup:	## Setup your mac to use this python enviroment
	brew install pipenv
	brew install pyenv
	pipenv install

.PHONY: run-mac
run-mac:	## Run application locally on macOS
	pipenv run python src/main.py

.PHONY: build
build:		## Build Docker Image
	docker build -t ${IMAGE_NAME} -f ./Dockerfile .

.PHONY: publish
publish:  	## Publish Docker Image
	docker push ${IMAGE_NAME}

.PHONY: run-docker
run-docker:	## Run Docker container
	docker run -d \
		--name korailbot \
		--restart unless-stopped \
		-e TZ=Asia/Seoul \
		-e USERID=${USERID} \
		-e USERPW=${USERPW} \
		-e BOTTOKEN=${BOTTOKEN} \
		-p 8080:8080 \
		${IMAGE_NAME}
