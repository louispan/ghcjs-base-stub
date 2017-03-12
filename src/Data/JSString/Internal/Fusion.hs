module Data.JSString.Internal.Fusion ( -- * Types
                                       Stream(..)
                                     , Step(..)

                                       -- * Creation and elimination
                                     , stream
                                     , unstream
                                     , reverseStream

                                     , length

                                       -- * Transformations
                                     , reverse

                                       -- * Construction
                                       -- ** Scans
                                     , reverseScanr

                                       -- ** Accumulating maps
                                     , mapAccumL

                                       -- ** Generation and unfolding
                                     , unfoldrN

                                       -- * Indexing
                                     , index
                                     , findIndex
                                     , countChar
                                     ) where

import Prelude hiding (length, reverse)

import Data.JSString.Internal.Type

import qualified Data.Text.Internal.Fusion as T
import Data.Text.Internal.Fusion (Stream(..), Step(..))

-- | /O(n)/ Convert a 'JSString' into a 'Stream Char'.
stream :: JSString -> Stream Char
stream (JSString t) = T.stream t
{-# INLINE [0] stream #-}

-- | /O(n)/ Convert a 'JSString' into a 'Stream Char', but iterate
-- backwards.
reverseStream :: JSString -> Stream Char
reverseStream (JSString x) = T.reverseStream x
{-# INLINE [0] reverseStream #-}

-- | /O(n)/ Convert a 'Stream Char' into a 'JSString'.
unstream :: Stream Char -> JSString
unstream strm = JSString $ T.unstream strm
{-# INLINE [0] unstream #-}
{-# RULES "STREAM stream/unstream fusion" forall s. stream (unstream s) = s #-}


-- ----------------------------------------------------------------------------
-- * Basic stream functions

length :: Stream Char -> Int
length = T.length
{-# INLINE[0] length #-}

-- | /O(n)/ Reverse the characters of a string.
reverse :: Stream Char -> JSString
reverse = JSString . T.reverse
{-# INLINE [0] reverse #-}

-- | /O(n)/ Perform the equivalent of 'scanr' over a list, only with
-- the input and result reversed.
reverseScanr :: (Char -> Char -> Char) -> Char -> Stream Char -> Stream Char
reverseScanr = T.reverseScanr
{-# INLINE reverseScanr #-}

-- | /O(n)/ Like 'unfoldr', 'unfoldrN' builds a stream from a seed
-- value. However, the length of the result is limited by the
-- first argument to 'unfoldrN'. This function is more efficient than
-- 'unfoldr' when the length of the result is known.
unfoldrN :: Int -> (a -> Maybe (Char,a)) -> a -> Stream Char
unfoldrN = T.unfoldrN
{-# INLINE [0] unfoldrN #-}

-------------------------------------------------------------------------------
-- ** Indexing streams

-- | /O(n)/ stream index (subscript) operator, starting from 0.
index :: Stream Char -> Int -> Char
index = T.index
{-# INLINE [0] index #-}

-- | The 'findIndex' function takes a predicate and a stream and
-- returns the index of the first element in the stream
-- satisfying the predicate.
findIndex :: (Char -> Bool) -> Stream Char -> Maybe Int
findIndex = T.findIndex
{-# INLINE [0] findIndex #-}

-- | /O(n)/ The 'count' function returns the number of times the query
-- element appears in the given stream.
countChar :: Char -> Stream Char -> Int
countChar = T.countChar
{-# INLINE [0] countChar #-}

-- | /O(n)/ Like a combination of 'map' and 'foldl''. Applies a
-- function to each element of a 'Text', passing an accumulating
-- parameter from left to right, and returns a final 'JSString'.
mapAccumL :: (a -> Char -> (a, Char)) -> a -> Stream Char -> (a, JSString)
mapAccumL f z strm = JSString <$> T.mapAccumL f z strm
{-# INLINE [0] mapAccumL #-}
