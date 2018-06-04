{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Data.JSString.Internal.Type where

import Control.DeepSeq (NFData(..))
import Data.Data
import qualified Data.Text as T
import GHC.Exts as Exts
import GHCJS.Internal.Types
import GHCJS.Prim

#if MIN_VERSION_base(4,11,0)
newtype JSString = JSString T.Text
    deriving (Exts.IsString, Monoid, Semigroup, Eq, Ord, Data, Show, Read)
#else
newtype JSString = JSString T.Text
    deriving (Exts.IsString, Monoid, Eq, Ord, Data, Show, Read)
#endif

instance IsJSVal JSString where
    jsval_ _ = JSVal ()

instance NFData JSString where
    rnf !_ = ()
