#!/usr/bin/env bash

# Script to run after following all NDS install instructions to make sure that
# everything was installed correctly!
#
# Usage:
#
#     $ bash nds_check_install.sh
#
# The script will try and print out any missing programs to the screen with
# brief instructions on how to install them. If everything is installed
# correctly you will see a message printed to screen notifying you of this.
#

missing=

function check_installed() {
    func=${1}
    hash ${func} 2> /dev/null || {
        printf "Missing software program: ${func}. "
        printf "Check installation instructions\n"
        missing=true
    }
}

function get_os() {
    UNAME=$( command -v uname)

    case $( "${UNAME}" | tr '[:upper:]' '[:lower:]') in
        linux*)
            printf 'linux\n'
            ;;
        darwin*)
            printf 'darwin\n'
            ;;
        msys*|cygwin*|mingw*)
            # or possible 'bash on windows'
            printf 'windows\n'
            ;;
        nt|win*)
            printf 'windows\n'
            ;;
        *)
            printf 'unknown\n'
            ;;
    esac
}

# expected VSCode extensions
extensions=(
    ms-azuretools.vscode-docker
    ms-python.python
    ms-vsliveshare.vsliveshare
    ms-vsliveshare.vsliveshare-audio
    ms-vsliveshare.vsliveshare-pack
)
if [ $( get_os ) == "windows" ]; then
    extensions+=(ms-vscode-remote.remote-wsl)
fi

# expected importable python package
packages=(
    flake8
    IPython
    jupyter
    jupyterlab
    matplotlib
    nibabel
    nilearn
    numpy
    pandas
    scipy
    seaborn
)

# check basic installations
check_installed git
check_installed conda
check_installed python
check_installed code
check_installed docker

# check vscode extensions
vscode_ext=$( code --list-extensions )
for ext in ${extensions[@]}; do
    if [[ $vscode_ext != *${ext}* ]]; then
        ext=$( echo "${ext}" | tr '[:upper:]' '[:lower:]' )
        printf "Missing VSCode extension: "
        printf "install with $ code --install-extension ${ext}\n"
        missing=true
    fi
done

# check python packages
for package in ${packages[@]}; do
    python -c "import ${package}" 2> /dev/null || {
        package=$( echo "${package}" | tr '[:upper:]' '[:lower:]' )
        printf "Missing Python package:   "
        printf "install with $ conda install ${package}\n"
        missing=true
    }
done

# congratulations, you did it!
if [ -z ${missing} ]; then
    python -c 'print("\U0001f389" * 3, end=" ")'
    printf "Everything seems to be installed correctly! "
    python -c 'print("\U0001f389" * 3)'
    printf "Congratulations, you're all ready for the NDS course! "
fi
