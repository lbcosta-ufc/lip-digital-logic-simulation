functor
import
   Application
   System
   Gates
   Circuits
define
   % Helper to print streams
   proc {ShowStream Name S N}
      {System.showInfo Name}
      proc {Loop S I}
         if I =< N then
            case S of X|Xr then
               {System.showInfo "  "#X}
               {Loop Xr I+1}
            end
         end
      end
   in
      {Loop S 1}
   end

   % Simulation
   proc {Main}
      S1 S2 S3
      HASum HACarry
      Mux4Y
      MuxY
   in
      % Input Signals
      S1 = 0|0|1|1|0|1|0|1|_
      S2 = 0|1|0|1|1|1|0|0|_
      S3 = 0|0|0|0|1|1|1|1|_

      % Test Half Adder
      % A=S1, B=S2
      HASum#HACarry = {Circuits.halfAdder S1 S2}

      % Test Mux4
      % D0=S1, D1=S2, D2=S3, D3=S1, S0=S2, S1=S3
      Mux4Y = {Circuits.mux4 S1 S2 S3 S1 S2 S3}

      % Test Mux2
      % D0=S1, D1=S2, S=S3
      MuxY = {Circuits.mux2 S1 S2 S3}

      % Display Results (first 8 values)
      {System.showInfo "--- Digital Logic Simulation ---"}
      
      {System.showInfo "Inputs:"}
      {System.showInfo "S1: 0 0 1 1 0 1 0 1"}
      {System.showInfo "S2: 0 1 0 1 1 1 0 0"}
      {System.showInfo "S3: 0 0 0 0 1 1 1 1"}

      {System.showInfo "\n--- Half Adder (S1, S2) ---"}
      {ShowStream "Sum:" HASum 8}
      {ShowStream "Carry:" HACarry 8}
      
      {System.showInfo "\n--- Mux4 (D0=S1, D1=S2, D2=S3, D3=S1, S0=S2, S1=S3) ---"}
      {ShowStream "Output:" Mux4Y 8}
      
      {System.showInfo "\n--- Mux2 (D0=S1, D1=S2, Sel=S3) ---"}
      {ShowStream "Output:" MuxY 8}

      {Application.exit 0}
   end

   {Main}
end
