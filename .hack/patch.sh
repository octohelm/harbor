#!/bin/sh

set -eux

VERSION=${VERSION:-"v2.6.1"}

curl https://github.com/goharbor/harbor/compare/${VERSION}...morlay:patch-${VERSION}.patch | git apply -v
