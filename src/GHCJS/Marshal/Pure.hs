{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveDataTypeable #-}

{-
  experimental pure marshalling for lighter weight interaction in the quasiquoter
 -}
module GHCJS.Marshal.Pure ( PFromJSVal(..)
                          , PToJSVal(..)
                          ) where

import           Data.Int (Int8, Int16, Int32)
import           Data.JSString.Internal.Type
import           Data.Text (Text)
import           Data.Word (Word8, Word16, Word32, Word)
import           Data.JSString as JSS
import           Data.JSString.Text

import           GHCJS.Types
import qualified GHCJS.Prim as Prim
import           GHCJS.Foreign.Internal
import           GHCJS.Marshal.Internal

{-
type family IsPureShared a where
  IsPureShared PureExclusive = False
  IsPureShared PureShared    = True

type family IsPureExclusive a where
  IsPureExclusive PureExclusive = True
  IsPureExclusive PureShared    = True
  -}

instance PFromJSVal JSVal where pFromJSVal = id
                                {-# INLINE pFromJSVal #-}
instance PFromJSVal ()    where pFromJSVal _ = ()
                                {-# INLINE pFromJSVal #-}

instance PFromJSVal JSString where pFromJSVal _ = JSS.empty
                                   {-# INLINE pFromJSVal #-}
instance PFromJSVal [Char] where pFromJSVal   = Prim.fromJSString
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Text   where pFromJSVal   = textFromJSVal
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Char   where pFromJSVal _ = '?'
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Bool   where pFromJSVal _ = False
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Int    where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Int8   where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Int16  where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Int32  where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Word   where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Word8  where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Word16 where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Word32 where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Float  where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}
instance PFromJSVal Double where pFromJSVal _ = 0
                                 {-# INLINE pFromJSVal #-}

instance PFromJSVal a => PFromJSVal (Maybe a) where
    pFromJSVal x | isUndefined x || isNull x = Nothing
    pFromJSVal x = Just (pFromJSVal x)
    {-# INLINE pFromJSVal #-}

instance PToJSVal JSVal     where pToJSVal = id
                                  {-# INLINE pToJSVal #-}
instance PToJSVal JSString  where pToJSVal          = jsval
                                  {-# INLINE pToJSVal #-}
instance PToJSVal [Char]    where pToJSVal          = Prim.toJSString
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Text      where pToJSVal          = jsval . textToJSString
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Char      where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Bool      where pToJSVal True     = jsTrue
                                  pToJSVal False    = jsFalse
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Int       where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Int8      where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Int16     where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Int32     where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Word      where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Word8     where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Word16    where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Word32    where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Float     where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}
instance PToJSVal Double    where pToJSVal _ = nullRef
                                  {-# INLINE pToJSVal #-}

instance PToJSVal a => PToJSVal (Maybe a) where
    pToJSVal Nothing  = jsNull
    pToJSVal (Just a) = pToJSVal a
    {-# INLINE pToJSVal #-}
