{-# LANGUAGE ForeignFunctionInterface, JavaScriptFFI, DeriveDataTypeable,
             UnboxedTuples, GHCForeignImportPrim, UnliftedFFITypes,
             MagicHash
  #-}

module JavaScript.Web.MessageEvent ( MessageEvent
                                   , getData
                                   , MessageEventData(..)
                                   ) where

import Data.Typeable

import JavaScript.Web.MessageEvent.Internal

import JavaScript.Web.Blob.Internal (Blob)
import JavaScript.TypedArray.ArrayBuffer.Internal (ArrayBuffer)
import Data.JSString.Internal.Type (JSString(..))


data MessageEventData = StringData      JSString
                      | BlobData        Blob
                      | ArrayBufferData ArrayBuffer
  deriving (Typeable)

getData :: MessageEvent -> MessageEventData
getData = undefined
