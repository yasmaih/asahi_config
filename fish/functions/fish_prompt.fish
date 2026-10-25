function fish_prompt --description "Prompt powerline façon bobthefish, couleurs du thème kitty"
    # À garder en premier : c'est le code de retour de la dernière commande
    set -l last_status $status

    # Segments : couleur de fond, couleur du texte, texte
    set -l bgs brmagenta brblack
    set -l fgs black white
    set -l texts " $USER " " "(prompt_pwd --full-length-dirs 2)" "

    set -l branch (git branch --show-current 2>/dev/null)
    if test -n "$branch"
        # Vert si tout est commité, jaune s'il reste des modifs
        if test -n "$(git status --porcelain 2>/dev/null)"
            set -a bgs yellow
            set -a texts " "" $branch ● "
        else
            set -a bgs green
            set -a texts " "" $branch "
        end
        set -a fgs black
    end

    # Rouge en tête si la dernière commande a planté
    if test $last_status -ne 0
        set bgs red $bgs
        set fgs black $fgs
        set texts " "" $last_status " $texts
    end

    echo
    for i in (seq (count $texts))
        set_color -b $bgs[$i] $fgs[$i]
        echo -n $texts[$i]
        # La flèche prend la couleur du segment, sur le fond du suivant
        if test $i -lt (count $texts)
            set_color -b $bgs[(math $i + 1)] $bgs[$i]
        else
            set_color -b normal $bgs[$i]
        end
        echo -n 
    end
    set_color normal
    echo

    set_color brmagenta
    echo -n "❯ "
    set_color normal
end
