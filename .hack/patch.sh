#!/bin/sh

set -eux;

curl https://github.com/goharbor/harbor/compare/release-2.5.0...morlay:release-2.5.0.patch | git apply -v

