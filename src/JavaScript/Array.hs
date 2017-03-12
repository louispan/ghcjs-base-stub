{-# LANGUAGE ForeignFunctionInterface, JavaScriptFFI #-}
module JavaScript.Array
    ( JSArray
    , MutableJSArray
    , create
    , length
    , lengthIO
    , null
    , fromList
    , fromListIO
    , toList
    , toListIO
    , index, (!)
    , read
    , write
    , append
    , push
    , pop
    , unshift
    , shift
    , reverse
    , take
    , takeIO
    , drop
    , dropIO
    , slice
    , sliceIO
    , freeze
    , unsafeFreeze
    , thaw
    , unsafeThaw
    ) where

import           Prelude hiding (length, drop, read, take, reverse, null)
import           GHCJS.Types

import           JavaScript.Array.Internal

(!) :: JSArray -> Int -> JSVal
x ! n = index n x
{-# INLINE (!) #-}
