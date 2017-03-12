{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE DefaultSignatures #-}
{- | Basic interop between Haskell and JavaScript.

     The principal type here is 'JSVal', which is a lifted type that contains
     a JavaScript reference. The 'JSVal' type is parameterized with one phantom
     type, and GHCJS.Types defines several type synonyms for specific variants.

     The code in this module makes no assumptions about 'JSVal a' types.
     Operations that can result in a JS exception that can kill a Haskell thread
     are marked unsafe (for example if the 'JSVal' contains a null or undefined
     value). There are safe variants where the JS exception is propagated as
     a Haskell exception, so that it can be handled on the Haskell side.

     For more specific types, like 'JSArray' or 'JSBool', the code assumes that
     the contents of the 'JSVal' actually is a JavaScript array or bool value.
     If it contains an unexpected value, the code can result in exceptions that
     kill the Haskell thread, even for functions not marked unsafe.

     The code makes use of `foreign import javascript', enabled with the
     `JavaScriptFFI` extension, available since GHC 7.8. There are three different
     safety levels:

      * unsafe: The imported code is run directly. returning an incorrectly typed
        value leads to undefined behaviour. JavaScript exceptions in the foreign
        code kill the Haskell thread.
      * safe: Returned values are replaced with a default value if they have
        the wrong type. JavaScript exceptions are caught and propagated as
        Haskell exceptions ('JSException'), so they can be handled with the
        standard "Control.Exception" machinery.
      * interruptible: The import is asynchronous. The calling Haskell thread
        sleeps until the foreign code calls the `$c` JavaScript function with
        the result. The thread is in interruptible state while blocked, so it
        can receive asynchronous exceptions.

     Unlike the FFI for native code, it's safe to call back into Haskell
     (`h$run`, `h$runSync`) from foreign code in any of the safety levels.
     Since JavaScript is single threaded, no Haskell threads can run while
     the foreign code is running.
 -}

module GHCJS.Foreign ( jsTrue
                     , jsFalse
                     , jsNull
                     , toJSBool
                     , fromJSBool
                     , jsUndefined
                     , isTruthy
                     , isNull
                     , isUndefined
                     , isObject
                     , isFunction
                     , isString
                     , isBoolean
                     , isSymbol
                     , isNumber
                     , jsTypeOf, JSType(..)
                     , jsonTypeOf, JSONType(..)
                     ) where

import           GHCJS.Types
import           GHCJS.Foreign.Internal
