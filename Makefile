VERSION = $(shell cat version)

apply:
	cuem k apply ./helm

uninstall:
	cuem k delete ./helm

dep:
	git submodule update --init
	git submodule update --force --remote
	git submodule foreach -q --recursive 'git checkout ${VERSION}'

tools-install:
	go install github.com/octohelm/cuemod/cmd/cuem@latest