# Kitty, les raccourcis

Version 0.47.1. Tout est tiré des raccourcis par défaut de kitty.

`kitty_mod` = `ctrl+shift`. Tous les raccourcis en dessous l'utilisent, sauf mention contraire.
Un `>` veut dire "puis" : `ctrl+shift+p > f` c'est ctrl+shift+p, tu lâches, puis f.

Vocabulaire kitty, sinon la doc est incompréhensible :
- **OS window** : une vraie fenêtre de ton bureau.
- **tab** : un onglet dans une OS window.
- **window** : un panneau dans un onglet, ce que les autres terminaux appellent un split.
- **layout** : la façon dont les windows sont rangées dans l'onglet.

## Ta touche leader : ctrl+a

Ajoutée dans ta config. Tu fais `ctrl+a`, tu lâches, puis la lettre.
Les raccourcis `ctrl+shift` plus bas marchent toujours en parallèle.

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+a > c` | nouvel onglet dans le dossier où t'es |
| `ctrl+a > n` / `p` | onglet suivant / précédent |
| `ctrl+a > 1` ... `9` | aller à l'onglet 1 à 9 |
| `ctrl+a > ,` | renommer l'onglet |
| `ctrl+a > &` | fermer l'onglet |
| `ctrl+a > v` | couper l'écran en deux, nouveau panneau à droite |
| `ctrl+a > s` | couper l'écran en deux, nouveau panneau en bas |
| `ctrl+a > h` `j` `k` `l` | aller au panneau à gauche / en bas / en haut / à droite |
| `ctrl+a > z` | zoomer sur le panneau actuel, refaire pour revenir |
| `ctrl+a > r` | redimensionner le panneau |
| `ctrl+a > w` | numéros sur les panneaux, tu tapes celui où aller |
| `ctrl+a > x` | fermer le panneau |
| `ctrl+a > S > q` | sauvegarder la session (onglets, splits, dossiers) |
| `ctrl+a > S > o` | rouvrir la dernière session sauvegardée |
| `ctrl+a > ?` | afficher cette fiche (`q` pour fermer, `/` pour chercher) |
| `ctrl+a > e` | ouvrir la config |
| `ctrl+a > shift+r` | recharger la config |
| `ctrl+a > ctrl+a` | envoyer un vrai `ctrl+a` (début de ligne dans le shell) |

## Si tu dois en retenir cinq

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+shift+t` | nouvel onglet |
| `ctrl+shift+→` / `←` | onglet suivant / précédent |
| `ctrl+shift+enter` | nouveau panneau dans l'onglet |
| `ctrl+shift+f3` | palette de commandes : tu cherches une action par son nom |
| `ctrl+shift+e` | ouvrir une URL affichée à l'écran sans souris |

## Onglets

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+shift+t` | nouvel onglet |
| `ctrl+shift+q` | fermer l'onglet |
| `ctrl+shift+→` ou `ctrl+tab` | onglet suivant |
| `ctrl+shift+←` ou `ctrl+shift+tab` | onglet précédent |
| `ctrl+shift+.` | déplacer l'onglet vers la droite |
| `ctrl+shift+,` | déplacer l'onglet vers la gauche |
| `ctrl+shift+alt+t` | renommer l'onglet |

## Panneaux (windows)

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+shift+enter` | nouveau panneau |
| `ctrl+shift+w` | fermer le panneau |
| `ctrl+shift+]` / `[` | panneau suivant / précédent |
| `ctrl+shift+1` ... `0` | aller au panneau 1 à 10 |
| `ctrl+shift+f7` | affiche un numéro sur chaque panneau, tu tapes le numéro pour y aller |
| `ctrl+shift+f8` | pareil, mais échange le panneau actuel avec celui choisi |
| `ctrl+shift+f` / `b` | déplacer le panneau en avant / en arrière |
| `ctrl+shift+`` ` | mettre le panneau en première position |
| `ctrl+shift+r` | mode redimensionnement (flèches ou `w`/`n`/`t`/`s`, `esc` pour sortir) |
| `ctrl+shift+l` | layout suivant |

Les layouts activés par défaut : `tall` (un gros à gauche, les autres empilés à droite),
`fat`, `grid`, `horizontal`, `vertical`, `splits`, `stack` (un seul panneau visible en plein
écran, pratique pour zoomer).

## Scroll et historique

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+shift+↑` / `↓` ou `k` / `j` | remonter / descendre d'une ligne |
| `ctrl+shift+page_up` / `page_down` | une page |
| `ctrl+shift+home` / `end` | tout en haut / tout en bas |
| `ctrl+shift+z` / `x` | prompt précédent / suivant (saute de commande en commande) |
| `ctrl+shift+h` | ouvre tout l'historique dans un pager, avec recherche |
| `ctrl+shift+g` | affiche la sortie de la dernière commande seule |
| `ctrl+shift+/` | chercher dans l'historique |

`ctrl+shift+g` est très pratique quand norminette ou valgrind te crache 300 lignes.

## Copier, coller

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+shift+c` | copier |
| `ctrl+shift+v` | coller |
| `ctrl+shift+s` ou `shift+insert` | coller la sélection (le presse-papier "clic du milieu") |
| `ctrl+shift+o` | envoyer la sélection à un programme |

