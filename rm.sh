#!/bin/zsh

turquoiseColour="\e[0;36m\033[1m"
endColour="\033[0m\e[0m"

function titulo() {
    echo "${turquoiseColour}
    ██████╗ ███╗   ███╗██╗  ██╗
    ██╔══██╗████╗ ████║╚██╗██╔╝
    ██████╔╝██╔████╔██║ ╚███╔╝ 
    ██╔══██╗██║╚██╔╝██║ ██╔██╗ 
    ██║  ██║██║ ╚═╝ ██║██╔╝ ██╗
    ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝
    ${endColour}"
}

function borrarFicheros(){
    tree
    echo -ne "\nBorrar todo el contenido de este directorio? ▸ "
    read resp

    if [ "$resp" = "si" ]; then
        rm -rf * . > /dev/null 2>&1
    fi
}

function dependencia() {
    clear
    titulo
    dependencia=(tree)
    echo -e "${turquoiseColour}Verificando dependencias...${endColour}"
    sleep 1

    for programa in "${dependencia[@]}"; do
       
        test -f /usr/bin/$programa
        if [ "$(echo $?)" = "0" ]; then
            borrarFicheros
        else 
            echo -e "Instalando software ▸ $programa "
            sudo apt-get install tree -y > /dev/null 2>&1
            clear
            titulo
            borrarFicheros
        fi

    done
}

tput civis
dependencia
