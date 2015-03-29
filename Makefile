build: Dockerfile
	docker build -t alpine-elasticsearch .

tag:
	docker tag alpine-elasticsearch soldair/alpine-elasticsearch
