[![Hackage](https://img.shields.io/hackage/v/ghcjs-base-stub.svg)](https://hackage.haskell.org/package/ghcjs-base-stub)
[![Build Status](https://secure.travis-ci.org/louispan/ghcjs-base-stub.png?branch=master)](http://travis-ci.org/louispan/ghcjs-base-stub)

# Motivation

Javascript projects using GHCJS must use [ghcjs-base](https://github.com/ghcjs/ghcjs-base), which cannot be compiled by GHC as it requires JavaScriptFFI.
This package is is drop-in-replacement (same type signature, module namespace) for ghcjs-base that can be compiled in GHC.

When using GHCJS to compile, the original modules from ghjs-base is exported.

When using GHC to compile, fake stubs are emitted for all the ghcjs-base javascript functions, so this is not meant for production use with GHC.

However, this will allow tooling (such as intero, generating haddocks) to use the much faster GHC to compile GHCJS projects.


# Prod GHC use case

For project that need to compile to both GHC and GHCJS for production,  consider using [jsaddle](https://github.com/ghcjs/jsaddle),
which compiles to [ghcjs-dom](https://github.com/ghcjs/ghcjs-dom) under GHC.
However, the type signatures will change as the the IO monad becomes the [JSM](http://hackage.haskell.org/package/jsaddle-0.9.6.0/docs/Language-Javascript-JSaddle-Types.html#t:JSM) monad.

# Usage

In your project cabal file, instead of using ghcjs-base, use ghcjs-base-stub
```
build-depends: ghcjs-base-stub
```

Version 0.1.x.x of ghjc-base-stub did not re-export the original ghcjs-base when compiling under GHCJS.
Version 0.2.x.x re-exports ghjs-base so that `cabal.project` does not need preprocesisng to select which ghcjs base library to use.

# Pull requests

This package is actually missing a few ghcjs-base modules that I have not got around to stubbing.
Pull requests are welcome if you need those extra stubs.
When making a stub, please do not create partial functions, just emit safe stubbed values.
Eg. Bad

```
foo :: IO JSVal
foo = undefined
```

Better
```
foo :: IO JSVal
foo = pure nullRef
```

# How to build manually

```
git clone https://github.com/louispan/ghcjs-base-stub
cd ghcjs-base
git submodule update --init --recursive
```
