Dependencies
------------

### Core tools

* **git** — Version control system
* **neovim** — Text editor
* **zsh** — Shell

### Terminal & CLI enhancements

* **bat** — `cat` clone with syntax highlighting
* **eza** — Modern replacement for `ls`
* **fzf** — Fuzzy finder
* **zoxide** — Smarter `cd` command
* **kitty** — Terminal emulator

### Wayland / Hyprland utilities

* **grim** — Screenshot utility
* **slurp** — Screen selection utility
* **wf-recorder** — Screen recording
* **waybar** — Status bar
* **hyprpaper** — Wallpaper manager
* **hyprlauncher** — Application launcher

### File management

* **dolphin** — File manager

### Media

* **mpv** — Media player

### Browsers

* **firefox** — Web browser
* **brave** — Web browser

Instalation
-----------

Clone the repository
====

```bash
# Clone with recurse-submodules
git clone --recurse-submodules https://github.com/Jose05Code/dotfiles.git
```

Install Dependencies
====

```bash
sudo pacman -S --needed --noconfirm \
    # ── Core tools ─────────────────────────────
    git \               # Version control system
    neovim \            # Text editor
    zsh \               # Shell

    # ── Terminal & CLI enhancements ───────────
    bat \               # cat clone with syntax highlighting
    eza \               # Modern replacement for ls
    fzf \               # Fuzzy finder
    zoxide \            # Smarter cd command
    kitty \             # Terminal emulator

    # ── Wayland / Hyprland utilities ──────────
    grim \              # Screenshot utility
    slurp \             # Screen selection utility
    wf-recorder \       # Screen recording
    waybar \            # Status bar
    hyprpaper \         # Wallpaper manager
    hyprlauncher \      # Application launcher

    # ── File management ───────────────────────
    dolphin \           # File manager

    # ── Media ─────────────────────────────────
    mpv \               # Media player

    # ── Browsers ──────────────────────────────
    firefox \           # Web browser
    brave               # Web browser
```

Create symbolic links
====

```bash
# ── Symbolic links for configuration files ─────────── 
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/zsh/.oh-my-zsh ~/.config/.oh-my-zsh
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/waybar ~/.config/waybar
ln -sf ~/dotfiles/hyprl ~/.conf/hyprl
```

Change default shell to zsh 
====

```bash
chsh -s $(which zsh)
```

