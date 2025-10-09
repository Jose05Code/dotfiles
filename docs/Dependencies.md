# Dependencies Reference

Complete reference guide for all dependencies used in this dotfiles configuration.

## 📦 Core Dependencies

These are required for the basic functionality of the configuration.

### Zsh
**Purpose:** Primary shell  
**Version:** 5.8 or later  
**License:** MIT-like

**Installation:**
```bash
# Arch Linux
sudo pacman -S zsh

# Ubuntu/Debian
sudo apt install zsh

# macOS
brew install zsh
```

**Description:** Zsh (Z Shell) is a powerful shell designed for interactive use. It includes features like programmable command-line completion, extended file globbing, and improved variable handling.

**Documentation:** https://zsh.sourceforge.io/Doc/

---

### Oh My Zsh
**Purpose:** Zsh configuration framework  
**Version:** Latest (auto-updates)  
**License:** MIT

**Installation:**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Description:** Oh My Zsh is a community-driven framework for managing Zsh configuration. It comes bundled with thousands of helpful functions, helpers, plugins, and themes.

**Documentation:** https://github.com/ohmyzsh/ohmyzsh/wiki

**In this config:** Managed as a git submodule at `zsh/.oh-my-zsh/`

---

### Git
**Purpose:** Version control and submodule management  
**Version:** 2.x or later  
**License:** GPL-2.0

**Installation:**
```bash
# Arch Linux
sudo pacman -S git

# Ubuntu/Debian
sudo apt install git

# macOS
brew install git
```

**Description:** Required for cloning the dotfiles repository and managing submodules (plugins and themes).

**Documentation:** https://git-scm.com/doc

---

## 🛠️ Modern CLI Tools

Enhanced command-line tools that replace traditional Unix utilities.

### eza
**Purpose:** Modern replacement for `ls`  
**Version:** 0.10.0 or later  
**License:** MIT

**Installation:**
```bash
# Arch Linux
sudo pacman -S eza

# Ubuntu/Debian (from cargo or GitHub release)
cargo install eza
# OR download from: https://github.com/eza-community/eza/releases

# macOS
brew install eza
```

**Description:** eza is a modern, maintained replacement for ls with colors, icons, tree view, and git integration.

**Features used:**
- Color-coded file types
- Icon display (requires Nerd Font)
- Git status integration
- Tree view
- Human-readable file sizes

**Documentation:** https://github.com/eza-community/eza

**Aliases in config:**
- `ls`, `ll`, `la`, `lla` - Various listing formats
- `lS` - Sort by size
- `lt` - Sort by time
- `lg` - Git-aware listing
- `tree`, `treed` - Tree views

---

### fzf
**Purpose:** Command-line fuzzy finder  
**Version:** 0.35.0 or later  
**License:** MIT

**Installation:**
```bash
# Arch Linux
sudo pacman -S fzf

# Ubuntu/Debian
sudo apt install fzf

# macOS
brew install fzf
```

**Description:** fzf is a general-purpose command-line fuzzy finder. It's an interactive Unix filter that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.

**Features used:**
- File searching
- Directory navigation
- Command history search
- Git branch selection

**Documentation:** https://github.com/junegunn/fzf

**Aliases in config:**
- `vf` - Fuzzy find and edit file
- `cdf` - Fuzzy find directory and cd
- `fh` - Fuzzy search history
- `gb` - Fuzzy git branch switch

---

### bat
**Purpose:** Enhanced file viewer (cat replacement)  
**Version:** 0.22.0 or later  
**License:** MIT/Apache-2.0

**Installation:**
```bash
# Arch Linux
sudo pacman -S bat

# Ubuntu/Debian
sudo apt install bat
# Note: Command is 'batcat' on Debian/Ubuntu
# Create alias: ln -s /usr/bin/batcat ~/.local/bin/bat

# macOS
brew install bat
```

**Description:** bat is a cat clone with syntax highlighting, git integration, automatic paging, and line numbers.

**Features used:**
- Syntax highlighting for many languages
- Git integration (shows file changes)
- Line numbers
- Automatic paging for long files

**Documentation:** https://github.com/sharkdp/bat

**Aliases in config:**
- `bat` - View file with highlighting
- `bats` - Plain output for piping

---

### zoxide
**Purpose:** Smarter cd command  
**Version:** 0.9.0 or later  
**License:** MIT

**Installation:**
```bash
# Arch Linux
sudo pacman -S zoxide

# Ubuntu/Debian
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# macOS
brew install zoxide
```

**Description:** zoxide is a smarter cd command inspired by z and autojump. It remembers which directories you use most frequently and allows you to jump to them quickly.

**Features used:**
- Frecency-based directory ranking (frequency + recency)
- Interactive selection
- Learning from navigation patterns

**Documentation:** https://github.com/ajeetdsouza/zoxide

**Aliases in config:**
- `z` - Interactive jump to directory
- `j` - Jump and list contents with eza

---

## 🎨 Terminal Emulator

### Kitty
**Purpose:** GPU-accelerated terminal emulator  
**Version:** 0.26.0 or later  
**License:** GPL-3.0