## Hints : sélectionner sans souris

Tu lances le mode, kitty met une lettre sur chaque élément trouvé à l'écran, tu tapes la
lettre.

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+shift+e` | ouvrir une URL |
| `ctrl+shift+p > f` | insérer un chemin de fichier dans ta ligne de commande |
| `ctrl+shift+p > shift+f` | ouvrir un chemin de fichier |
| `ctrl+shift+p > l` | insérer une ligne |
| `ctrl+shift+p > w` | insérer un mot |
| `ctrl+shift+p > h` | insérer un hash (commit git par exemple) |
| `ctrl+shift+p > n` | ouvrir un `fichier:ligne` dans l'éditeur, direct à la bonne ligne |
| `ctrl+shift+p > y` | ouvrir un lien cliquable |
| `ctrl+shift+p > c` | choisir un fichier dans un sélecteur et insérer son chemin |
| `ctrl+shift+p > d` | pareil pour un dossier |

`ctrl+shift+p > n` sur une erreur de gcc du genre `main.c:42:5: error`, ça t'ouvre main.c
ligne 42.

## Police et apparence

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+shift+=` ou `+` | grossir le texte |
| `ctrl+shift+-` | rétrécir |
| `ctrl+shift+backspace` | taille par défaut |
| `ctrl+shift+a > m` / `l` | plus / moins opaque (si `dynamic_background_opacity yes`) |
| `ctrl+shift+a > 1` | opaque à fond |
| `ctrl+shift+a > d` | opacité par défaut |
| `ctrl+shift+f10` | maximiser |
| `ctrl+shift+f11` | plein écran |

## Divers

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+shift+n` | nouvelle fenêtre kitty |
| `ctrl+shift+u` | insérer un caractère unicode ou un emoji en le cherchant par nom |
| `ctrl+shift+delete` | reset complet du terminal (quand un `cat` d'un binaire a tout cassé) |
| `ctrl+shift+escape` | shell interne de kitty, pour lui envoyer des commandes |

## Config

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+shift+f2` | ouvrir `~/.config/kitty/kitty.conf` |
| `ctrl+shift+f5` | recharger la config sans redémarrer |
| `ctrl+shift+f6` | afficher la config active (pour voir si ton changement a été pris) |
| `ctrl+shift+f1` | doc de kitty |

## Les kittens à lancer à la main

Pas des raccourcis, des commandes à taper dans le terminal :

| Commande | Ça fait quoi |
|-|-|
| `kitten themes` | faire défiler des centaines de thèmes en live et en appliquer un |
| `kitten choose-fonts` | pareil pour les polices, avec aperçu |
| `kitten icat image.png` | afficher une image dans le terminal |
| `kitten diff a b` | diff côte à côte en couleurs |
| `kitten ssh machine` | ssh qui copie la config kitty sur la machine distante |

## Changer un raccourci

Dans `kitty.conf` :

```
map ctrl+shift+t new_tab_with_cwd     # nouvel onglet dans le dossier courant
map ctrl+alt+enter launch --cwd=current
```

Pour désactiver un raccourci par défaut : `map ctrl+shift+q no_op`.
Pour tout virer et repartir de zéro : `clear_all_shortcuts yes` en haut du fichier.

## Fish : les raccourcis à connaître

| Raccourci | Ça fait quoi |
|-|-|
| `→` ou `ctrl+f` | accepter la suggestion grise en entier |
| `alt+→` | accepter seulement le mot suivant de la suggestion |
| `alt+s` | ajouter `sudo` devant la commande (même celle que tu viens de lancer) |
| `alt+e` | éditer la commande en cours dans nvim (pour les commandes longues) |
| `alt+.` | recoller le dernier argument de la commande d'avant |
| `alt+l` | lister le dossier sous le curseur sans effacer ta commande |
| `alt+w` | une ligne d'explication sur la commande sous le curseur |
| `alt+h` | ouvrir le man de la commande sous le curseur |
| `alt+p` | ajouter `| less` à la fin de la commande |
| `alt+b` / `alt+f` (ligne vide) | dossier précédent / suivant |
| `ctrl+r` | historique avec fzf |
| `ctrl+t` | fichier avec fzf, chemin collé dans la commande |
| `alt+c` | dossier avec fzf, et y aller |

## Pour frimer

| Commande | Ça fait quoi |
|-|-|
| `big coucou` | texte géant (`big -s 5 coucou` pour encore plus gros), kitty seulement |
| `kitten icat image.png` | afficher une image (ou un GIF animé) dans le terminal |
| `kitten diff a b` | diff côte à côte en couleurs, marche aussi sur des images |
| `kitten themes` | changer de thème avec aperçu en direct |
| `kitten choose-fonts` | pareil pour la police |
| `make re; kitten notify "fini"` | notification GNOME à la fin d'une commande |

Et tout seul : kitty t'envoie une notification quand une commande de plus de 10 secondes
finit pendant que t'es sur une autre fenêtre.
