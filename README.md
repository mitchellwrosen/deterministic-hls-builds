This repo contains some files to build HLS the way I want it:

  - With a pinned version of `ormolu` (0.4.0.0), and, in fact, every transitive dependency.
  - Without plugins I don't use: `hlint` and other formatters that aren't `ormolu`.

Run `./build.sh` and you will end up with these (symlinks to) executables:

```
./bin/haskell-language-server-8.10.7
./bin/haskell-language-server-9.0.2
./bin/haskell-language-server-9.2.2
./bin/haskell-language-server-wrapper
```

If you get "missing ffitarget_x86.h" when building with 9.2.2, maybe you're on a Mac and are hitting this issue:

- https://gitlab.haskell.org/ghc/ghc/-/issues/21211

If so, re-run as:

```
C_INCLUDE_PATH="$(xcrun --show-sdk-path)/usr/include/ffi" ./build.sh
```

You may want to copy these to a location already on your path, like

```
# Linux-flavored cp
cp -P ./bin/* ~/.local/bin

# BSD-flavored cp
cp -R ./bin/* ~/.local/bin
```

(the `-P` / `-R` copies the symlinks rather than follows them).

Note to self: There's a `./freeze.sh` that makes the freeze files committed to this repo.
