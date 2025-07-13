# Gnome Sort em Assembly x86-64

## Descrição

Este projeto implementa o algoritmo de ordenação Gnome Sort em linguagem Assembly para arquitetura x86-64 (64 bits). O código demonstra operações de ordenação em baixo nível, manipulando diretamente registradores e memória.

## Sobre o Gnome Sort

O Gnome Sort (também conhecido como "Stupid Sort") é um algoritmo de ordenação simples que funciona da seguinte maneira:

1. Compara elementos adjacentes
2. Se estiverem na ordem correta, avança uma posição
3. Se estiverem na ordem errada, troca os elementos e retrocede uma posição
4. Repete até percorrer todo o array sem necessidade de trocas

Características:
- Complexidade: O(n²) no pior caso
- Espaço: O(1) (ordenação in-place)
- Estável: mantém a ordem de elementos iguais

## Estrutura do Código

### Seção de Dados
```asm
array    dd 3, 2, 5, 9, 1, 10, 7, 4, 8, 6, 12, 15, 18, 20, 11, 14, 17, 19, 13, 16
arr_len  equ 20
```
Contém o array a ser ordenado e seu tamanho.

### Rotina Principal
- Chama `gnome_sort` para ordenar o array
- Imprime os elementos ordenados usando `print_int`

### Funções Implementadas

#### `gnome_sort`
Implementa o algoritmo principal usando:
- RDI: ponteiro para o array
- ESI: tamanho do array
- EBX: índice atual

#### `print_int`
Converte inteiros para string e imprime:
- Usa divisões por 10 para conversão
- Escreve na saída padrão via syscall

## Como Executar

O projeto inclui um script `run.sh` para compilação e execução:

```bash
./run.sh
```

## Saída Esperada

Ao executar, o programa mostrará o array ordenado:

```
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
```

## Personalização

Para testar com diferentes entradas:
1. Modifique os valores em `array`
2. Ajuste `arr_len` para o novo tamanho
3. Execute novamente com `./run.sh`

## Observações

- Desenvolvido para Linux x86-64
- Requer NASM e LD instalados
