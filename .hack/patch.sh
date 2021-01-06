#!/bin/sh

set -eux;

wget https://github.com/goharbor/harbor/pull/13788.patch && git apply 13788.patch

