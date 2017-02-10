module JavaScript.Object.Extras where

import Data.JSString
import GHCJS.Types
import JavaScript.Object

-- | A pure version of 'JavaScript.Object.unsafeGetProp'.
-- since it's already marked unsafe, we might as well lie about possible side effects too.
unsafeGetProp' :: JSString -> Object -> JSVal
unsafeGetProp' p o = js_unsafeGetProp' p o
{-# INLINE unsafeGetProp' #-}

foreign import javascript unsafe "$2[$1]"
  js_unsafeGetProp' :: JSString -> Object -> JSVal
