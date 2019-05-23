import qualified Data.Binary.Get as G
import qualified Data.Binary.Put as P

toBinary :: Int -> [ Int ]
-- BASE CASE
toBinary 0 = [ 0 ]
-- DIVISION METHOD
toBinary n = toBinary ( n `quot` 2 ) ++ [ n `rem` 2 ]

bintodec :: Integral i => i -> i
-- BASE CASE
bintodec 0 = 0
-- INVERSION OF THE DIVISION METHOD
bintodec i = 2 * bintodec (div i 10) + (mod i 10)

main = do
  print(toBinary 25)
  print(bintodec 011001)
