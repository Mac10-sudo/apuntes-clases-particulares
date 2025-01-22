#!/bin/bash
# Números pares naturales del 1 al 99
for i in $(seq 1 99);
do
if [[ $(($i % 2)) != 0 ]]
then
echo $i
fi
done
