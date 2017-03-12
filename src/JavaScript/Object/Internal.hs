{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE JavaScriptFFI #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE GHCForeignImportPrim #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE UnliftedFFITypes #-}

module JavaScript.Object.Internal
    ( Object(..)
    , create
    , allProps
    , listProps
    , getProp
    , unsafeGetProp
    , setProp
    , unsafeSetProp
    , isInstanceOf
    ) where

import           Data.JSString
import           Data.Typeable

import qualified GHCJS.Prim                as Prim
import           GHCJS.Types

import qualified JavaScript.Array          as JA
import           JavaScript.Array.Internal (JSArray)

newtype Object = Object JSVal deriving (Typeable)
instance IsJSVal Object

-- | create an empty object
create :: IO Object
create = pure (Object nullRef)
{-# INLINE create #-}

allProps :: Object -> IO JSArray
allProps _ = pure $ JA.fromList []
{-# INLINE allProps #-}

listProps :: Object -> IO [JSString]
listProps _ = pure []
{-# INLINE listProps #-}

{- | get a property from an object. If accessing the property results in
     an exception, the exception is converted to a JSException. Since exception
     handling code prevents some optimizations in some JS engines, you may want
     to use unsafeGetProp instead
 -}
getProp :: JSString -> Object -> IO JSVal
getProp _ _ = pure nullRef
{-# INLINE getProp #-}

unsafeGetProp :: JSString -> Object -> IO JSVal
unsafeGetProp _ _ = pure nullRef
{-# INLINE unsafeGetProp #-}

setProp :: JSString -> JSVal -> Object -> IO ()
setProp _ _ _ = pure ()
{-# INLINE setProp #-}

unsafeSetProp :: JSString -> JSVal -> Object -> IO ()
unsafeSetProp _ _ _ = pure ()
{-# INLINE unsafeSetProp #-}

isInstanceOf :: Object -> JSVal -> Bool
isInstanceOf _ _ = False
{-# INLINE isInstanceOf #-}
