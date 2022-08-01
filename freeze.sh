#!/bin/bash

set -ex

(cd haskell-language-server-1.7.0.0; cabal freeze --disable-tests --project-file ../mitchell.project -w ghc-8.10.7)
mv mitchell.project.freeze mitchell.project.freeze-8.10.7

(cd haskell-language-server-1.7.0.0; cabal freeze --disable-tests --project-file ../mitchell.project -w ghc-9.0.2)
mv mitchell.project.freeze mitchell.project.freeze-9.0.2

(cd haskell-language-server-1.7.0.0; cabal freeze --disable-tests --project-file ../mitchell922.project -w ghc-9.2.2)
mv mitchell922.project.freeze mitchell922.project.freeze-9.2.2

(cd haskell-language-server-1.7.0.0; cabal freeze --disable-tests --project-file ../mitchell923.project -w ghc-9.2.3)
mv mitchell923.project.freeze mitchell923.project.freeze-9.2.3

# (cd haskell-language-server-1.7.0.0; cabal freeze --disable-tests --project-file ../mitchell924.project -w ghc-9.2.4)
# mv mitchell924.project.freeze mitchell924.project.freeze-9.2.4
