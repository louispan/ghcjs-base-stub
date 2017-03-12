{-# OPTIONS_GHC -Wno-redundant-constraints #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE JavaScriptFFI #-}
{-# LANGUAGE UnliftedFFITypes #-}
{-# LANGUAGE GHCForeignImportPrim #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE EmptyDataDecls #-}

{- |
     Dynamically export Haskell values to JavaScript
 -}

module GHCJS.Foreign.Export
    ( Export
    , export
    , withExport
    , derefExport
    , releaseExport
    ) where

import Data.Typeable

import GHCJS.Prim
import GHCJS.Types

newtype Export a = Export JSVal
instance IsJSVal (Export a)

{- |
     Export any Haskell value to a JavaScript reference without evaluating it.
     The JavaScript reference can be passed to foreign code and used to retrieve
     the value later.

     The data referenced by the value will be kept in memory until you call
     'releaseExport', even if no foreign code references the export anymore.
 -}
export :: Typeable a => a -> IO (Export a)
export _ = pure (Export nullRef)

{- |
     Export the value and run the action. The value is only exported for the
     duration of the action. Dereferencing it after the 'withExport' call
     has returned will always return 'Nothing'.
 -}
-- fixme is this safe with nested exports?
withExport :: Typeable a => a -> (Export a -> IO b) -> IO b
withExport _ f = f (Export nullRef)

{- |
     Retrieve the Haskell value from an export. Returns 'Nothing' if the
     type does not match or the export has already been released.
 -}

derefExport :: forall a. Typeable a => Export a -> IO (Maybe a)
derefExport _ = pure Nothing

{- |
     Release all memory associated with the export. Subsequent calls to
     'derefExport' will return 'Nothing'
 -}
releaseExport :: Export a -> IO ()
releaseExport _ = pure ()

-- ----------------------------------------------------------------------------
