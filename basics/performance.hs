import System.Environment
import Text.Printf
mean :: [Double] -> Double
mean ig = sum ig / fromIntegral (length ig)

main = do
	[ig_ig] <- map read `fmap` getArgs
	printf "%f\n" (mean [1 .. ig_ig])

{-

## EXECUTION

dell@DELL3521 ~
$ cd "/d/haskell/2014.2.0.0/bin"

dell@DELL3521 /d/haskell/2014.2.0.0/bin
$ ghc -O2 --make basics/performance.hs
[1 of 1] Compiling Main             ( basics\performance.hs, basics\performance.
o )
Linking basics\performance.exe ...

dell@DELL3521 /d/haskell/2014.2.0.0/bin
$ time ./basics/performance 1e9

-}
