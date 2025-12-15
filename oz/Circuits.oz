functor
import
   Gates
export
   halfAdder: HalfAdder
   mux4: Mux4
   mux2: Mux2
define
   % Circuit 1: Half Adder
   % Inputs: A, B
   % Outputs: Sum, Carry
   fun {HalfAdder A B}
      Sum Carry
   in
      Sum = {Gates.xorG A B}
      Carry = {Gates.andG A B}
      Sum#Carry
   end

   % Circuit 2: 4-to-1 Multiplexer
   % Inputs: D0, D1, D2, D3, S0, S1
   % Output: Y
   % Logic: Uses 3 Mux2 circuits
   fun {Mux4 D0 D1 D2 D3 S0 S1}
      Y0 Y1
   in
      Y0 = {Mux2 D0 D1 S0}
      Y1 = {Mux2 D2 D3 S0}
      {Mux2 Y0 Y1 S1}
   end

   % Circuit 3: 2-to-1 Multiplexer
   % Inputs: D0, D1, S
   % Output: Y
   % Logic: Y = (D0 AND NOT S) OR (D1 AND S)
   fun {Mux2 D0 D1 S}
      NotS And0 And1 Y
   in
      NotS = {Gates.notG S}
      And0 = {Gates.andG D0 NotS}
      And1 = {Gates.andG D1 S}
      Y = {Gates.orG And0 And1}
      Y
   end
end
