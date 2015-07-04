#!/bin/bash
# compile lobster
export GOPATH=`pwd`
go build src/github.com/LunaNode/lobster/cmd/lobster.go
mv lobster lobster_`uname -m`

# copy files
cp src/github.com/LunaNode/lobster/INSTALL .
cp src/github.com/LunaNode/lobster/LICENSE .
# (skip notice, since we need to mention other libraries)
cp src/github.com/LunaNode/lobster/README .
cp src/github.com/LunaNode/lobster/schema.sql .
cp src/github.com/LunaNode/lobster/lobster.example* .
rm -r assets docs tmpl language wssh
cp -r src/github.com/LunaNode/lobster/assets/ assets/
cp -r src/github.com/LunaNode/lobster/docs/ docs/
cp -r src/github.com/LunaNode/lobster/tmpl/ tmpl/
cp -r src/github.com/LunaNode/lobster/language/ language/
mkdir wssh
cp -r src/github.com/LunaNode/lobster/wssh/assets/ wssh/assets/

# fetch files
rm -rf novnc
git clone https://github.com/kanaka/noVNC.git novnc
rm -rf novnc/.git
