module GHCJS.Prim
    ( JSVal(..)
    , WouldBlockException(..)
    , JSException(..)
    , mkJSException
    , fromJSString
    , toJSString
    , toJSArray
    , fromJSArray
    , fromJSInt
    , toJSInt
    , isNull
    , isUndefined
    , jsNull
    , getProp
    , getProp'
    ) where

import           Data.Typeable (Typeable)
import           Unsafe.Coerce (unsafeCoerce)

import qualified GHC.Exception as Ex

--- START Shim-specific
{-
  JSVal is a boxed type that can be used as FFI
  argument or result.
-}
newtype JSVal = JSVal ()
--- END Shim-specific

{-
  When a JavaScript exception is raised inside
  a safe or interruptible foreign call, it is converted
  to a JSException
 -}
data JSException = JSException JSVal String
  deriving (Typeable)

instance Ex.Exception JSException

instance Show JSException where
  show (JSException _ xs) = "JavaScript exception: " ++ xs

mkJSException :: JSVal -> IO JSException
mkJSException ref =
  return (JSException (unsafeCoerce ref) (fromJSString ref))

{- | Low-level conversion utilities for packages that cannot
     depend on ghcjs-base
 -}

{- | returns an empty string if the JSVal does not contain
     a string
 -}
fromJSString :: JSVal -> String
fromJSString = const mempty
{-# INLINE fromJSString #-}

toJSString :: String -> JSVal
toJSString = const jsNull
{-# INLINE toJSString #-}

fromJSArray :: JSVal -> IO [JSVal]
fromJSArray = pure mempty
{-# INLINE fromJSArray #-}

toJSArray :: [JSVal] -> IO JSVal
toJSArray = const $ pure jsNull
{-# INLINE toJSArray #-}

{- | returns zero if the JSVal does not contain a number
 -}
fromJSInt :: JSVal -> Int
fromJSInt = const 0
{-# INLINE fromJSInt #-}

toJSInt :: Int -> JSVal
toJSInt = const jsNull
{-# INLINE toJSInt #-}

isNull :: JSVal -> Bool
isNull = const True
{-# INLINE isNull #-}

isUndefined :: JSVal -> Bool
isUndefined = const True
{-# INLINE isUndefined #-}

jsNull :: JSVal
jsNull = JSVal ()
{-# INLINE jsNull #-}

getProp :: JSVal -> String -> IO JSVal
getProp _ _ = pure jsNull
{-# INLINE getProp #-}

getProp' :: JSVal -> JSVal -> IO JSVal
getProp' _ _ = pure jsNull
{-# INLINE getProp' #-}

{- | If a synchronous thread tries to do something that can only
     be done asynchronously, and the thread is set up to not
     continue asynchronously, it receives this exception.
 -}
data WouldBlockException = WouldBlockException
  deriving (Typeable)

instance Show WouldBlockException where
  show _ = "thread would block"

instance Ex.Exception WouldBlockException
