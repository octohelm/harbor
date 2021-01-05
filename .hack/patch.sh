#!/bin/sh

set -eux;

# head content-type issue
wget https://github.com/goharbor/harbor/pull/13805.patch && git apply 13805.patch

wget https://github.com/goharbor/harbor/pull/13788.patch && git apply 13788.patch

