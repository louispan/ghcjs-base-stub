{-# LANGUAGE DeriveDataTypeable #-}

module JavaScript.Web.Location ( Location(..)
                               , getWindowLocation
                               , getHref
                               , setHref
                               , getProtocol
                               , setProtocol
                               , getHost
                               , setHost
                               , getHostname
                               , setHostname
                               , getPort
                               , setPort
                               , getPathname
                               , setPathname
                               , getSearch
                               , setSearch
                               , getHash
                               , setHash
                               , getUsername
                               , setUsername
                               , getPassword
                               , setPassword
                               , getOrigin
                               , assign
                               , reload
                               , replace
                               ) where

import           Data.Typeable

import           Data.JSString (JSString)

import           GHCJS.Types

newtype Location = Location JSVal deriving (Typeable)
instance IsJSVal Location

getWindowLocation :: IO Location
getWindowLocation = undefined

getHref :: Location -> IO JSString
getHref = undefined

setHref :: JSString -> Location -> IO ()
setHref = undefined

getProtocol :: Location -> IO JSString
getProtocol = undefined

setProtocol :: JSString -> Location -> IO ()
setProtocol = undefined

getHost :: Location -> IO JSString
getHost = undefined

setHost :: JSString -> Location -> IO ()
setHost = undefined

getHostname :: Location -> IO JSString
getHostname = undefined

setHostname :: JSString -> Location -> IO ()
setHostname = undefined

getPort :: Location -> IO JSString
getPort = undefined

setPort :: JSString -> Location -> IO ()
setPort = undefined

getPathname :: Location -> IO JSString
getPathname = undefined

setPathname :: JSString -> Location -> IO ()
setPathname = undefined

getSearch :: Location -> IO JSString
getSearch = undefined

setSearch :: JSString -> Location -> IO ()
setSearch = undefined

getHash :: Location -> IO JSString
getHash = undefined

setHash :: JSString -> Location -> IO ()
setHash = undefined

getUsername :: Location -> IO JSString
getUsername = undefined

setUsername :: JSString -> Location -> IO ()
setUsername = undefined

getPassword :: Location -> IO JSString
getPassword = undefined

setPassword :: JSString -> Location -> IO ()
setPassword = undefined

getOrigin :: Location -> IO JSString
getOrigin = undefined

assign :: JSString -> Location -> IO ()
assign = undefined

reload :: Bool -> Location -> IO ()
reload = undefined

replace :: JSString -> Location -> IO ()
replace = undefined
