VERSION = $(shell cat version)

dep:
	git submodule update --init
	git submodule update --force --remote
	git submodule foreach -q --recursive 'git reset --hard && git checkout ${VERSION}'

patch: dep
	cd harbor && sh ../.hack/patch.sh

tools-install:
	go install github.com/octohelm/cuemod/cmd/cuem@latest

apply:
	cuem k apply ./components/harbor

uninstall:
	cuem k delete ./components/harbor
