{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE CPP #-}

module GHCJS.Types ( JSVal
                   , WouldBlockException(..)
                   , JSException(..)
                   , IsJSVal
                   , jsval
                   , isNull
                   , isUndefined
                   , nullRef
                   , JSString
                   , mkRef
                   , Ref#
                   , toPtr
                   , fromPtr
                   , JSRef
                   ) where

import Foreign.Ptr

import Data.JSString.Internal.Type (JSString)
import GHCJS.Internal.Types

import GHCJS.Prim

import GHC.Exts

type Ref# = ByteArray#

mkRef :: ByteArray# -> JSVal
mkRef _ = nullRef

nullRef :: JSVal
nullRef = jsNull

toPtr :: JSVal -> Ptr a
toPtr _ = nullPtr

fromPtr :: Ptr a -> JSVal
fromPtr _ = nullRef

-- | This is a deprecated copmatibility wrapper for the old JSRef type.
--
-- See https://github.com/ghcjs/ghcjs/issues/421
type JSRef a = JSVal
{-# DEPRECATED JSRef "Use JSVal instead, or a more specific newtype wrapper of JSVal " #-}
