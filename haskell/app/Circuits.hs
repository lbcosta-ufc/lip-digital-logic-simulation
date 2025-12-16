module Circuits where

import Gates

-- | Half Adder
-- Inputs: A, B
-- Outputs: (Sum, Carry)
halfAdder :: [Int] -> [Int] -> ([Int], [Int])
halfAdder a b = (sumVal, carry)
  where
    sumVal = xorG a b
    carry = andG a b

-- | 2-to-1 Multiplexer
-- Inputs: D0, D1, S
-- Output: Y
mux2 :: [Int] -> [Int] -> [Int] -> [Int]
mux2 d0 d1 s = y
  where
    notS = notG s
    and0 = andG d0 notS
    and1 = andG d1 s
    y = orG and0 and1

-- | 4-to-1 Multiplexer
-- Inputs: D0, D1, D2, D3, S0, S1
-- Output: Y
mux4 :: [Int] -> [Int] -> [Int] -> [Int] -> [Int] -> [Int] -> [Int]
mux4 d0 d1 d2 d3 s0 s1 = y
  where
    y0 = mux2 d0 d1 s0
    y1 = mux2 d2 d3 s0
    y = mux2 y0 y1 s1
