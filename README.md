[![Hackage](https://img.shields.io/hackage/v/ghcjs-base-stub.svg)](https://hackage.haskell.org/package/ghcjs-base-stub)

Fake stubs for GHCJS base to allow GHCJS projects to be compiled using GHC.
This also allows developing under intero, and generating haddocks.

Usage:

Add the following to GHCJS project's cabal.
```
  if impl(ghcjs)
    build-depends: ghcjs-base
  if !impl(ghcjs)
    build-depends: ghcjs-base-stub
```