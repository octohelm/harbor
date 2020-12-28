#!/bin/sh

set -eux;

wget https://github.com/goharbor/harbor/pull/13751.patch && git apply 13751.patch

wget https://github.com/goharbor/harbor/pull/13788.patch && git apply 13788.patch