**Installation:**
```bash
# Arch Linux
sudo pacman -S kitty

# Ubuntu/Debian
sudo apt install kitty
# OR: curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# macOS
brew install --cask kitty
```

**Description:** Kitty is a fast, feature-rich, GPU-based terminal emulator with support for images, ligatures, and advanced scripting.

**Features used:**
- Custom color scheme (Blazer)
- Multiple clipboard buffers
- Custom keyboard shortcuts
- GPU acceleration

**Documentation:** https://sw.kovidgoyal.net/kitty/

**Configuration files:**
- `kitty/kitty.conf` - Main configuration
- `kitty/Blazer.conf` - Custom color scheme

---

## 🎭 Zsh Plugins

Plugins that extend Zsh functionality.

### Powerlevel10k
**Purpose:** Zsh theme  
**Version:** Latest (git submodule)  
**License:** MIT

**Installation:** Included as submodule at `zsh/ohmyzsh-custom/themes/powerlevel10k`

**Description:** Powerlevel10k is a theme for Zsh with prompt customization, git integration, and fast rendering.

**Features used:**
- Instant prompt
- Git status display
- Command execution time
- Configurable segments

**Documentation:** https://github.com/romkatv/powerlevel10k

**Configuration:** `~/.p10k.zsh` (generated by `p10k configure`)

---

### zsh-autosuggestions
**Purpose:** Fish-like autosuggestions  
**Version:** Latest (git submodule)  
**License:** MIT

**Installation:** Included as submodule at `zsh/ohmyzsh-custom/plugins/zsh-autosuggestions`

**Description:** Suggests commands as you type based on history and completions.

**Features:**
- Real-time suggestions
- Accept with right arrow
- Based on command history

**Documentation:** https://github.com/zsh-users/zsh-autosuggestions

---

### zsh-syntax-highlighting
**Purpose:** Command syntax highlighting  
**Version:** Latest (git submodule)  
**License:** BSD-3-Clause

**Installation:** Included as submodule at `zsh/ohmyzsh-custom/plugins/zsh-syntax-highlighting`

**Description:** Provides syntax highlighting for commands as you type them in the shell.

**Features:**
- Real-time syntax highlighting
- Green for valid commands
- Red for invalid commands
- Blue for options

**Documentation:** https://github.com/zsh-users/zsh-syntax-highlighting

---

### zsh-autoenv
**Purpose:** Directory-based environments  
**Version:** Latest (git submodule)  
**License:** MIT

**Installation:** Included as submodule at `zsh/ohmyzsh-custom/plugins/autoenv`

**Description:** Automatically sources `.env` files when entering directories, enabling directory-specific environment variables.

**Features:**
- Automatic environment loading
- Directory-specific settings
- Security prompts

**Documentation:** https://github.com/Tarrasch/zsh-autoenv

---

## 🔤 Fonts

### Nerd Fonts (Required)
**Purpose:** Icon display in terminal  
**Recommended:** MesloLGS NF  
**License:** Varies by font

**Installation:**
```bash
# Arch Linux
sudo pacman -S ttf-meslo-nerd

# Ubuntu/Debian
# Manual download from: https://github.com/romkatv/powerlevel10k#fonts

# macOS
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
```

**Description:** Nerd Fonts are fonts patched with icons and glyphs. Required for proper display of icons in eza and Powerlevel10k.

**Documentation:** https://www.nerdfonts.com/

**Recommended fonts:**
- MesloLGS NF (optimized for Powerlevel10k)
- FiraCode Nerd Font
- JetBrains Mono Nerd Font
- Hack Nerd Font

---

## 📚 Oh My Zsh Built-in Plugins

Plugins included with Oh My Zsh (no installation needed).

### git
**Purpose:** Git aliases and functions  
**Features:** 100+ git aliases for common operations

**Common aliases:**
- `ga` - git add
- `gc` - git commit
- `gp` - git push
- `gl` - git pull
- `gst` - git status
- `gco` - git checkout

### sudo
**Purpose:** Quick sudo prefix  
**Features:** Press Esc twice to add sudo to current/previous command

### history-substring-search
**Purpose:** Better history search  
**Features:** Use Up/Down arrows to search history by substring

### web-search
**Purpose:** Search web from terminal  
**Features:** Search engines: google, stackoverflow, github, etc.

**Usage:**
```bash
google "search term"
stackoverflow "question"
github "repository name"
```

### pip
**Purpose:** Python package manager completion  
**Features:** Tab completion for pip commands

### colored-man-pages
**Purpose:** Colorful manual pages  
**Features:** Makes man pages easier to read with colors

---

## 🔧 Optional Dependencies

These are not required but enhance the experience.

### Neovim / Vim
**Purpose:** Text editor for `vf` alias  
**Version:** Any recent version  
**License:** Apache-2.0 (Neovim) / Vim License (Vim)

**Installation:**
```bash
# Arch Linux
sudo pacman -S neovim

# Ubuntu/Debian
sudo apt install neovim

# macOS
brew install neovim
```

