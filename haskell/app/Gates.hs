module Gates where

-- | Logic Gates implementation using lazy streams (lists)

-- | AND Gate
andG :: [Int] -> [Int] -> [Int]
andG = zipWith (\x y -> x * y)

-- | OR Gate
orG :: [Int] -> [Int] -> [Int]
orG = zipWith (\x y -> x + y - x * y)

-- | NAND Gate
nandG :: [Int] -> [Int] -> [Int]
nandG = zipWith (\x y -> 1 - x * y)

-- | NOR Gate
norG :: [Int] -> [Int] -> [Int]
norG = zipWith (\x y -> 1 - x - y + x * y)

-- | XOR Gate
xorG :: [Int] -> [Int] -> [Int]
xorG = zipWith (\x y -> x + y - 2 * x * y)

-- | NOT Gate
notG :: [Int] -> [Int]
notG = map (1 -)
