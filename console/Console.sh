@class
Console(){

    @private
    _getConsole(){
        echo ${TERM}
    }

    run(){
        if [[ $(_getConsole) == xterm ]]; then
            local cmd="winpty ${@}"
        else
            local cmd=${@}
        fi

        ${cmd}
    }

    $@
}