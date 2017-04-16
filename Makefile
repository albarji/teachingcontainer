.PHONY: build

build:
	docker build -t albarji/teaching-container:latest .

run:
	docker run --rm -it -p 8888:8888 -v $(shell pwd):/home/developer -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix albarji/teaching-container

