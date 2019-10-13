module JavaScript.Web.Storage
    ( localStorage
    , sessionStorage
    , Storage
    , getLength
    , getIndex
    , getItem
    , setItem
    , removeItem
    , clear
    ) where

import GHCJS.Types

import Data.JSString
import Data.JSString.Internal.Type

import JavaScript.Web.Storage.Internal

localStorage :: Storage
localStorage = Storage nullRef
{-# INLINE localStorage #-}

sessionStorage :: Storage
sessionStorage = Storage nullRef
{-# INLINE sessionStorage #-}

getLength :: Storage -> IO Int
getLength _ = pure 0
{-# INLINE getLength #-}

getIndex :: Int -> Storage -> IO (Maybe JSString)
getIndex _ _ = pure Nothing
{-# INLINE getIndex #-}

getItem :: JSString -> Storage -> IO (Maybe JSString)
getItem _ _ = pure Nothing
{-# INLINE getItem #-}

setItem :: JSString -> JSString -> Storage -> IO ()
setItem _ _ _ = pure ()
{-# INLINE setItem #-}

removeItem :: JSString -> Storage -> IO ()
removeItem _ _ = pure ()
{-# INLINE removeItem #-}

clear :: Storage -> IO ()
clear _ = pure ()
{-# INLINE clear #-}
