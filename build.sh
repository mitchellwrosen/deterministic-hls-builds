#!/bin/bash

set -e

if [ ! -d "haskell-language-server-1.7.0.0" ]; then
  git clone \
    --branch 1.7.0.0 \
    --depth 1 \
    --single-branch \
    https://github.com/haskell/haskell-language-server.git \
    haskell-language-server-1.7.0.0
fi

for version in "8.10.7" "9.0.2" "9.2.2" "9.2.3" "9.2.4" "9.4.1"; do
  if [ ! -f "bin/haskell-language-server-$version" ]; then
    if [ ! -f "cabal.$version.project.freeze" ]; then
      (cd haskell-language-server-1.7.0.0; cabal freeze --disable-tests --project-file "../cabal.$version.project" -w "ghc-$version")
    fi
    (cd haskell-language-server-1.7.0.0; cabal install --project "../cabal.$version.project" -w "ghc-$version" --installdir=../bin)
    mv bin/haskell-language-server "bin/haskell-language-server-$version"
  fi
done
