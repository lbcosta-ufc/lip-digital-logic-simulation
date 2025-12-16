module Main where

import Circuits

-- | Helper to print streams
showStream :: String -> [Int] -> Int -> IO ()
showStream name s n = do
  putStrLn name
  mapM_ (\x -> putStrLn $ "  " ++ show x) (take n s)

main :: IO ()
main = do
  -- Input Signals (infinite lists)
  let s1 = cycle [0, 0, 1, 1, 0, 1, 0, 1]
  let s2 = cycle [0, 1, 0, 1, 1, 1, 0, 0]
  let s3 = cycle [0, 0, 0, 0, 1, 1, 1, 1]

  -- Test Half Adder
  let (haSum, haCarry) = halfAdder s1 s2

  -- Test Mux4
  let mux4Y = mux4 s1 s2 s3 s1 s2 s3

  -- Test Mux2
  let muxY = mux2 s1 s2 s3

  putStrLn "--- Digital Logic Simulation (Haskell) ---"
  
  putStrLn "Inputs:"
  putStrLn "S1: 0 0 1 1 0 1 0 1 ..."
  putStrLn "S2: 0 1 0 1 1 1 0 0 ..."
  putStrLn "S3: 0 0 0 0 1 1 1 1 ..."

  putStrLn "\n--- Half Adder (S1, S2) ---"
  showStream "Sum:" haSum 8
  showStream "Carry:" haCarry 8

  putStrLn "\n--- Mux4 (D0=S1, D1=S2, D2=S3, D3=S1, S0=S2, S1=S3) ---"
  showStream "Output:" mux4Y 8

  putStrLn "\n--- Mux2 (D0=S1, D1=S2, Sel=S3) ---"
  showStream "Output:" muxY 8
