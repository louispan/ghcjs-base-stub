module JavaScript.TypedArray.ArrayBuffer
    ( ArrayBuffer
    , MutableArrayBuffer
    , freeze, unsafeFreeze
    , thaw, unsafeThaw
    , byteLength
    ) where
import JavaScript.TypedArray.ArrayBuffer.Internal

freeze :: MutableArrayBuffer -> IO ArrayBuffer
freeze = undefined

unsafeFreeze :: MutableArrayBuffer -> IO ArrayBuffer
unsafeFreeze = undefined

thaw :: ArrayBuffer -> IO MutableArrayBuffer
thaw = undefined

unsafeThaw :: ArrayBuffer -> IO MutableArrayBuffer
unsafeThaw = undefined

byteLength :: SomeArrayBuffer any -> Int
byteLength = undefined

