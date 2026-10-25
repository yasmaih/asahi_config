# Ma config : MacBook Air M1 sous Asahi

MacBook Air M1 (2020), 8 Go de RAM, Fedora Asahi Remix 44, GNOME.
Montée dans la nuit du 24 au 25 octobre 2026, après avoir viré macOS.

```
kitty  ─  fish  ─  fastfetch + accueil  ─  fzf / zoxide  ─  git + SSH
```

## Ce qui est installé

Tout vient des dépôts officiels de Fedora, sauf la police.

| Paquet | À quoi ça sert |
|-|-|
| `gcc`, `clang`, `make`, `gdb`, `valgrind` | compiler et débugger le C |
| `neovim` | l'éditeur (LazyVim pas encore installé) |
| `kitty` | le terminal |
| `fish` | le shell |
| `fzf` | recherche floue dans n'importe quelle liste |
| `zoxide` | `cd` qui se souvient des dossiers où tu vas souvent |
| `ripgrep` (`rg`), `fd-find` (`fd`) | chercher dans les fichiers / chercher des fichiers, en rapide |
| `bat` | `cat` avec coloration syntaxique |
| `tree` | arborescence d'un dossier |
| `fastfetch` | infos système + dessin au lancement |
| `chafa`, `ImageMagick` | transformer des images en dessins braille |
| `pipx` | installer des outils Python à part (pour norminette) |

