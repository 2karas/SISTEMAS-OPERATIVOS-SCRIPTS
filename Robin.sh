#!/bin/bash

echo "Simulaci√≥n de planificaci√≥n Round Robin"
read -p "Ingrese el n√∫mero de procesos: " n
read -p "Ingrese el quantum de tiempo: " quantum

declare -a proceso tiempo_restante

# Ingresar tiempo de ejecuci√≥n para cada proceso
for ((i=0; i<n; i++)); do
    proceso[$i]=$((i+1))
    read -p "Ingrese el tiempo total de ejecuci√≥n del Proceso ${proceso[$i]}: " tiempo_restante[$i]
done

# Simulaci√≥n Round Robin
tiempo_total=0
proceso_activo=true

echo -e "\n--- Iniciando planificaci√≥n Round Robin ---"
while $proceso_activo; do
    proceso_activo=false
    for ((i=0; i<n; i++)); do
        if (( tiempo_restante[i] > 0 )); then
            proceso_activo=true
            if (( tiempo_restante[i] > quantum )); then
                echo "Ejecutando P${proceso[$i]} por $quantum unidades de tiempo"
                tiempo_restante[i]=$((tiempo_restante[i] - quantum))
                tiempo_total=$((tiempo_total + quantum))
                sleep 1
            else
                echo "Ejecutando P${proceso[$i]} por ${tiempo_restante[i]} unidades de tiempo (proceso finalizado)"
                tiempo_total=$((tiempo_total + tiempo_restante[i]))
                tiempo_restante[i]=0
                sleep 1
            fi
        fi
    done
done

echo -e "\n‚úÖ Todos los procesos se han completado en $tiempo_total unidades de tiempo."
