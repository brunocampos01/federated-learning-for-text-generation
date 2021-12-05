#!/bin/bash
# Author: brunocampos01
# ----------------------------------- #
URL=''
PATH_TO_SAVE=''

usage() {
cat << EOF
Download zip dataset 

Usage:
    ${0} [-u "<url>"] [-p "<path_to_save>"]
EOF
}

while getopts u:p: OPT
do
    case "${OPT}" in
        u)
            URL="${OPTARG}"
            ;;
        p)
            PATH_TO_SAVE="${OPTARG}"
            ;;
        ?)
            usage
            exit 1
            ;;
   esac
done

if [ -z "$URL" ] || [ -z "$PATH_TO_SAVE" ]; then
        echo "Missing url=${URL} or path_to_save=${PATH_TO_SAVE}" >&2
        usage
        exit 1
fi

echo "----------------------------------------"
echo "----------- Downloading data -----------"
echo "----------------------------------------"
wget -c $URL --output-document "${PATH_TO_SAVE}"/temp_file.zip

echo "----------------------------------------"
echo "--------------- Unzip ------------------"
echo "----------------------------------------"
unzip "${PATH_TO_SAVE}"/temp_file.zip -d "${PATH_TO_SAVE}"
rm "${PATH_TO_SAVE}"/temp_file.zip
