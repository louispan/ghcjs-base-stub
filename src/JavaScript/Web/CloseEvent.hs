module JavaScript.Web.CloseEvent ( CloseEvent
                                 , getCode
                                 , getReason
                                 , wasClean
                                 ) where

import Data.JSString

import JavaScript.Web.CloseEvent.Internal

getCode :: CloseEvent -> Int
getCode = undefined

getReason :: CloseEvent -> JSString
getReason = undefined

wasClean :: CloseEvent -> Bool
wasClean = undefined
