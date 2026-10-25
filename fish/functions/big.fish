function big --description "Écrit du texte en géant (protocole de taille de texte de kitty)"
    # big coucou      → 3 fois plus gros
    # big -s 5 coucou → taille au choix, de 2 à 7
    argparse 's/size=' -- $argv
    or return 1

    set -l size 3
    set -q _flag_size; and set size $_flag_size
    if test (count $argv) -eq 0
        echo "Usage : big [-s taille] texte" >&2
        return 1
    end
    if test -z "$KITTY_WINDOW_ID"
        echo "big : marche seulement dans kitty" >&2
        return 1
    end

    printf '\e]66;s=%d;%s\a\n' $size "$argv"
end
