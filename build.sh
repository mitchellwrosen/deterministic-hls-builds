#!/bin/bash

set -ex

if [ ! -d "haskell-language-server-1.7.0.0" ]; then
  git clone \
    --branch 1.7.0.0 \
    --depth 1 \
    --single-branch \
    https://github.com/haskell/haskell-language-server.git \
    haskell-language-server-1.7.0.0
fi

# GHC 8.10.7
if [ ! -f "bin/haskell-language-server-8.10.7" ]; then
  cp mitchell.project.freeze-8.10.7 mitchell.project.freeze
  (cd haskell-language-server-1.7.0.0; cabal install --project ../mitchell.project -w ghc-8.10.7 --installdir=../bin)
  mv bin/haskell-language-server bin/haskell-language-server-8.10.7
  rm mitchell.project.freeze
fi

# GHC 9.0.2
if [ ! -f "bin/haskell-language-server-9.0.2" ]; then
  cp mitchell.project.freeze-9.0.2 mitchell.project.freeze
  (cd haskell-language-server-1.7.0.0; cabal install --project ../mitchell.project -w ghc-9.0.2 --installdir=../bin)
  mv bin/haskell-language-server bin/haskell-language-server-9.0.2
  rm mitchell.project.freeze
fi

# # GHC 9.2.2
# if [ ! -f "bin/haskell-language-server-9.2.2" ]; then
#   cp mitchell922.project.freeze-9.2.2 mitchell922.project.freeze
#   (cd haskell-language-server-1.7.0.0; cabal install --project ../mitchell922.project -w ghc-9.2.2 --installdir=../bin)
#   mv bin/haskell-language-server bin/haskell-language-server-9.2.2
#   rm mitchell922.project.freeze
# fi

# GHC 9.2.3
if [ ! -f "bin/haskell-language-server-9.2.3" ]; then
  cp mitchell923.project.freeze-9.2.3 mitchell923.project.freeze
  (cd haskell-language-server-1.7.0.0; cabal install --project ../mitchell923.project -w ghc-9.2.3 --installdir=../bin)
  mv bin/haskell-language-server bin/haskell-language-server-9.2.3
  rm mitchell923.project.freeze
fi

# GHC 9.2.4
# if [ ! -f "bin/haskell-language-server-9.2.4" ]; then
#   cp mitchell924.project.freeze-9.2.4 mitchell924.project.freeze
#   (cd haskell-language-server-1.7.0.0; cabal install --project ../mitchell924.project -w ghc-9.2.4 --installdir=../bin)
#   mv bin/haskell-language-server bin/haskell-language-server-9.2.4
#   rm mitchell924.project.freeze
# fi
