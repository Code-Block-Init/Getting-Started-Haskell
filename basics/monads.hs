half x = x/2
half2 x = (x `div` 2, "hello ig" ++ (show x) ++ "!")

{-writing monad-}
data Writer w a = Writer { runWriter :: (a,w) }

main x = if even x
	then Just (x `div` 2)
	else Nothing
