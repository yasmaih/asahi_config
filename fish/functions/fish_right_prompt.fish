function fish_right_prompt --description "Durée de la dernière commande et heure"
    # Durée si la commande a pris plus de 2 secondes
    if test -n "$CMD_DURATION"; and test $CMD_DURATION -gt 2000
        set_color yellow
        echo -n " "(math -s1 $CMD_DURATION / 1000)"s  "
    end

    set_color brblack
    echo -n " "(date +%H:%M)
    set_color normal
end
