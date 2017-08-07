{-# LANGUAGE ForeignFunctionInterface, JavaScriptFFI, DataKinds, KindSignatures,
             PolyKinds, UnboxedTuples, GHCForeignImportPrim, DeriveDataTypeable,
             UnliftedFFITypes, MagicHash, TypeSynonymInstances, FlexibleInstances
  #-}

module JavaScript.TypedArray.ArrayBuffer.Internal where

import GHCJS.Types

import GHCJS.Internal.Types
import GHCJS.Marshal.Pure

import Data.Typeable

newtype SomeArrayBuffer (a :: MutabilityType s) =
  SomeArrayBuffer JSVal deriving Typeable
instance IsJSVal (SomeArrayBuffer m)

type ArrayBuffer           = SomeArrayBuffer Immutable
type MutableArrayBuffer    = SomeArrayBuffer Mutable
type STArrayBuffer s       = SomeArrayBuffer ('STMutable s)

instance PToJSVal MutableArrayBuffer where
  pToJSVal (SomeArrayBuffer b) = b
instance PFromJSVal MutableArrayBuffer where
  pFromJSVal = SomeArrayBuffer
