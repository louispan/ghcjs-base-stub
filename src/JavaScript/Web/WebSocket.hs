{-# LANGUAGE DeriveDataTypeable #-}

module JavaScript.Web.WebSocket ( WebSocket
                                , WebSocketRequest(..)
                                , ReadyState(..)
                                , BinaryType(..)
                                , connect
                                , close
                                , send
                                , sendArrayBuffer
                                , sendBlob
                                , getBufferedAmount
                                , getExtensions
                                , getProtocol
                                , getReadyState
                                , getBinaryType
                                , setBinaryType
                                , getUrl
                                ) where

import           Data.Data

import           Data.JSString (JSString)

import           JavaScript.TypedArray.ArrayBuffer (ArrayBuffer)
import           JavaScript.Web.Blob (Blob)
import           JavaScript.Web.MessageEvent
import           JavaScript.Web.CloseEvent


data WebSocketRequest = WebSocketRequest
  { url       :: JSString
  , protocols :: [JSString]
  , onClose   :: Maybe (CloseEvent -> IO ()) -- ^ called when the connection closes (at most once)
  , onMessage :: Maybe (MessageEvent -> IO ()) -- ^ called for each message
  }

data WebSocket

data ReadyState = Connecting | Open | Closing | Closed
  deriving (Data, Typeable, Enum, Eq, Ord, Show)

data BinaryType = Blob | ArrayBuffer
  deriving (Data, Typeable, Enum, Eq, Ord, Show)

{- | create a WebSocket -} 
connect :: WebSocketRequest -> IO WebSocket
connect = undefined

{- | close a websocket and release the callbacks -}
close :: Maybe Int -> Maybe JSString -> WebSocket -> IO ()
close = undefined

send :: JSString -> WebSocket -> IO ()
send = undefined

sendBlob :: Blob -> WebSocket -> IO ()
sendBlob = undefined

sendArrayBuffer :: ArrayBuffer -> WebSocket -> IO ()
sendArrayBuffer = undefined

getBufferedAmount :: WebSocket -> IO Int
getBufferedAmount = undefined

getExtensions :: WebSocket -> IO JSString
getExtensions = undefined

getProtocol :: WebSocket -> IO JSString
getProtocol = undefined

getReadyState :: WebSocket -> IO ReadyState
getReadyState = undefined

getBinaryType :: WebSocket -> IO BinaryType
getBinaryType = undefined

getUrl :: WebSocket -> JSString
getUrl = undefined

setBinaryType :: BinaryType -> WebSocket -> IO ()
setBinaryType = undefined

