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

import Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import Data.IORef (IORef, modifyIORef, newIORef, readIORef, writeIORef)
import Data.JSString
import System.IO.Unsafe (unsafePerformIO)

newtype Storage = Storage (IORef (Map JSString JSString))

localStorage :: Storage
localStorage = Storage . unsafePerformIO $ newIORef mempty
{-# NOINLINE localStorage #-}

sessionStorage :: Storage
sessionStorage = Storage . unsafePerformIO $ newIORef mempty
{-# NOINLINE sessionStorage #-}

getLength :: Storage -> IO Int
getLength (Storage s) = M.size <$> readIORef s

getIndex :: Int -> Storage -> IO (Maybe JSString)
getIndex i (Storage s) = do
    m <- readIORef s
    if i >= 0 && i < M.size m
        then Just $ M.elemAt i m
        else Nothing

getItem :: JSString -> Storage -> IO (Maybe JSString)
getItem key (Storage s) = M.lookup key <$> readIORef s

setItem :: JSString -> JSString -> Storage -> IO ()
setItem key val (Storage s) = modifyIORef s $ M.insert key val

removeItem :: JSString -> Storage -> IO ()
removeItem key (Storage s) = modifyIORef s $ M.delete key

clear :: Storage -> IO ()
clear (Storage s) = writeIORef s mempty
