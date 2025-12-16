
#!/bin/sh

# Validar número de argumentos
if [ $# -ne 2 ]; then
    echo "Error: Se requieren 2 parámetros: <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Validar que filesdir es un directorio válido
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir no es un directorio válido"
    exit 1
fi

# Contar número total de ficheros (incluye subdirectorios)
# - Usa find para listar solo archivos regulares
num_files=$(find "$filesdir" -type f 2>/dev/null | wc -l)

# Contar líneas coincidentes que contienen searchstr
# - grep recursivo, ignora binarios, sin nombres de archivo (para contar líneas)
# - Redirige errores para evitar ruido (permisos, etc.)
num_matches=$(grep -r --binary-files=without-match -h "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Salida EXACTA esperada por tester.sh
echo "The number of files are ${num_files} and the number of matching lines are ${num_matches}"
``
