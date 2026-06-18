# linux_essentials

Persönliches Dotfiles/Setup-Repo für schnelles Aufsetzen neuer Linux-Maschinen.
Primäres Target: Raspberry Pi 5 mit Raspberry Pi OS (Debian, aarch64).

## Quickstart

```bash
curl -fsSL https://raw.githubusercontent.com/jakobneri/linux_essentials/master/install.sh | bash
```

Oder manuell:

```bash
git clone https://github.com/jakobneri/linux_essentials.git
cd linux_essentials
./install.sh
```

`install.sh` ist idempotent — mehrfaches Ausführen ist sicher.

## Was install.sh macht

1. Klont das Repo nach `~/linux_essentials` (falls noch nicht vorhanden/lokal vorhanden)
2. Installiert Standard-Programme via `programs/install.sh`
3. Verlinkt Configs:
   - `tmux/.tmux.conf` → `~/.tmux.conf`
   - `btop/themes/pastel.theme` → `~/.config/btop/themes/pastel.theme`
   - `htop/htoprc` → `~/.config/htop/htoprc`
   - `bashrc/aliases.sh` wird in `~/.bashrc` gesourced

## Struktur

```
linux_essentials/
├── README.md
├── install.sh          # Bootstrap: klont Repo, führt Setup aus
├── bashrc/
│   └── aliases.sh       # alle Shortcuts (wird in .bashrc gesourced)
├── tmux/
│   └── .tmux.conf       # Lavendel-Theme
├── btop/
│   └── themes/
│       └── pastel.theme
├── htop/
│   └── htoprc            # Pi-optimierte Config
└── programs/
    └── install.sh        # installiert Standard-Programme
```

## Programme

Installiert via `programs/install.sh` (alles über `apt`, außer cloudflared):

- `tmux`
- `btop`
- `htop`
- `docker.io`
- `cloudflared` — ARM64/AMD64-Binary direkt von Cloudflare (kein apt-Paket)

## Shortcuts

- `,` → `btop`
- `t` → tmux smart-attach (`t` attached an Session oder erstellt neue; `t n <name>` neue Session; `t ls` / `t ks` list/kill)
- `..`, `...`, `....` → `cd` Shortcuts
- `ll`, `la` → `ls` Varianten
- `dps`, `dlogs` → Docker-Shortcuts
