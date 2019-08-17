NAME ?= dio123/envoy-zipkin
VERSION ?= 1.experimental

up:
	docker-compose up --build -d

down:
	docker-compose down

docker-build:
	docker build -t $(NAME):$(VERSION) .

docker-push: docker-build
	docker push $(NAME):$(VERSION)

.PHONY: docker-build docker-push
