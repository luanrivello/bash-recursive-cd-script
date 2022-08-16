!# /bin/bash

cdrec() {
    cd "$@"

    directories=$(ls -1A)
    folder=$(echo $directories | sed -n 1p)

    if [[ $(echo $directories | wc -l) == 1 && $(file -b $folder) == "directory" ]] \
    cdrec $folder
}
