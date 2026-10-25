function greeting --description "Coucou, message selon l'heure, et un message au hasard"
    set -l name Yasmine
    set -l hour (date +%H)
    set -l h (string trim -l -c 0 $hour)
    test -z "$h"; and set h 0

    # Message selon l'heure
    set -l moment
    if test $h -lt 6
        set moment "il est $hour h... la nuit code mal, promis" \
            "il est $hour h. Les pires bugs naissent à cette heure-là" \
            "$hour h du mat. Commit et dodo, queen"
    else if test $h -lt 12
        set moment "bonjour queen, café d'abord, code ensuite" \
            "il est $hour h, le cerveau est frais, profites-en" \
            "matinée productive en vue, bosslady"
    else if test $h -lt 14
        set moment "il est midi passé. T'as mangé ?" \
            "pause déj d'abord, les segfaults attendront"
    else if test $h -lt 19
        set moment "aprem code, on y va" \
            "il est $hour h, pile l'heure d'une peer-eval"
    else
        set moment "soirée code ? Pense à boire de l'eau" \
            "il est $hour h. Encore un petit commit et on souffle"
    end

    set -l kaomojis "(⊙_⊙)" "(˶ᵔ ᵕ ᵔ˶)" "ʕ•ᴥ•ʔ" "(｡•̀ᴗ-)✧" "٩(◕‿◕)۶" "(ﾉ◕ヮ◕)ﾉ" "( ˘ᵕ˘ )" "(ㆆ_ㆆ)"

    echo
    set_color brmagenta
    echo "  ✧ · ˚ ♡  coucou $name  ♡ ˚ · ✧"
    set_color yellow
    echo "    =^.^=   "(random choice $moment)" ★"

    set -l messages (string match -rv '^\s*$' < ~/.config/fish/messages.txt 2>/dev/null)
    if test (count $messages) -gt 0
        echo
        set_color cyan
        echo "  ✧ "(random choice $messages)"  "(random choice $kaomojis)
    end
    set_color normal
end
