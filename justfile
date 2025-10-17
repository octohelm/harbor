export VERSION := `cat version`

all: dep patch

dep:
    git submodule update --init --recursive
    git submodule update --force --remote
    git submodule foreach -q --recursive 'git reset --hard && git checkout ${VERSION}'

[working-directory('harbor')]
patch:
    curl "https://github.com/goharbor/harbor/compare/{{ VERSION }}...morlay:patch-{{ VERSION }}.patch" | git apply -v

[working-directory('harbor')]
reset:
    git add .
    git reset --hard
