
#!/bin/sh

# Validar número de argumentos
if [ $# -ne 2 ]; then
    echo "Error: Se requieren 2 parámetros: <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Crear directorio si no existe
mkdir -p "$(dirname "$writefile")"
if [ $? -ne 0 ]; then
    echo "Error: No se pudo crear el directorio para $writefile"
    exit 1
fi

# Crear o sobrescribir el fichero con writestr
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: No se pudo escribir en el fichero $writefile"
    exit 1
fi
