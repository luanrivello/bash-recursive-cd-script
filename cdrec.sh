!# /bin/bash

cdrec() {
    cd "$@"

    listall=$(ls -1A)
    firstitem=$(echo $listall | sed -n 1p)

    # if there is only 1 item and its a directory then cd and check again
    if [[ $(echo $listall | wc -l) == 1 && $(file -b $firstitem) == "directory" ]] \
    cdrec $firstitem
    
}
