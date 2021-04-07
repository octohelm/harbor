VERSION = $(shell cat version)

apply:
	cuem k apply ./components/harbor

uninstall:
	cuem k delete ./components/harbor

dep:
	git submodule update --init
	git submodule update --force --remote
	git submodule foreach -q --recursive 'git checkout ${VERSION}'

tools-install:
	go install github.com/octohelm/cuemod/cmd/cuem@latest