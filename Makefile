IMAGE_NAME=ghcr.io/stuartleeks/devcontainer-build-run-demo

run:
	@go run main.go

docker-build:
	@docker build . -t devcontainer-build-run-demo

docker-run: docker-build
	@docker run --rm devcontainer-build-run-demo

ci: docker-build
# Lazily using 'latest' tag rather than versioned images...
	docker tag devcontainer-build-run-demo ${IMAGE_NAME}
	docker push ${IMAGE_NAME}
