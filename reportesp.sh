#!/bin/bash

# Directorio donde se guardarán los reportes
REPORT_DIR="$HOME/system_reports"
mkdir -p "$REPORT_DIR"

# Reporte de espacio en disco
echo "Generando reporte de espacio en disco..."
df -h > "$REPORT_DIR/espacio_disco.txt"

# Listar procesos en ejecución
echo "Listando procesos en ejecución..."
ps aux > "$REPORT_DIR/procesos_activos.txt"

# Buscar archivos de log en /var/log y guardarlos en un archivo
echo "Buscando archivos de log en /var/log..."
find /var/log -name "*.log" > "$REPORT_DIR/archivos_log.txt"

# Mostrar resumen de los reportes generados
echo "Resumen de los reportes generados:"
echo "-----------------------------------------------"
echo "Espacio en disco:"
cat "$REPORT_DIR/espacio_disco.txt"
echo "-----------------------------------------------"
echo "Primeros 5 procesos activos:"
head -n 5 "$REPORT_DIR/procesos_activos.txt"
echo "-----------------------------------------------"
echo "Primeros 5 archivos de log encontrados:"
head -n 5 "$REPORT_DIR/archivos_log.txt"

echo "Tarea completada. Reportes guardados en $REPORT_DIR"
