{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE JavaScriptFFI #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE EmptyDataDecls #-}

module JavaScript.Web.Blob.Internal where

import Data.Typeable

import GHCJS.Types

data BlobType = BlobTypeBlob
              | BlobTypeFile

newtype SomeBlob (a :: BlobType) = SomeBlob JSVal deriving Typeable

type File = SomeBlob 'BlobTypeFile
type Blob = SomeBlob 'BlobTypeBlob
  
size :: SomeBlob a -> Int
size = undefined

contentType :: SomeBlob a -> JSString
contentType = undefined

slice :: Int -> Int -> JSString -> SomeBlob a -> SomeBlob a
slice = undefined

isClosed :: SomeBlob a -> IO Bool
isClosed = undefined

close :: SomeBlob a -> IO ()
close = undefined
