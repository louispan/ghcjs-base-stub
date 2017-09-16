{-# LANGUAGE OverloadedStrings #-}

module JavaScript.Web.Location ( Location
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

import Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import Data.IORef (IORef, modifyIORef, newIORef, readIORef)
import Data.JSString hiding (replace)
import System.IO.Unsafe (unsafePerformIO)

newtype Location = Location (IORef (Map JSString JSString))

windowLocation :: Location
windowLocation = Location . unsafePerformIO $ newIORef mempty
{-# NOINLINE windowLocation #-}

getWindowLocation :: IO Location
getWindowLocation = pure windowLocation

getHref :: Location -> IO JSString
getHref (Location l) = (M.! "href") <$> readIORef l

setHref :: JSString -> Location -> IO ()
setHref v (Location l) = modifyIORef l $ M.insert "href" v

getProtocol :: Location -> IO JSString
getProtocol (Location l) = (M.! "protocol") <$> readIORef l

setProtocol :: JSString -> Location -> IO ()
setProtocol v (Location l) = modifyIORef l $ M.insert "protocol" v

getHost :: Location -> IO JSString
getHost (Location l) = (M.! "host") <$> readIORef l

setHost :: JSString -> Location -> IO ()
setHost v (Location l) = modifyIORef l $ M.insert "host" v

getHostname :: Location -> IO JSString
getHostname (Location l) = (M.! "hostname") <$> readIORef l

setHostname :: JSString -> Location -> IO ()
setHostname v (Location l) = modifyIORef l $ M.insert "hostname" v

getPort :: Location -> IO JSString
getPort (Location l) = (M.! "port") <$> readIORef l

setPort :: JSString -> Location -> IO ()
setPort v (Location l) = modifyIORef l $ M.insert "port" v

getPathname :: Location -> IO JSString
getPathname (Location l) = (M.! "pathname") <$> readIORef l

setPathname :: JSString -> Location -> IO ()
setPathname v (Location l) = modifyIORef l $ M.insert "pathname" v

getSearch :: Location -> IO JSString
getSearch (Location l) = (M.! "search") <$> readIORef l

setSearch :: JSString -> Location -> IO ()
setSearch v (Location l) = modifyIORef l $ M.insert "search" v

getHash :: Location -> IO JSString
getHash (Location l) = (M.! "hash") <$> readIORef l

setHash :: JSString -> Location -> IO ()
setHash v (Location l) = modifyIORef l $ M.insert "hash" v

getUsername :: Location -> IO JSString
getUsername (Location l) = (M.! "username") <$> readIORef l

setUsername :: JSString -> Location -> IO ()
setUsername v (Location l) = modifyIORef l $ M.insert "username" v

getPassword :: Location -> IO JSString
getPassword (Location l) = (M.! "password") <$> readIORef l

setPassword :: JSString -> Location -> IO ()
setPassword v (Location l) = modifyIORef l $ M.insert "password" v

getOrigin :: Location -> IO JSString
getOrigin (Location l) = (M.! "origin") <$> readIORef l

assign :: JSString -> Location -> IO ()
assign _ _ = error "JavaScript.Web.Location.assign"

reload :: Bool -> Location -> IO ()
reload _ _ = error "JavaScript.Web.Location.reload"

replace :: JSString -> Location -> IO ()
replace _ _ = error "JavaScript.Web.Location.replace"
