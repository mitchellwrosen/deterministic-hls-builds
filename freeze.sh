#!/bin/bash

# Note to self: here's how I derived the freeze files from the project files
# (I ran this in the cloned hls directory)

set -ex

cabal freeze --project-file ../mitchell.project -w ghc-8.10.7
mv ../mitchell.project.freeze ../mitchell.project.freeze-8.10.7

cabal freeze --project-file ../mitchell.project -w ghc-9.0.2
mv ../mitchell.project.freeze ../mitchell.project.freeze-9.0.2

cabal freeze --disable-tests --project-file ../mitchell92.project -w ghc-9.2.2
mv ../mitchell92.project.freeze ../mitchell92.project.freeze-9.2.2
