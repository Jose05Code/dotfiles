# Quick Reference Card

A quick reference for the most important commands and features in your dotfiles setup.

## 🚀 Quick Start Commands

### File Navigation (eza)
```bash
ls          # List files with icons
ll          # Detailed listing
la          # Show all files (including hidden)
lla         # Detailed listing of all files
lS          # Sort by size
lt          # Sort by time (newest first)
lg          # Git-aware listing
tree        # Tree view (2 levels)
treed       # Tree view (directories only)
```

### Fuzzy Finding (fzf)
```bash
vf          # Fuzzy find and open file in Neovim
cdf         # Fuzzy find and cd into directory
fh          # Fuzzy search command history
gb          # Fuzzy git branch switch
Ctrl+R      # Reverse search history (built-in)
```

### Smart Navigation (zoxide)
```bash
z <partial> # Jump to directory (e.g., z proj)
j <partial> # Jump and list contents
```

### File Viewing (bat)
```bash
bat file    # View file with syntax highlighting
bats file   # Plain view (for piping)
```

### Git Shortcuts (Oh My Zsh)
```bash
ga          # git add
gc          # git commit
gp          # git push
gl          # git pull
gst         # git status
gco         # git checkout
gb          # Fuzzy branch switch (custom)
```

## 🎨 Customization Commands

### Prompt
```bash
p10k configure    # Configure Powerlevel10k
```

### Configuration Files
```bash
# Edit Zsh config
nvim ~/.zshrc
# or
nvim ~/dotfiles/zsh/zshrc

# Edit aliases
nvim ~/dotfiles/zsh/aliases.zsh

# Edit Kitty config
nvim ~/dotfiles/kitty/kitty.conf

# Reload Zsh config
source ~/.zshrc
# or
exec zsh
```

## 🖥️ Kitty Terminal

### Clipboard Buffers
```bash
F1          # Copy to buffer A
Alt+F1      # Paste from buffer A
F2          # Copy to buffer B
Alt+F2      # Paste from buffer B
F3          # Copy to buffer C
Alt+F3      # Paste from buffer C
F4          # Copy to buffer D
Alt+F4      # Paste from buffer D
```

### Window Management
```bash
Ctrl+Shift+Enter    # New window
Ctrl+Shift+T        # New tab
Ctrl+Shift+W        # Close tab/window
Ctrl+Shift+]        # Next tab
Ctrl+Shift+[        # Previous tab
Ctrl+Shift+F5       # Reload config
```

## 🛠️ Maintenance

### Update System (Arch Linux)
```bash
sudo pacman -Syu
```

### Update Submodules
```bash
cd ~/dotfiles
git submodule update --remote
```

### Check Versions
```bash
zsh --version
eza --version
fzf --version
bat --version
zoxide --version
```

## 🔍 Troubleshooting

### Reload Shell Config
```bash
source ~/.zshrc
# or
exec zsh
```

### Reinitialize Submodules
```bash
cd ~/dotfiles
git submodule update --init --recursive
```

### Check for Errors
```bash
zsh -n ~/.zshrc          # Check for syntax errors
```

### Reset Zoxide Database
```bash
rm ~/.local/share/zoxide/db.zo
```

## 📁 Important Paths

```bash
~/dotfiles/                           # Dotfiles repository
~/dotfiles/zsh/zshrc                 # Main Zsh config
~/dotfiles/zsh/aliases.zsh           # Custom aliases
~/dotfiles/kitty/kitty.conf          # Kitty config
~/dotfiles/kitty/Blazer.conf         # Color scheme
~/.zshrc                             # Symlink to dotfiles/zsh/zshrc
~/.config/kitty/kitty.conf           # Symlink to dotfiles/kitty/kitty.conf
~/.p10k.zsh                          # Powerlevel10k config
```

## 🎓 Learning Resources

### Documentation Files
```bash
cat ~/dotfiles/README.md                        # Main README
cat ~/dotfiles/docs/Installation-Guide.md       # Installation
cat ~/dotfiles/docs/Usage-Guide.md             # Usage examples
cat ~/dotfiles/docs/Customization.md           # Customization
cat ~/dotfiles/docs/Advanced-Features.md       # Advanced tips
cat ~/dotfiles/docs/Dependencies.md            # Dependency info
```

### Online Resources
- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)
- [Oh My Zsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)

## 💡 Pro Tips

1. **Use tab completion** - Press Tab to complete commands and paths
2. **Double Esc for sudo** - Press Esc twice to add sudo to current command
3. **History search** - Type partial command, then press Up/Down arrow
4. **Quick directory jump** - Use `z` after visiting directories a few times
5. **Syntax check before commit** - Run `zsh -n file.zsh` to check for errors
6. **View aliases** - Type `alias` to see all defined aliases
7. **Find commands** - Use `which command` to see what a command actually runs
8. **Copy command output** - Pipe to clipboard: `command | pbcopy` (macOS) or `| xclip` (Linux)

## 🆘 Help Commands

```bash
man command       # Manual page for command
command --help    # Help for most commands
alias             # List all aliases
alias ls          # Show what 'ls' is aliased to
which command     # Show command location
type command      # Show command type (alias, function, binary)
```

## 📊 Quick Diagnosis

### If icons don't show:
1. Install Nerd Font (MesloLGS NF recommended)
2. Configure terminal to use the font
3. Restart terminal

### If commands not found:
1. Check installation: `which eza fzf bat zoxide`
2. Reinstall if missing
3. Reload shell: `source ~/.zshrc`

### If prompt looks broken:
1. Run: `p10k configure`
2. Ensure Nerd Font is installed
3. Check terminal font settings

### If colors look wrong:
1. Check Kitty is using Blazer theme
2. Verify in `~/dotfiles/kitty/kitty.conf`
3. Reload Kitty: Ctrl+Shift+F5

---

**Print this card** for quick reference while learning your new setup!

**Need more help?** Check the full documentation:
- `~/dotfiles/README.md` - Start here
- `~/dotfiles/docs/` - Detailed guides
- [GitHub Issues](https://github.com/Jose05Code/dotfiles/issues) - Ask questions
