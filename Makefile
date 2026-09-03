APP := kbot
REGISTRY := quay.io/oleksiisk
TARGETOS := $(shell go env GOOS)
TARGETARCH := $(shell go env GOARCH)
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
IMAGE_TAG := $(REGISTRY)/$(APP):$(VERSION)-$(TARGETOS)-$(TARGETARCH)

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=$(TARGETARCH) go build -v -o kbot -ldflags "-X="github.com/oskordin/kbot/cmd.appVersion=${VERSION}

arm:
	GOOS=linux GOARCH=$(TARGETARCH) go build -v -o $(APP)-linux-arm64 .

macos:
	GOOS=darwin GOARCH=$(TARGETARCH) go build -v -o $(APP)-darwin-amd64 .

windows:
	GOOS=windows GOARCH=$(TARGETARCH) go build -v -o $(APP)-windows-amd64.exe .

image:
	docker build --build-arg TARGETOS=$(TARGETOS) --build-arg TARGETARCH=$(TARGETARCH) -t $(IMAGE_TAG) .

clean:
	rm -rf $(APP)-linux-amd64 $(APP)-linux-arm64 $(APP)-darwin-amd64 $(APP)-windows-amd64.exe
	docker rmi $(IMAGE_TAG)