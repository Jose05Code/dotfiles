# Installation Guide

Complete installation instructions for all supported platforms.

## Quick Start

1. Choose your platform below
2. Follow the installation steps
3. Configure your terminal
4. Start using your new setup!

## Platform-Specific Guides

- [Arch Linux Installation](#arch-linux)
- [macOS Installation](#macos)
- [Post-Installation Setup](#post-installation-setup)

---

## Arch Linux

Arch Linux is the primary development platform for this configuration and has the smoothest installation process.

### Step 1: Install Base Dependencies

```bash
sudo pacman -S git zsh
```

### Step 2: Clone the Repository

```bash
cd ~
git clone --recurse-submodules https://github.com/Jose05Code/dotfiles.git
```

**Note:** The `--recurse-submodules` flag is important as it downloads all the required plugin submodules.

### Step 3: Install Required CLI Tools

The repository includes an automated script for Arch Linux:

```bash
cd ~/dotfiles/zsh
bash zsh.bash
```

This script installs:
- **eza** - Modern ls replacement
- **fzf** - Fuzzy finder
- **bat** - Enhanced cat with syntax highlighting
- **zoxide** - Smart directory navigation

### Step 4: Install Kitty Terminal (Recommended)

```bash
sudo pacman -S kitty
```

### Step 5: Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

When prompted, allow Oh My Zsh to set Zsh as your default shell.

### Step 6: Set Up Configuration Files

```bash
# Backup existing configurations
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup
[ -d ~/.config/kitty ] && mv ~/.config/kitty ~/.config/kitty.backup

# Create symlinks
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
mkdir -p ~/.config/kitty
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/zsh/.oh-my-zsh ~/.config/.oh-my-zsh
```

### Step 7: Install Nerd Fonts

For proper icon display:

```bash
sudo pacman -S ttf-meslo-nerd
```

Or manually download from: https://github.com/romkatv/powerlevel10k#fonts

### Step 8: Restart Your Terminal

Close and reopen your terminal or run:
```bash
exec zsh
```

### Step 9: Configure Powerlevel10k

On first launch, the Powerlevel10k configuration wizard will appear. If it doesn't, run:

```bash
p10k configure
```

Follow the prompts to customize your prompt appearance.

---

## macOS

macOS installation uses Homebrew for package management.

### Step 1: Install Homebrew

If Homebrew isn't already installed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the prompts and add Homebrew to your PATH as instructed.

### Step 2: Install Base Dependencies

```bash
brew install git zsh
```

### Step 3: Clone the Repository

```bash
cd ~
git clone --recurse-submodules https://github.com/Jose05Code/dotfiles.git
```

### Step 4: Install Modern CLI Tools

```bash
brew install eza fzf bat zoxide
```

All tools will be available in your PATH automatically.

### Step 5: Install Kitty Terminal

```bash
brew install --cask kitty
```

### Step 6: Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 7: Set Up Configuration Files

```bash
# Backup existing configurations
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup

# Create symlinks
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
mkdir -p ~/.config/kitty
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

### Step 8: Install Nerd Fonts

```bash
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
```

### Step 9: Set Zsh as Default Shell

Zsh is usually the default shell on modern macOS. Verify:

```bash
echo $SHELL
```

If it's not `/bin/zsh`, change it:
```bash
chsh -s /bin/zsh
```

### Step 10: Restart Terminal and Configure

Quit and reopen Terminal (or Kitty), then run:

```bash
p10k configure
```

---

## Post-Installation Setup

### Configure Kitty Font

Edit `~/.config/kitty/kitty.conf` to add (if not already present):

```
font_family      MesloLGS NF
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size        11.0
```

### Initialize zoxide

The first time you use zoxide, it needs to learn your directories. Just navigate around normally:

```bash
cd ~/Documents
cd ~/Projects
cd ~/Downloads
```

After a few directory changes, you can use:
```bash
z doc    # jumps to ~/Documents
z proj   # jumps to ~/Projects
```

### Test Your Installation

Verify everything works:

```bash
# Test eza
ls
ll
tree

# Test fzf
fh      # search command history
vf      # find and edit a file

# Test bat
bat ~/.zshrc

# Test zoxide
z ~
j ~
```

### Customize Your Prompt

Run the Powerlevel10k configuration wizard anytime:

```bash
p10k configure
```

You can change:
- Prompt style (lean, classic, rainbow, etc.)
- Icons and separators
- Colors
- Git integration
- And much more!

### Optional: Install Neovim

Many aliases (like `vf`) use Neovim. Install it:

**Arch Linux:**
```bash
sudo pacman -S neovim
```

**Ubuntu/Debian:**
```bash
sudo apt install neovim
```

**macOS:**
```bash
brew install neovim
```

---

## Troubleshooting Common Issues

### Submodules Not Loaded

If plugins are missing:
```bash
cd ~/dotfiles
git submodule update --init --recursive
```

### Permission Issues

If you get permission errors:
```bash
chmod +x ~/dotfiles/zsh/zsh.bash
```

### Oh My Zsh Already Installed

If Oh My Zsh is already installed, skip that step and just ensure your `~/.zshrc` points to the dotfiles version.

### Icons Not Displaying

Install a Nerd Font and configure your terminal to use it.

### bat Command Not Found (Ubuntu/Debian)

Remember to create the symlink:
```bash
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

---

## Next Steps

After installation:
1. Read the [Usage Guide](Usage-Guide.md) for tips and tricks
2. Check out [Customization](Customization.md) to make it your own
3. Explore [Advanced Features](Advanced-Features.md) for power user tips

---

**Need help?** [Open an issue](https://github.com/Jose05Code/dotfiles/issues) on GitHub!
