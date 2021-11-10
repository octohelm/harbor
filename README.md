# Harbor multi-arch images

## How to build

Same as https://github.com/goharbor/harbor
With the patch https://github.com/goharbor/harbor/compare/release-2.4.0...morlay:release-2.4.0

```shell
https://github.com/goharbor/harbor/compare/release-2.4.0...morlay:release-2.4.0.patch | git apply -v
```

## Deploy

```
# clone
git clone https://github.com/querycap/harbor.git

# install tools (require golang)
make tools-install

# deploy
make apply
```