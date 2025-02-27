#!/bin/bash

echo "Simulaci√≥n de planificaci√≥n FCFS (First-Come, First-Served)"
read -p "Ingrese el n√∫mero de procesos: " n

declare -a proceso llegada ejecucion finalizacion espera retorno

# Entrada de datos
for ((i=0; i<n; i++)); do
    proceso[$i]=$((i+1))
    read -p "Ingrese el tiempo de llegada del Proceso ${proceso[$i]}: " llegada[$i]
    read -p "Ingrese el tiempo de ejecuci√≥n (burst time) del Proceso ${proceso[$i]}: " ejecucion[$i]
done

# Ordenar procesos por tiempo de llegada (FCFS)
for ((i=0; i<n-1; i++)); do
    for ((j=i+1; j<n; j++)); do
        if (( llegada[i] > llegada[j] )); then
            # Intercambio de llegada
            temp=${llegada[i]}
            llegada[i]=${llegada[j]}
            llegada[j]=$temp

            # Intercambio de ejecucion
            temp=${ejecucion[i]}
            ejecucion[i]=${ejecucion[j]}
            ejecucion[j]=$temp

            # Intercambio de proceso
            temp=${proceso[i]}
            proceso[i]=${proceso[j]}
            proceso[j]=$temp
        fi
    done
done

# C√°lculos: tiempo de finalizaci√≥n, espera y retorno
finalizacion[0]=$((llegada[0] + ejecucion[0]))
retorno[0]=$((finalizacion[0] - llegada[0]))
espera[0]=$((retorno[0] - ejecucion[0]))

for ((i=1; i<n; i++)); do
    if (( finalizacion[i-1] < llegada[i] )); then
        finalizacion[i]=$((llegada[i] + ejecucion[i]))
    else
        finalizacion[i]=$((finalizacion[i-1] + ejecucion[i]))
    fi
    retorno[i]=$((finalizacion[i] - llegada[i]))
    espera[i]=$((retorno[i] - ejecucion[i]))
done

# Mostrar resultados
echo -e "\nProceso\tLlegada\tEjecuci√≥n\tFinalizaci√≥n\tRetorno\tEspera"
total_espera=0
total_retorno=0
for ((i=0; i<n; i++)); do
    echo -e "P${proceso[$i]}\t${llegada[$i]}\t${ejecucion[$i]}\t\t${finalizacion[$i]}\t\t${retorno[$i]}\t${espera[$i]}"
    total_espera=$((total_espera + espera[i]))
    total_retorno=$((total_retorno + retorno[i]))
done

# Promedios
echo -e "\nTiempo promedio de espera: $(echo "scale=2; $total_espera/$n" | bc)"
echo "Tiempo promedio de retorno: $(echo "scale=2; $total_retorno/$n" | bc)"
#!/bin/bash

echo "Simulaci√≥n de planificaci√≥n FCFS (First-Come, First-Served)"
read -p "Ingrese el n√∫mero de procesos: " n

declare -a proceso llegada ejecucion finalizacion espera retorno

# Entrada de datos
for ((i=0; i<n; i++)); do
    proceso[$i]=$((i+1))
    read -p "Ingrese el tiempo de llegada del Proceso ${proceso[$i]}: " llegada[$i]
    read -p "Ingrese el tiempo de ejecuci√≥n (burst time) del Proceso ${proceso[$i]}: " ejecucion[$i]
done

# Ordenar procesos por tiempo de llegada (FCFS)
for ((i=0; i<n-1; i++)); do
    for ((j=i+1; j<n; j++)); do
        if (( llegada[i] > llegada[j] )); then
            # Intercambio de llegada
            temp=${llegada[i]}
            llegada[i]=${llegada[j]}
            llegada[j]=$temp

            # Intercambio de ejecucion
            temp=${ejecucion[i]}
            ejecucion[i]=${ejecucion[j]}
            ejecucion[j]=$temp

            # Intercambio de proceso
            temp=${proceso[i]}
            proceso[i]=${proceso[j]}
            proceso[j]=$temp
        fi
    done
done

# C√°lculos: tiempo de finalizaci√≥n, espera y retorno
finalizacion[0]=$((llegada[0] + ejecucion[0]))
retorno[0]=$((finalizacion[0] - llegada[0]))
espera[0]=$((retorno[0] - ejecucion[0]))

for ((i=1; i<n; i++)); do
    if (( finalizacion[i-1] < llegada[i] )); then
        finalizacion[i]=$((llegada[i] + ejecucion[i]))
    else
        finalizacion[i]=$((finalizacion[i-1] + ejecucion[i]))
    fi
    retorno[i]=$((finalizacion[i] - llegada[i]))
    espera[i]=$((retorno[i] - ejecucion[i]))
done

# Mostrar resultados
echo -e "\nProceso\tLlegada\tEjecuci√≥n\tFinalizaci√≥n\tRetorno\tEspera"
total_espera=0
total_retorno=0
for ((i=0; i<n; i++)); do
    echo -e "P${proceso[$i]}\t${llegada[$i]}\t${ejecucion[$i]}\t\t${finalizacion[$i]}\t\t${retorno[$i]}\t${espera[$i]}"
    total_espera=$((total_espera + espera[i]))
    total_retorno=$((total_retorno + retorno[i]))
done

# Promedios
echo -e "\nTiempo promedio de espera: $(echo "scale=2; $total_espera/$n" | bc)"
echo "Tiempo promedio de retorno: $(echo "scale=2; $total_retorno/$n" | bc)"
