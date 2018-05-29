IMAGE := lazyfrosch/gofed
FROM := $(shell grep FROM Dockerfile | cut -d" " -f2)

all: pull build

pull:
	docker pull "$(IMAGE)" || true
	docker pull "$(FROM)"

build:
	docker build --tag "$(IMAGE)" .

push:
	docker push "$(IMAGE)"

clean:
	if (docker inspect --type image "$(IMAGE)" >/dev/null 2>&1); then docker rmi "$(IMAGE)"; fi
