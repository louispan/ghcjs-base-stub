module Data.JSString.Text
    ( textToJSString
    , textFromJSString
    , lazyTextToJSString
    , lazyTextFromJSString
    , textFromJSVal
    , lazyTextFromJSVal
    ) where

import GHCJS.Prim

import Data.JSString.Internal.Type

import qualified Data.Text as T
import qualified Data.Text.Lazy as TL


textToJSString :: T.Text -> JSString
textToJSString = JSString
{-# INLINE textToJSString #-}

textFromJSString :: JSString -> T.Text
textFromJSString (JSString t) = t
{-# INLINE  textFromJSString #-}

lazyTextToJSString :: TL.Text -> JSString
lazyTextToJSString t = JSString $ TL.toStrict t
{-# INLINE lazyTextToJSString #-}

lazyTextFromJSString :: JSString -> TL.Text
lazyTextFromJSString (JSString t) = TL.fromStrict t
{-# INLINE lazyTextFromJSString #-}

-- | returns the empty Text if not a string
textFromJSVal :: JSVal -> T.Text
textFromJSVal _ = T.empty
{-# INLINE textFromJSVal #-}

-- | returns the empty Text if not a string
lazyTextFromJSVal :: JSVal -> TL.Text
lazyTextFromJSVal _ = TL.empty
{-# INLINE lazyTextFromJSVal #-}
