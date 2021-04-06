#!/bin/sh

set -eux;

wget -cO - https://github.com/goharbor/harbor/compare/release-2.2.0...morlay:release-2.2.0.patch > multi-arch.patch
git apply multi-arch.patch

