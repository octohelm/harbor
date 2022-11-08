export VERSION = $(shell cat version)

dep:
	git submodule update --init
	git submodule update --force --remote
	git submodule foreach -q --recursive 'git reset --hard && git checkout ${VERSION}'

patch: dep
	cd harbor && sh ../.hack/patch.sh
