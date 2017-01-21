function _fire_alert
    if test $status = 0
        set icon 'terminal'
        set message 'Command Done'
    else
        set icon 'error'
        set message 'Error'
    end

    notify-send --urgency=low -i $icon $message "$argv"
end

function alert
    eval $argv
    _fire_alert $argv
end
