function addlogo --description "Transforme une image en logo braille pour fastfetch"
    argparse h/help 'w/width=' 'n/name=' c/color k/keep-bg -- $argv
    or return 1

    if set -q _flag_help; or test (count $argv) -eq 0
        echo "Usage : addlogo [options] image [image...]"
        echo
        echo "  -w, --width N   largeur en colonnes (défaut 40)"
        echo "  -n, --name NOM  nom du logo (une seule image)"
        echo "  -c, --color     garder les couleurs de l'image"
        echo "  -k, --keep-bg   pas d'inversion auto des images à fond clair"
        echo
        echo "Les logos vont dans ~/.config/fastfetch/logos/"
        return 0
    end

    if not type -q chafa; or not type -q magick
        echo "addlogo : il faut chafa et ImageMagick (sudo dnf install chafa ImageMagick)" >&2
        return 1
    end

    set -l width 40
    set -q _flag_width; and set width $_flag_width
    if set -q _flag_name; and test (count $argv) -gt 1
        echo "addlogo : --name marche qu'avec une seule image" >&2
        return 1
    end

    set -l dir ~/.config/fastfetch/logos
    mkdir -p $dir
    set -l tmp (mktemp --suffix=.png)

    for img in $argv
        if not test -f $img
            echo "addlogo : $img existe pas, je passe" >&2
            continue
        end

        # Nom du logo : --name, sinon le nom du fichier nettoyé
        set -l name
        if set -q _flag_name
            set name $_flag_name
        else
            set name (basename $img | string replace -r '\.[^.]*$' '' \
                | string lower | string replace -ra '[^a-z0-9]+' '-' | string trim -c '-')
            test -z "$name"; and set name logo
        end
        set -l out $dir/$name.txt
        set -l i 2
        while test -e $out
            set out $dir/$name-$i.txt
            set i (math $i + 1)
        end

        # On coupe les bords vides. Le braille dessine les pixels clairs : un dessin
        # noir sur fond blanc sortirait en négatif sur un terminal sombre, donc on inverse.
        set -l prep -trim +repage
        # En couleur on inverse pas, sinon les couleurs sortent en négatif
        if not set -q _flag_keep_bg; and not set -q _flag_color
            if test (magick $img -colorspace gray -format '%[fx:mean>0.5]' info:) = 1
                set -a prep -negate
            end
        end
        magick $img $prep $tmp
        or continue

        set -l colors none
        set -q _flag_color; and set colors full
        # --fg-only : pas de couleur de fond, sinon chaque logo a un rectangle gris derrière
        chafa --format symbols --symbols braille --colors $colors --fg-only --size {$width}x \
            --dither none --work 9 $tmp \
            | string replace -ra '\e\[\?25[hl]' '' >$out
        or continue

        echo "→ $out"
        fastfetch --logo $out
    end

    rm -f $tmp
end
