if status is-interactive
    # Pas le message "Welcome to fish" de base
    set -g fish_greeting

    # nvim pour tout ce qui ouvre un éditeur (git, crontab, sudoedit...)
    set -gx EDITOR nvim
    set -gx VISUAL nvim

    # fzf : ctrl+r historique, ctrl+t fichiers, alt+c dossiers
    # fd au lieu de find : plus rapide, ignore ce qui est dans .gitignore, voit les fichiers cachés
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
    # --color 16 : fzf prend les couleurs du thème kitty
    set -gx FZF_DEFAULT_OPTS '--height 40% --layout reverse --border rounded --color 16 --info inline-right'
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=numbers --line-range :200 {}'"
    set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --exclude .git'
    set -gx FZF_ALT_C_OPTS "--preview 'tree -C -L 2 {} | head -50'"
    # bat avec les couleurs du terminal plutôt que son propre thème
    set -gx BAT_THEME ansi
    fzf --fish | source

    # zoxide : z <bout de nom> pour sauter dans un dossier, zi pour choisir dans fzf
    zoxide init fish | source

    # Un dessin au hasard, seulement dans le premier panneau quand kitty s'ouvre
    if test "$KITTY_WINDOW_ID" = 1
        set -l logos ~/.config/fastfetch/logos/*.txt
        # On retire le dernier affiché pour pas l'avoir deux fois de suite
        set -l last_file ~/.cache/fastfetch-last-logo
        if test (count $logos) -gt 1; and test -f $last_file
            set -l last (cat $last_file)
            set -l others
            for logo in $logos
                test "$logo" != "$last"; and set -a others $logo
            end
            test (count $others) -gt 0; and set logos $others
        end
        if test (count $logos) -gt 0
            set -l logo (random choice $logos)
            echo $logo > $last_file
            fastfetch --logo $logo
        end

        # Coucou + message selon l'heure + un message au hasard (functions/greeting.fish)
        greeting
    end
end
