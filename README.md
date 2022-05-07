This repo contains some files to build HLS the way I want it:

  - With a pinned version of `ormolu` (0.4.0.0), and, in fact, every transitive dependency.
  - Without plugins I don't use: `hlint` and other formatters that aren't `ormolu`.

Run `./build.sh` and you will end up with these (symlinks to) executables:

```
./bin/haskell-language-server-8.10.7
./bin/haskell-language-server-9.0.2
./bin/haskell-language-server-wrapper
```

You may want to copy these to a location already on your path, like

```
cp -R ./bin/* ~/.local/bin
```

(the `-R`, at least on this MacBook, copies the symlinks rather than follows them).

Note to self: here's how I made the freeze files:

```
cabal freeze --project-file mitchell.project -w ghc-$ver
mv mitchell.project.freeze mitchell.project.freeze-$ver
```
