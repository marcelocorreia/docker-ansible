#include terraform.mk

REPOSITORY=docker-ansible
CONTAINER=ansible
NAMESPACE=marcelocorreia
VERSION=2.3.0.0
PIPELINE_NAME=$(REPOSITORY)-release
CI_TARGET=dev
TZ=Australia/Sydney
#TZ=GMT

build:
	@docker build \
		-t $(NAMESPACE)/$(CONTAINER):latest .
.PHONY: build

run:
	@docker run --rm \
		-e TZ=$(TZ) \
		$(NAMESPACE)/$(CONTAINER):latest\
		whereis export
.PHONY: run

shell:
	@docker run --rm -it \
		-e TZ=$(TZ) \
		$(NAMESPACE)/$(CONTAINER):latest \
		bash
.PHONY: shell

set-pipeline:
	fly -t $(CI_TARGET) set-pipeline \
		-n -p $(PIPELINE_NAME) \
		-c pipeline.yml \
		-l $(HOME)/.ssh/ci-credentials.yml \
		-v git_repo_url=git@github.com:$(NAMESPACE)/$(REPOSITORY).git \
        -v container_fullname=$(NAMESPACE)/$(CONTAINER) \
        -v container_name=$(CONTAINER) \
		-v git_repo=$(REPOSITORY) \
        -v git_branch=master \
        -v release_version=$(VERSION)

	fly -t $(CI_TARGET) unpause-pipeline -p $(PIPELINE_NAME)
	fly -t $(CI_TARGET) trigger-job -j $(PIPELINE_NAME)/$(PIPELINE_NAME)
	fly -t $(CI_TARGET) watch -j $(PIPELINE_NAME)/$(PIPELINE_NAME)
.PHONY: set-pipeline


watch-pipeline:
	fly -t $(CI_TARGET) watch -j $(PIPELINE_NAME)/$(PIPELINE_NAME)
.PHONY: watch-pipeline

destroy-pipeline:
	fly -t $(CI_TARGET) destroy-pipeline -p $(PIPELINE_NAME)
.PHONY: destroy-pipeline

docs:
	grip -b

