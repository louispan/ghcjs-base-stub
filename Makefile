SHELL := /bin/bash
INSTALL_ROOT:=$(shell stack path --local-install-root)
PROJECT_ROOT:=$(shell stack path --project-root)
GHCJS_OUT:=$(INSTALL_ROOT)/bin/javascrip-shim-test.jsexe

.PHONY: all install clean build

all: build
	@true # dependency tracking doesn't work for empty @targets

# install: build/test.js
# 	npm install

stack.ghcjs.yaml: stack.yaml ghcjs.yaml
	cat stack.yaml ghcjs.yaml > stack.ghcjs.yaml

build: stack.ghcjs.yaml
	stack build --stack-yaml stack.ghcjs.yaml

clean: stack.ghcjs.yaml
	stack clean --stack-yaml stack.ghcjs.yaml
