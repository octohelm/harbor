# Harbor multi-arch images

Live demo https://harbor.rktl.work/ (in k3s aarch64 cluster)

# Deploy

```
# clone
git clone https://github.com/querycap/harbor.git

# install tools (require golang)
make tools-install

# deploy
make apply
```