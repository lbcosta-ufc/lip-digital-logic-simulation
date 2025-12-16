# Digital Logic Simulation
Questão 2 da Avaliação Prática (Oz e Haskell)

## Requisitos
1 - Implemente, no modelo declarativo concorrente de Oz, um funtor (componente) que ofereça portas lógicas para construção de circuitos digitais, baseado no conteúdo da Seção 4.3.5 do livro-texto;

2 - Utilize o funtor para criar pelo menos três circuitos lógicos à sua escolha, implementados pela composição de portas lógicas básicas, com exceção dos circuitos mostrados na Seção 4.3.5 como exemplos. Esses circuitos, assim como as portas lógicas, também devem estar encapsulados em um funtor, de modo que possam ser reusados em alguma aplicação de simulação de lógica digital.

3 - Escreva um programa principal para demonstrar o uso dos circuitos e portas lógicas dos dois funtores no ambiente Mozart.

4 - Faça o mesmo para a linguagem Haskell, usando lazy streams.

## Descrição do Programa
A sessão 4.3 do livro-texto fala sobre Streams e modela circuitos lógicos da seguinte forma:

### Descrição de Circuito Lógico
- "At each step, each logic gate reads its input wires, calculates the result, and puts it on the output wires."
- "The steps are cadenced by a circuit called a clock."
- "Our simulator will be synchronous as well."

### Modelo
- **Signal**: stream of 0s and 1s. 
- **Logic gate**: a stream object: a recursive procedure, running in its own thread, that reads input streams and calculates output streams
- **Clock**: a recursive procedure that produces an initial stream at a fixed rate.

## Implementação

**Portões lógicos:**
O arquivo `Gates.oz` contém o funtor `Gates` que exporta as seguintes portas lógicas:
- `andG`: Porta AND
- `orG`: Porta OR
- `nandG`: Porta NAND
- `norG`: Porta NOR
- `xorG`: Porta XOR
- `notG`: Porta NOT

**Circuitos Escolhidos:**
O arquivo `Circuits.oz` contém o funtor `Circuits` que exporta os seguintes circuitos:
1.  **Half Adder (`halfAdder`)**: Soma de dois bits, produzindo Soma e Carry.
2.  **4-to-1 Multiplexer (`mux4`)**: Seleciona uma de 4 entradas baseada em 2 sinais de controle. Construído utilizando três multiplexadores 2-para-1.
3.  **2-to-1 Multiplexer (`mux2`)**: Seleciona uma de 2 entradas baseada em 1 sinal de controle.

**Programa em Oz:**
O arquivo `Main.oz` importa os funtores `Gates` e `Circuits` e executa uma simulação com streams de entrada predefinidos.
Para executar:
```bash
ozc -c Gates.oz
ozc -c Circuits.oz
ozc -c Main.oz
ozengine Main.ozf
```

**Programa em Haskell:**

Para executar (necessário GHC ou Cabal):
```bash
cd haskell
cabal run
# ou
ghc -i./app app/Main.hs -o Main && ./Main
```