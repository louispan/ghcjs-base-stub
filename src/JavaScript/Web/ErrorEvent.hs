module JavaScript.Web.ErrorEvent ( ErrorEvent
                                 , message
                                 , filename
                                 , lineno
                                 , colno
                                 , error
                                 ) where

import Prelude hiding (error)

import GHCJS.Types

import JavaScript.Web.ErrorEvent.Internal

message :: ErrorEvent -> JSString
message = undefined

filename :: ErrorEvent -> JSString
filename = undefined

lineno :: ErrorEvent -> Int
lineno = undefined

colno :: ErrorEvent -> Int
colno = undefined

error :: ErrorEvent -> JSVal
error = undefined