**Used in:** `vf` alias (fuzzy find and edit)

---

### Visual Studio Code
**Purpose:** Default editor in Kitty config  
**Version:** Latest  
**License:** Proprietary (with MIT licensed components)

**Installation:**
```bash
# Arch Linux (from AUR)
yay -S visual-studio-code-bin

# Ubuntu/Debian
# Download from: https://code.visualstudio.com/

# macOS
brew install --cask visual-studio-code
```

**Configured in:** `kitty/kitty.conf` as default editor

---

### tmux
**Purpose:** Terminal multiplexer  
**Version:** 3.x or later  
**License:** ISC

**Installation:**
```bash
# Arch Linux
sudo pacman -S tmux

# Ubuntu/Debian
sudo apt install tmux

# macOS
brew install tmux
```

**Use case:** Advanced terminal management and session persistence

---

## 📊 Dependency Matrix

### Minimum Required

| Dependency | Arch Linux | Ubuntu/Debian | macOS |
|------------|------------|---------------|-------|
| Zsh | ✅ | ✅ | ✅ (built-in) |
| Git | ✅ | ✅ | ✅ |
| Oh My Zsh | ✅ | ✅ | ✅ |

### Core Tools (Installed by zsh.bash)

| Tool | Arch Linux | Ubuntu/Debian | macOS |
|------|------------|---------------|-------|
| eza | ✅ pacman | ⚠️ manual | ✅ brew |
| fzf | ✅ pacman | ✅ apt | ✅ brew |
| bat | ✅ pacman | ⚠️ batcat | ✅ brew |
| zoxide | ✅ pacman | ⚠️ script | ✅ brew |

✅ = Available in package manager  
⚠️ = Requires additional steps

### Optional Components

| Component | Arch Linux | Ubuntu/Debian | macOS |
|-----------|------------|---------------|-------|
| Kitty | ✅ pacman | ✅ apt | ✅ brew |
| Neovim | ✅ pacman | ✅ apt | ✅ brew |
| VS Code | AUR | Manual | ✅ brew |
| Nerd Fonts | ✅ pacman | Manual | ✅ brew |

---

## 🔍 Checking Installed Versions

Use these commands to verify installed versions:

```bash
# Zsh
zsh --version

# Git
git --version

# eza
eza --version

# fzf
fzf --version

# bat
bat --version

# zoxide
zoxide --version

# Kitty
kitty --version

# Neovim
nvim --version
```

---

## 🆘 Troubleshooting Dependencies

### Command Not Found

**Problem:** `command: eza: command not found`

**Solution:** Install the missing dependency:
```bash
# Check which package provides it
# Arch: pacman -Ss eza
# Ubuntu: apt search eza
```

### Version Too Old

**Problem:** Features don't work as expected

**Solution:** Update to latest version:
```bash
# Arch
sudo pacman -Syu eza

# Ubuntu
# May need to install from source or newer PPA

# macOS
brew upgrade eza
```

### Submodules Not Initialized

**Problem:** Plugins missing

**Solution:**
```bash
cd ~/dotfiles
git submodule update --init --recursive
```

---

## 📦 Complete Installation Command Reference

### Arch Linux (One-liner)
```bash
sudo pacman -S zsh git eza fzf bat zoxide kitty
```

### Ubuntu/Debian (Comprehensive)
```bash
sudo apt update
sudo apt install -y zsh git fzf bat kitty curl wget

# Install eza
cargo install eza
# OR download binary

# Install zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Fix bat symlink
ln -s /usr/bin/batcat ~/.local/bin/bat
```

### macOS (One-liner)
```bash
brew install zsh git eza fzf bat zoxide
brew install --cask kitty
```

---

## 🔄 Keeping Dependencies Updated

### Update All (Arch Linux)
```bash
sudo pacman -Syu
```

### Update All (macOS)
```bash
brew update && brew upgrade
```

### Update Submodules
```bash
cd ~/dotfiles
git submodule update --remote
```

---

## 📝 License Information

All dependencies used are open source or have permissive licenses:

- **MIT License:** eza, fzf, bat, zoxide, Powerlevel10k, zsh-autosuggestions, zsh-autoenv
- **BSD/MIT-like:** Zsh, Oh My Zsh
- **GPL-3.0:** Kitty
- **Apache-2.0/MIT:** bat (dual license)
- **BSD-3-Clause:** zsh-syntax-highlighting

---

## 🔗 Quick Reference Links

**Documentation:**
- [Zsh](https://zsh.sourceforge.io/Doc/)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [eza](https://github.com/eza-community/eza)
- [fzf](https://github.com/junegunn/fzf)
- [bat](https://github.com/sharkdp/bat)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [Kitty](https://sw.kovidgoyal.net/kitty/)

**Installation Guides:**
- [Installation Guide](Installation-Guide.md)
- [Troubleshooting](Installation-Guide.md#troubleshooting-common-issues)

---

**Last Updated:** Use `git log -1 --format=%cd docs/Dependencies.md` to see last update time.