Police : **Fantasque Sans Mono, version Nerd Font**, téléchargée depuis les releases
de [nerd-fonts](https://github.com/ryanoasis/nerd-fonts), installée dans
`~/.local/share/fonts/FantasqueSansMNerdFont/`.

## Installer sur une machine neuve

```fish
git clone git@github.com:yasmaih/asahi_config.git ~/asahi_config
~/asahi_config/install.sh
chsh -s /usr/bin/fish
```

`install.sh` installe les paquets, télécharge la police, et crée des liens symboliques de
`~/.config` vers ce repo. Les vrais fichiers sont dans `~/asahi_config` : quand tu modifies
ta config, c'est direct dans le repo, t'as plus qu'à commit.

## Le repo

```
asahi_config/
├── install.sh                paquets + police + liens symboliques
├── docs/raccourcis-kitty.md  fiche de tous les raccourcis kitty
├── claude/peer42.md          style "Peer 42" de Claude Code
├── kitty/
│   ├── kitty.conf            config du terminal
│   └── current-theme.conf    thème Blazer (généré par kitten themes)
├── fish/
│   ├── config.fish           démarrage du shell
│   ├── messages.txt          messages d'accueil au hasard
│   └── functions/
│       ├── fish_prompt.fish        prompt de gauche
│       ├── fish_right_prompt.fish  prompt de droite
│       ├── greeting.fish           le "coucou Yasmine"
│       └── addlogo.fish            image → logo braille
└── fastfetch/
    ├── config.jsonc          ce que fastfetch affiche
    └── logos/                les dessins, un tiré au hasard
```

Liens symboliques : `~/.config/{kitty,fish,fastfetch}`, `~/.claude/output-styles/peer42.md`,
`~/Documents/kitty-how-it-works/raccourcis.md` et `~/Documents/README-config.md` pointent
tous vers ce repo.

## Kitty

- Police Fantasque en 13, thème **Blazer** (bleu nuit, couleurs pastel).
- fish lancé direct (ligne `shell` dans `kitty.conf`).
- Layouts : `splits` par défaut, puis `tall` et `stack`.
- Marges entre panneaux, onglets en powerline inclinés.
- Touche leader **`ctrl+a`** : tu appuies, tu lâches, puis la lettre.

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+a > c` | nouvel onglet dans le dossier courant |
| `ctrl+a > n` / `p` | onglet suivant / précédent |
| `ctrl+a > 1`...`9` | aller à l'onglet N |
| `ctrl+a > ,` | renommer l'onglet |
| `ctrl+a > &` | fermer l'onglet |
| `ctrl+a > v` / `s` | couper à droite / en bas (comme `:vsplit` / `:split`) |
| `ctrl+a > h j k l` | changer de panneau |
| `ctrl+a > z` | zoomer sur un panneau, et revenir |
| `ctrl+a > r` | redimensionner |
| `ctrl+a > x` | fermer le panneau |
| `ctrl+a > e` / `shift+r` | ouvrir / recharger la config |
| `ctrl+a > ctrl+a` | envoyer un vrai `ctrl+a` |

Les raccourcis `ctrl+shift` par défaut marchent toujours. Tout est dans
`docs/raccourcis-kitty.md`.

Changer de thème : `kitten themes`, Entrée sur le thème, puis `M`.

## Fish

### À l'ouverture de kitty

Seulement dans le premier panneau, pas dans les nouveaux onglets :

1. **fastfetch**, avec un dessin tiré au hasard dans `~/.config/fastfetch/logos/`,
   jamais le même deux fois de suite. Icônes Nerd Font, barres pour RAM, disque et
   batterie, couleurs prises dans le thème.
2. **L'accueil** (`greeting`) : "coucou Yasmine", une phrase du chat `=^.^=` qui dépend
   de l'heure, et un message au hasard tiré de `messages.txt` (compliments, motivation,
   fun facts) avec un kaomoji.

Ajouter un message : une ligne de plus dans `~/.config/fish/messages.txt`.

### Le prompt

Style bobthefish, fait maison :

```
 yaichi  ~/42/minishell   main ●                    04:52
❯
```

- Nom en rose, dossier en gris, branche git en vert (propre) ou jaune (modifs pas commitées).
- Segment rouge avec le code d'erreur si la dernière commande a planté (`139` = segfault).
- À droite : l'heure, et la durée de la commande si elle a pris plus de 2 secondes.

### fzf

| Raccourci | Ça fait quoi |
|-|-|
| `ctrl+r` | chercher dans l'historique des commandes |
| `ctrl+t` | chercher un fichier et coller son chemin (aperçu avec `bat`) |
| `alt+c` | chercher un dossier et y aller (aperçu avec `tree`) |

Il cherche avec `fd` (rapide, respecte le `.gitignore`), s'ouvre sous la ligne de commande
et prend les couleurs du thème. Marche aussi derrière n'importe quoi : `ls | fzf`.

### zoxide

| Commande | Ça fait quoi |
|-|-|
| `z mot` | aller dans le dossier fréquent qui matche |
| `z conf kit` | plusieurs mots pour préciser |
| `zi` | choisir dans fzf |
| `z -` | dossier précédent |
| `zoxide query -ls` | voir les dossiers connus et leur score |

Il apprend au fur et à mesure, donc il paraît nul les premiers jours.

### addlogo

Transforme une image en dessin braille pour fastfetch.

```fish
addlogo image.jpg            # nommé d'après le fichier
addlogo -n chat image.jpg    # nom choisi
addlogo -w 30 image.jpg      # largeur (40 par défaut, pas plus sinon les infos sont coupées)
addlogo -c image.jpg         # en couleur (pour les images à fond sombre ou transparent)
addlogo ~/Downloads/chafa/*  # tout un dossier
```

Coupe les marges vides et inverse les images à fond clair. Ça rend bien avec des dessins
à contours nets, mal avec des photos ou des images qui sont déjà de l'ASCII art.
Les dessins tout faits : [emojicombos.com](https://emojicombos.com) (cherche "dot art").

### Variables

- `EDITOR` et `VISUAL` = `nvim`
- `BAT_THEME` = `ansi` (bat prend les couleurs du terminal)

## Git et SSH

```
user.name          Yasmine
init.defaultBranch main
core.editor        nvim
pull.ff            only     pull refuse de créer un commit de merge surprise
```

Clé SSH `~/.ssh/id_ed25519`, avec phrase de passe. La clé publique
(`~/.ssh/id_ed25519.pub`) va sur GitHub et dans le profil de l'intra pour la vogsphere.

## Reste à faire

- [ ] `chsh -s /usr/bin/fish` : le shell par défaut est encore bash (kitty lance fish quand même)
- [ ] LazyVim + Neovide, et un thème nvim assorti à Blazer
- [ ] `vr` : ouvrir un fichier récent de nvim avec fzf
- [ ] zoxide à la place de `cd` ? (`zoxide init fish --cmd cd`)
- [ ] lazygit (binaire depuis les releases GitHub)
- [ ] norminette avec pipx
- [ ] vérifier si valgrind marche avec les pages 16K d'Asahi
- [ ] `btop` et regarder pourquoi la RAM monte à 90 %
- [ ] sessions kitty par projet 42
