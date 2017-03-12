{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Data.JSString.Internal.Type where

import           Control.DeepSeq                      (NFData(..))
import           Data.Data
import qualified Data.Text as T
import           GHC.Exts as Exts
import           GHCJS.Internal.Types
import           GHCJS.Prim

newtype JSString = JSString T.Text
    deriving (Exts.IsString, Monoid, Eq, Ord, Data, Show, Read)

instance IsJSVal JSString where
    jsval_ _ = JSVal ()

instance NFData JSString where
    rnf !_ = ()
