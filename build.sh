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

ghcvers=("8.10.7" "9.0.2")
for ghcver in "${ghcvers[@]}"; do
  if [ ! -f "bin/haskell-language-server-$ghcver" ]; then
    cp mitchell.project.freeze-$ghcver mitchell.project.freeze
    (cd haskell-language-server-1.7.0.0; cabal install --project ../mitchell.project -w ghc-$ghcver --installdir=../bin)
    mv bin/haskell-language-server bin/haskell-language-server-$ghcver
    rm mitchell.project.freeze
  fi
done
