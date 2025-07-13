set -e  
ASM_FILE="src/gnome_sort.asm"    
OUTPUT_FILE="output/gnome_sort"       

nasm -f elf64 -o ${OUTPUT_FILE}.o ${ASM_FILE}

ld -o ${OUTPUT_FILE} ${OUTPUT_FILE}.o

./${OUTPUT_FILE}

rm -f ${OUTPUT_FILE}.o

