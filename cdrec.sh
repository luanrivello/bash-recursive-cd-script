!# /bin/bash

cdrec() {
    cd "$@"

    listall=$(ls -1A)
    firstitem=$(echo $listall | sed -n 1p)

    # if there is nothing inside or if you are trying to go back the directories then dont run
    if [[ -z $firstitem ]] || [[ $(echo "$@" | cut -c1-2) == ".." ]]; then
        return
    # else if there is only 1 item and its a directory then cd and run again
    elif [[ $(echo $listall | wc -l) == 1 && $(file -b $firstitem) == "directory" ]]; then
        cdrec $firstitem
    fi

}
