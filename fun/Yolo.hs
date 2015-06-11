{-# LANGUAGE GADTs #-}
module Yolo where
 
import System.IO.Unsafe
 
class Yolo f where
  yolo :: f a -> a
 
instance Yolo Maybe where
  yolo (Just x) = x
 
instance Yolo (Either a) where
  yolo (Right x) = x
 
instance Yolo ([]) where yolo = head
 
data ReadMe a = Read a => ReadMe String
 
instance Yolo ReadMe where
    yolo (ReadMe s) = read s
 
 
instance Yolo IO where
  yolo = unsafePerformIO

-- > yolo (Just 3)
-- 3
-- > yolo (Right 3)
-- 3
-- > take 5 $ yolo (readFile "Yolo.hs")
-- "{-# L"}"
-- > yolo (ReadMe "5" :: ReadMe Int)
-- 5

{-
ref:
https://gist.github.com/nkpart/8922083d3c18a8f777b8
-}

{--

-- CHECKING --

dell@DELL3521 ~
$ cd "/d/haskell/2014.2.0.0/bin"

dell@DELL3521 /d/haskell/2014.2.0.0/bin
$ ghc -O2 fun/Yolo.hs
[1 of 1] Compiling Yolo             ( fun\Yolo.hs, fun\Yolo.o )

--}
