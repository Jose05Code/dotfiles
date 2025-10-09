# Customization Guide

Learn how to customize and extend your dotfiles configuration to match your preferences and workflow.

## Table of Contents

- [Understanding the Structure](#understanding-the-structure)
- [Customizing Aliases](#customizing-aliases)
- [Modifying the Prompt](#modifying-the-prompt)
- [Changing Kitty Terminal](#changing-kitty-terminal)
- [Adding New Plugins](#adding-new-plugins)
- [Custom Functions](#custom-functions)
- [Environment Variables](#environment-variables)
- [Theme Customization](#theme-customization)

---

## Understanding the Structure

### Directory Layout

```
~/dotfiles/
├── kitty/
│   ├── kitty.conf         # Main Kitty configuration
│   └── Blazer.conf        # Blazer color scheme
├── zsh/
│   ├── .oh-my-zsh/        # Oh My Zsh framework (submodule)
│   ├── ohmyzsh-custom/    # Custom plugins and themes
│   │   ├── plugins/       # External plugins
│   │   └── themes/        # Custom themes (Powerlevel10k)
│   ├── aliases.zsh        # Shell aliases
│   ├── zshrc              # Main Zsh configuration
│   └── zsh.bash           # Dependency installer (Arch Linux)
└── docs/                  # Documentation files
```

### Configuration Files

- **`~/.zshrc`**: Symlinked to `~/dotfiles/zsh/zshrc` - main shell configuration
- **`~/.config/kitty/kitty.conf`**: Symlinked to `~/dotfiles/kitty/kitty.conf` - terminal configuration
- **`~/.p10k.zsh`**: Powerlevel10k prompt configuration (generated locally)

---

## Customizing Aliases

### Where to Add Aliases

Edit `~/dotfiles/zsh/aliases.zsh` to add or modify aliases.

### Basic Alias Syntax

```bash
# Simple command alias
alias shortname='long command here'

# Alias with options
alias ll='eza -lh --icons'

# Alias with pipe
alias mygrep='grep --color=auto | less'
```

### Example Custom Aliases

Add these to `aliases.zsh`:

```bash
#=================================================
# My Custom Aliases
#=================================================

# Quick edit config files
alias ezsh='nvim ~/dotfiles/zsh/zshrc'
alias ealias='nvim ~/dotfiles/zsh/aliases.zsh'
alias ekitty='nvim ~/dotfiles/kitty/kitty.conf'

# Project shortcuts
alias proj='cd ~/Projects'
alias work='cd ~/Work'

# Docker shortcuts
alias dps='docker ps'
alias dimg='docker images'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'

# System maintenance (Arch Linux)
alias update='sudo pacman -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Quick web searches
alias ytsearch='web_search youtube'

# Git shortcuts (in addition to Oh My Zsh git plugin)
alias glog='git log --oneline --graph --decorate'
alias gundo='git reset --soft HEAD~1'

# Network utilities
alias myip='curl ifconfig.me'
alias ports='netstat -tulanp'

# System info
alias cpu='lscpu'
alias mem='free -h'
```

### Conditional Aliases (Platform-Specific)

```bash
# Different commands for different OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS specific
    alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES'
    alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO'
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux specific
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi
```

### Applying Changes

After editing aliases:
```bash
source ~/.zshrc
# or
exec zsh
```

---

## Modifying the Prompt

### Powerlevel10k Configuration Wizard

The easiest way to customize your prompt:

```bash
p10k configure
```

This interactive wizard lets you choose:
- **Style**: Lean, Classic, Rainbow, Pure
- **Character Set**: Unicode, ASCII
- **Prompt Colors**
- **Prompt Flow**: One line vs Two line
- **Icons**: Many or Few
- **Git Status Verbosity**
- And much more!

<!-- Screenshot placeholder: p10k configure wizard -->

### Manual Configuration

After running the wizard, settings are saved to `~/.p10k.zsh`.

Edit this file to fine-tune:

```bash
nvim ~/.p10k.zsh
```

### Common Customizations

#### Change Prompt Colors

Find and modify color definitions:
```bash
# Example: Change directory color
typeset -g POWERLEVEL9K_DIR_FOREGROUND=39      # Cyan
typeset -g POWERLEVEL9K_DIR_BACKGROUND=237     # Dark gray
```

#### Add/Remove Prompt Elements

Find the `POWERLEVEL9K_LEFT_PROMPT_ELEMENTS` array:
```bash
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon                 # OS icon
    dir                     # Current directory
    vcs                     # Git status
    newline                 # New line
    prompt_char             # Prompt character
)
```

Available elements:
- `dir` - Current directory
- `vcs` - Git/VCS status
- `time` - Current time
- `status` - Exit code
- `command_execution_time` - How long command took
- `context` - User@hostname
- `virtualenv` - Python virtual environment
- `rbenv` - Ruby version
- `nodenv` - Node.js version
- And many more!

#### Show Current Time

```bash
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # Exit code
    command_execution_time  # Command duration
    time                    # Current time
)
```

#### Customize Git Display

```bash
# Show detailed git status
typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0.01

# Colors for different states
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76       # Green when clean
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=220   # Yellow when modified
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=196  # Red for untracked
```

### Apply Prompt Changes

```bash
source ~/.p10k.zsh
```

---

## Changing Kitty Terminal

### Basic Settings

Edit `~/dotfiles/kitty/kitty.conf`:

```bash
nvim ~/dotfiles/kitty/kitty.conf
```

### Font Configuration

```bash
# Font family
font_family      MesloLGS NF
bold_font        auto
italic_font      auto
bold_italic_font auto

# Font size
font_size 12.0

# Font features
disable_ligatures never
```

### Window Settings

```bash
# Window padding
window_padding_width 4

# Background opacity
background_opacity 0.95

# Remember window size
remember_window_size yes
initial_window_width  1200
initial_window_height 800
```

### Cursor Customization

```bash
# Cursor shape: block, beam, underline
cursor_shape block

# Cursor blink
cursor_blink_interval 0.5
cursor_stop_blinking_after 15.0
```

### Tab Bar

```bash
# Tab bar style: powerline, separator, hidden
tab_bar_style powerline

# Tab bar position: top, bottom
tab_bar_edge top

# Active tab colors
active_tab_foreground   #000
active_tab_background   #00ff00
inactive_tab_foreground #444
inactive_tab_background #999
```

### Custom Keyboard Shortcuts

Add to `kitty.conf`:

```bash
# New tab
map ctrl+shift+t new_tab

# Close tab
map ctrl+shift+w close_tab

# Switch tabs
map ctrl+shift+right next_tab
map ctrl+shift+left previous_tab

# New window
map ctrl+shift+enter new_window

# Split window
map ctrl+shift+\ launch --location=vsplit
map ctrl+shift+- launch --location=hsplit

# Custom: Open URL
map ctrl+shift+u open_url_with_hints
```

### Changing Color Schemes

#### Option 1: Use a Different Built-in Theme

```bash
# In kitty.conf, replace:
include ~/dotfiles/kitty/Blazer.conf

# With one of:
include ~/dotfiles/kitty/Dracula.conf
include ~/dotfiles/kitty/Nord.conf
include ~/dotfiles/kitty/Solarized.conf
```

#### Option 2: Create Your Own Theme

Create a new file `~/dotfiles/kitty/MyTheme.conf`:

```bash
# Background and foreground
background #1e1e1e
foreground #d4d4d4

# Cursor colors
cursor #ffffff
cursor_text_color #000000

# Selection colors
selection_background #264f78
selection_foreground #ffffff

# Black
color0 #000000
color8 #666666

# Red
color1 #cd3131
color9 #f14c4c

# Green
color2  #0dbc79
color10 #23d18b

# Yellow
color3  #e5e510
color11 #f5f543

# Blue
color4  #2472c8
color12 #3b8eea

# Magenta
color5  #bc3fbc
color13 #d670d6

# Cyan
color6  #11a8cd
color14 #29b8db

# White
color7  #e5e5e5
color15 #e5e5e5
```

Update `kitty.conf`:
```bash
include ~/dotfiles/kitty/MyTheme.conf
```

#### Option 3: Use kitty-themes Repository

```bash
cd ~/dotfiles/kitty
git clone --depth 1 https://github.com/dexpota/kitty-themes.git themes

# Then in kitty.conf:
include ~/dotfiles/kitty/themes/Monokai.conf
```

### Apply Kitty Changes

Changes take effect immediately in new windows, or reload:
```bash
# In Kitty
Ctrl+Shift+F5
```

---

## Adding New Plugins

### Oh My Zsh Built-in Plugins

1. Browse available plugins:
   ```bash
   ls ~/.oh-my-zsh/plugins
   ```

2. Edit `~/dotfiles/zsh/zshrc`:
   ```bash
   plugins=(
     git
     sudo
     # ... existing plugins ...
     
     # Add new plugins here
     docker
     npm
     python
   )
   ```

3. Reload:
   ```bash
   source ~/.zshrc
   ```

Popular plugins to try:
- `docker` - Docker aliases and completion
- `npm` - NPM aliases
- `yarn` - Yarn aliases
- `python` - Python aliases
- `golang` - Go development helpers
- `kubectl` - Kubernetes CLI helpers
- `terraform` - Terraform helpers

### Adding External Plugins

#### Method 1: As Git Submodule (Recommended)

```bash
# Example: Adding zsh-interactive-cd
cd ~/dotfiles/zsh/ohmyzsh-custom/plugins
git submodule add https://github.com/changyuheng/zsh-interactive-cd.git

# Update .gitmodules
cd ~/dotfiles
git add .gitmodules zsh/ohmyzsh-custom/plugins/zsh-interactive-cd
git commit -m "Add zsh-interactive-cd plugin"
```

Add to `zshrc`:
```bash
plugins=(
  # ... existing plugins ...
  zsh-interactive-cd
)
```

#### Method 2: Manual Installation

```bash
cd ~/dotfiles/zsh/ohmyzsh-custom/plugins
git clone https://github.com/some-user/some-plugin.git
```

**Note:** This won't track the plugin in your repository.

### Recommended Additional Plugins

```bash
# zsh-interactive-cd: Interactive cd with fzf
git submodule add https://github.com/changyuheng/zsh-interactive-cd.git \
  zsh/ohmyzsh-custom/plugins/zsh-interactive-cd

# zsh-z: Even smarter directory jumper
git submodule add https://github.com/agkozak/zsh-z.git \
  zsh/ohmyzsh-custom/plugins/zsh-z

# zsh-vi-mode: Vi mode for command line
git submodule add https://github.com/jeffreytse/zsh-vi-mode.git \
  zsh/ohmyzsh-custom/plugins/zsh-vi-mode
```

---

## Custom Functions

Add custom shell functions to `~/dotfiles/zsh/aliases.zsh`.

### Example Functions

```bash
#=================================================
# Custom Functions
#=================================================

# Create and cd into directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.tar.xz)    tar xJf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick backup of a file
backup() {
    cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}

# Find and replace in files
findreplace() {
    if [ $# -ne 3 ]; then
        echo "Usage: findreplace <directory> <find> <replace>"
        return 1
    fi
    find "$1" -type f -exec sed -i "s/$2/$3/g" {} +
}

# Show directory size in current folder
dirsize() {
    du -sh * | sort -hr
}

# Quick git commit with message
gcm() {
    git add .
    git commit -m "$1"
}

# Start a simple HTTP server
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# Create animated GIF from video
# Requires ffmpeg
vid2gif() {
    if [ $# -lt 2 ]; then
        echo "Usage: vid2gif input.mp4 output.gif"
        return 1
    fi
    ffmpeg -i "$1" -vf "fps=10,scale=720:-1:flags=lanczos" -c:v gif "$2"
}
```

---

## Environment Variables

### Adding Environment Variables

Add to `~/dotfiles/zsh/zshrc`:

```bash
# After the Oh My Zsh source line, add:

# Custom environment variables
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Project directories
export PROJECTS_DIR="$HOME/Projects"
export WORK_DIR="$HOME/Work"

# Development
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Node.js
export NODE_ENV='development'

# Python
export PYTHONDONTWRITEBYTECODE=1
```

### Per-Project Environment Variables

Use the `autoenv` plugin (already included) to automatically load `.env` files.

Create `.env` in project root:
```bash
export PROJECT_NAME="my-project"
export DEBUG=true
export API_KEY="your-key-here"
```

When you `cd` into that directory, variables are automatically set!

---

## Theme Customization

### Changing Zsh Theme

To use a different theme entirely:

1. Edit `~/dotfiles/zsh/zshrc`
2. Change the `ZSH_THEME` line:
   ```bash
   ZSH_THEME="robbyrussell"  # Or any other theme
   ```

Popular alternatives:
- `agnoster`
- `robbyrussell`
- `avit`
- `spaceship`
- `pure`

### Installing Additional Themes

```bash
# Example: Installing Spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git \
  ~/dotfiles/zsh/ohmyzsh-custom/themes/spaceship-prompt

ln -s ~/dotfiles/zsh/ohmyzsh-custom/themes/spaceship-prompt/spaceship.zsh-theme \
  ~/dotfiles/zsh/ohmyzsh-custom/themes/spaceship.zsh-theme

# Update zshrc
ZSH_THEME="spaceship"
```

---

## Best Practices

### 1. Version Control Your Changes

```bash
cd ~/dotfiles
git add .
git commit -m "Customize: Add personal aliases"
git push
```

### 2. Document Your Customizations

Add comments to your configuration files:
```bash
# Personal aliases for Docker management
alias dps='docker ps'  # Show running containers
```

### 3. Test Before Committing

```bash
# Test in new shell
zsh

# If something breaks, exit and fix
exit
```

### 4. Backup Before Major Changes

```bash
cp ~/dotfiles/zsh/zshrc ~/dotfiles/zsh/zshrc.backup
```

### 5. Keep It Organized

Group related aliases and functions together with clear comments.

---

## Troubleshooting Customizations

### Changes Not Taking Effect

```bash
# Reload configuration
source ~/.zshrc

# Or restart shell
exec zsh
```

### Syntax Errors

Check for errors:
```bash
zsh -n ~/dotfiles/zsh/zshrc
zsh -n ~/dotfiles/zsh/aliases.zsh
```

### Plugin Not Loading

1. Verify plugin is in `plugins=()` array
2. Check plugin directory exists
3. Reload shell

### Prompt Issues

```bash
# Reconfigure Powerlevel10k
p10k configure

# Or remove and regenerate
rm ~/.p10k.zsh
p10k configure
```

---

**Next Steps:**
- Try adding a few custom aliases
- Experiment with prompt customization
- Explore [Advanced Features](Advanced-Features.md) for more ideas!
