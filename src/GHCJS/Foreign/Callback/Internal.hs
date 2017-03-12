{-# LANGUAGE DeriveDataTypeable #-}

module GHCJS.Foreign.Callback.Internal where

import GHCJS.Types

import Data.Typeable

newtype Callback a = Callback JSVal deriving Typeable
instance IsJSVal (Callback a)
