#!/usr/bin/env bash
#
# +----------------------------------------------------------------------------+
# | setup.sh                                                                   |
# +----------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# +----------------------------------------------------------------------------+

# +----- Variables ------------------------------------------------------------+
datetime="$(date "+%Y-%m-%d-%H-%M-%S")"
cdir=$(pwd)
width=80
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
YN="(Yes|${BRIGHT}No${NORMAL}) >> "

# +----- Functions ------------------------------------------------------------+
echo_equals() {
    counter=0
    while [  $counter -lt "$1" ]; do
    printf '='
    (( counter=counter+1 ))
    done
}

echo_title() {
    title=$1
    ncols=$(tput cols)
    nequals=$(((width-${#title})/2-1))
    tput setaf 4 0 0
    echo_equals "$nequals"
    tput setaf 6 0 0
    printf " %s " "$title"
    tput setaf 4 0 0
    echo_equals "$nequals"
    tput sgr0
    echo
}

echo_Right() {
    text=${1}
    echo
    tput cuu1
    tput cuf "${width}"
    tput cub ${#text}
    echo "${text}"
}

echo_OK() {
    tput setaf 2 0 0
    echo_Right "[ OK ]"
    tput sgr0
}

echo_Done() {
    tput setaf 2 0 0
    echo_Right "[ Done ]"
    tput sgr0
}

echo_NotNeeded() {
    tput setaf 3 0 0
    echo_Right "[ Not Needed ]"
    tput sgr0
}

echo_Skipped() {
    tput setaf 3 0 0
    echo_Right "[ Skipped ]"
    tput sgr0
}

echo_Failed() {
    tput setaf 1 0 0
    echo_Right "[ Failed ]"
    tput sgr0
}

antwoord() {
    read -p "${1}" antwoord
        if [[ ${antwoord} == [yY] || ${antwoord} == [yY][Ee][Ss] ]]; then
            echo "yes"
        else
            echo "no"
        fi
}

display_Notice() {
    clear
    tput setaf 6
    cat ${cdir}/notice.txt
    tput sgr0
    proceed="$(antwoord "Do you want to proceed? ${YN}")"
}

install_sxiv_keyhandler() {
    echo -n -e "Creating directory\r"
    mkdir -p ${HOME}/.config/sxiv/exec
    echo_Done
    echo -n -e "Copying sxiv keyhandler\r"
    cp ./key-handler ${HOME}/.config/sxiv/exec
    echo_Done
    echo -n -e "Copying sxiv keyhandler help page\r"
    cp ./key-handler-help.txt ${HOME}/.config/sxiv/exec
    echo_Done
}

# +----- Main -----------------------------------------------------------------+
display_Notice
if [[ "${proceed}" = "no" ]]; then
    echo -e "\n Oh Boy, you should reconsider your decision."
    exit 1
fi

echo_title "Installing sxiv keyhandler"
install_sxiv_keyhandler
echo_title "I'm done."
echo -e "\n\n"
exit 0
