module JavaScript.Web.Storage where

import Data.JSString

data Storage

localStorage :: Storage
localStorage = undefined

getItem :: JSString -> Storage -> IO (Maybe JSString)
getItem = undefined

setItem :: JSString -> JSString -> Storage -> IO ()
setItem = undefined

