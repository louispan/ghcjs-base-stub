{-# LANGUAGE ForeignFunctionInterface, JavaScriptFFI, DataKinds, KindSignatures,
             PolyKinds, UnboxedTuples, GHCForeignImportPrim, DeriveDataTypeable,
             UnliftedFFITypes, MagicHash
  #-}
module JavaScript.Array.Internal where

import           Prelude hiding (length, reverse, drop, take)

import           Data.Typeable

import           GHCJS.Internal.Types
import qualified GHCJS.Prim as Prim
import           GHCJS.Types

newtype SomeJSArray (m :: MutabilityType s) = SomeJSArray JSVal
  deriving (Typeable)
instance IsJSVal (SomeJSArray m)

type JSArray        = SomeJSArray Immutable
type MutableJSArray = SomeJSArray Mutable

type STJSArray s    = SomeJSArray ('STMutable s)

create :: IO MutableJSArray
create = pure (SomeJSArray nullRef)
{-# INLINE create #-}

length :: JSArray -> Int
length _ = 0
{-# INLINE length #-}

lengthIO :: SomeJSArray m -> IO Int
lengthIO _ = pure 0
{-# INLINE lengthIO #-}

null :: JSArray -> Bool
null _ = True
{-# INLINE null #-}

append :: SomeJSArray m -> SomeJSArray m -> IO (SomeJSArray m1)
append _ _ = pure (SomeJSArray nullRef)
{-# INLINE append #-}

fromList :: [JSVal] -> JSArray
fromList _ = SomeJSArray nullRef
{-# INLINE fromList #-}

fromListIO :: [JSVal] -> IO (SomeJSArray m)
fromListIO _ = pure (SomeJSArray nullRef)
{-# INLINE fromListIO #-}

toList :: JSArray -> [JSVal]
toList _ = []
{-# INLINE toList #-}

toListIO :: SomeJSArray m -> IO [JSVal]
toListIO _ = pure []
{-# INLINE toListIO #-}

index :: Int -> JSArray -> JSVal
index _ _ = nullRef
{-# INLINE index #-}

read :: Int -> SomeJSArray m -> IO JSVal
read _ _ = pure nullRef
{-# INLINE read #-}

write :: Int -> JSVal -> MutableJSArray -> IO ()
write _ _ _ = pure ()
{-# INLINE write #-}

push :: JSVal -> MutableJSArray -> IO ()
push _ _ = pure ()
{-# INLINE push #-}

pop :: MutableJSArray -> IO JSVal
pop _  = pure nullRef
{-# INLINE pop #-}

unshift :: JSVal -> MutableJSArray -> IO ()
unshift _ _ = pure ()
{-# INLINE unshift #-}

shift :: MutableJSArray -> IO JSVal
shift _ = pure nullRef
{-# INLINE shift #-}

reverse :: MutableJSArray -> IO ()
reverse _ = pure ()
{-# INLINE reverse #-}

take :: Int -> JSArray -> JSArray
take _ _ = SomeJSArray nullRef
{-# INLINE take #-}

takeIO :: Int -> SomeJSArray m -> IO (SomeJSArray m1)
takeIO _ _ = pure (SomeJSArray nullRef)
{-# INLINE takeIO #-}

drop :: Int -> JSArray -> JSArray
drop _ _ = SomeJSArray nullRef
{-# INLINE drop #-}

dropIO :: Int -> SomeJSArray m -> IO (SomeJSArray m1)
dropIO _ _ = pure (SomeJSArray nullRef)
{-# INLINE dropIO #-}

sliceIO :: Int -> Int -> JSArray -> IO (SomeJSArray m1)
sliceIO _ _ _ = pure (SomeJSArray nullRef)
{-# INLINE sliceIO #-}

slice :: Int -> Int -> JSArray -> JSArray
slice _ _ _= SomeJSArray nullRef
{-# INLINE slice #-}

freeze :: MutableJSArray -> IO JSArray
freeze _ = pure (SomeJSArray nullRef)
{-# INLINE freeze #-}

unsafeFreeze :: MutableJSArray -> IO JSArray
unsafeFreeze (SomeJSArray x) = pure (SomeJSArray x)
{-# INLINE unsafeFreeze #-}

thaw :: JSArray -> IO MutableJSArray
thaw _ = pure (SomeJSArray nullRef)
{-# INLINE thaw #-}

unsafeThaw :: JSArray -> IO MutableJSArray
unsafeThaw (SomeJSArray x) = pure (SomeJSArray x)
{-# INLINE unsafeThaw #-}


-- -----------------------------------------------------------------------------
