# Dotfiles Configuration

A comprehensive dotfiles repository for customizing your Unix-like development environment with a beautiful, feature-rich terminal experience. This configuration includes optimized settings for Zsh, Kitty terminal, and a collection of modern command-line tools.

## 📸 Screenshots

### Terminal Setup with Kitty
<!-- Add your Kitty terminal screenshot here -->
*Screenshot showing the Kitty terminal with Blazer color scheme and Powerlevel10k prompt*

### File Navigation with eza
<!-- Add screenshot showing eza output with icons -->
*Example of enhanced file listing with eza, showing icons and colors*

### Fuzzy Finding with fzf
<!-- Add screenshot of fzf in action -->
*Interactive fuzzy search through files and command history*

## ✨ Features

- **Modern Shell Experience**: Zsh with Oh My Zsh and Powerlevel10k theme
- **Enhanced Command-Line Tools**: 
  - `eza` - Modern replacement for `ls` with icons and git integration
  - `fzf` - Fuzzy finder for files, directories, and command history
  - `bat` - Enhanced `cat` with syntax highlighting
  - `zoxide` - Smart directory jumper
- **Beautiful Terminal**: Kitty terminal with custom Blazer color scheme
- **Useful Aliases**: Pre-configured aliases for improved productivity
- **Git Integration**: Enhanced git workflow with fuzzy branch switching
- **Cross-Platform Support**: Works on Linux and macOS

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Dependencies](#dependencies)
- [Installation](#installation)
  - [Arch Linux](#arch-linux)
  - [Ubuntu/Debian](#ubuntudebian)
  - [macOS](#macos)
- [Configuration](#configuration)
- [Usage Examples](#usage-examples)
- [Kitty Terminal Setup](#kitty-terminal-setup)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before installing this dotfiles configuration, ensure you have:

- Git
- A Unix-like operating system (Linux or macOS)
- Terminal access with sudo privileges (for Linux)
- Internet connection for downloading dependencies

## 🔧 Dependencies

This configuration requires the following packages:

### Core Dependencies
- **Zsh** - The Z shell (must be installed and set as default shell)
- **Oh My Zsh** - Framework for managing Zsh configuration
- **Git** - Version control system (for cloning submodules)

### Modern CLI Tools
- **eza** - Modern replacement for `ls` with icons and colors
- **fzf** - Command-line fuzzy finder
- **bat** - Cat clone with syntax highlighting and git integration
- **zoxide** - Smarter cd command that learns your habits

### Optional but Recommended
- **Kitty** - GPU-accelerated terminal emulator
- **Neovim** or **Vim** - For the `vf` alias (fuzzy find and edit)
- **Nerd Fonts** - For proper icon display (recommended: MesloLGS NF for Powerlevel10k)

### Zsh Plugins (included as submodules)
- **Powerlevel10k** - Beautiful and fast Zsh theme
- **zsh-autosuggestions** - Fish-like autosuggestions
- **zsh-syntax-highlighting** - Syntax highlighting in the command line
- **zsh-autoenv** - Directory-based environments

## 🚀 Installation

### Arch Linux

1. **Install base dependencies:**
```bash
sudo pacman -S git zsh
```

2. **Clone the repository:**
```bash
cd ~
git clone --recurse-submodules https://github.com/Jose05Code/dotfiles.git
```

3. **Install required packages:**
```bash
cd ~/dotfiles/zsh
bash zsh.bash
```

4. **Install Kitty (optional but recommended):**
```bash
sudo pacman -S kitty
```

5. **Set up Zsh configuration:**
```bash
# Backup existing config if any
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup

# Create symlinks
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/zsh/.oh-my-zsh ~/.config/.oh-my-zsh
```

7. **Set Zsh as default shell:**
```bash
chsh -s $(which zsh)
```

8. **Configure Powerlevel10k:**
```bash
# Restart your terminal, then run:
p10k configure
```

### macOS

1. **Install Homebrew** (if not already installed):
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. **Install dependencies:**
```bash
brew install git zsh
```

3. **Clone the repository:**
```bash
cd ~
git clone --recurse-submodules https://github.com/Jose05Code/dotfiles.git
```

4. **Install modern CLI tools:**
```bash
brew install eza fzf bat zoxide
```

5. **Install Kitty:**
```bash
brew install --cask kitty
```

6. **Set up configuration:**
```bash
# Backup existing config
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup

# Create symlinks
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
mkdir -p ~/.config/kitty
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

8. **Set Zsh as default shell** (usually already default on modern macOS):
```bash
chsh -s $(which zsh)
```

9. **Restart your terminal** and configure Powerlevel10k:
```bash
p10k configure
```

## ⚙️ Configuration

After installation, the following configurations are active:

### Zsh Configuration
- **Theme**: Powerlevel10k with instant prompt
- **Plugins**: git, z, sudo, history-substring-search, web-search, pip, colored-man-pages, zsh-autosuggestions, zsh-syntax-highlighting, autoenv
- **Custom aliases**: Defined in `~/dotfiles/zsh/aliases.zsh`

### Kitty Configuration
- **Theme**: Blazer (custom dark theme)
- **Editor**: Visual Studio Code (configurable)
- **Multiple clipboard buffers**: F1-F4 for copy, Alt+F1-F4 for paste

## 💡 Usage Examples

### File Navigation with eza

The configuration includes many useful aliases for enhanced file listing:

```bash
# Basic listing with icons
ls

# Detailed view
ll

# Show all files including hidden
la

# Detailed view of all files
lla

# Sort by size
lS

# Sort by modification time
lt

# Show git status for each file
lg

# Tree view (2 levels deep)
tree

# Tree view of directories only
treed
```

**Example Output:**
<!-- Add screenshot of eza ls output here -->
*Screenshot showing colorful file listing with icons*

### Fuzzy Finding with fzf

Navigate your filesystem and history with ease:

```bash
# Fuzzy find and open a file in Neovim
vf

# Fuzzy find and cd into a directory
cdf

# Fuzzy search through command history
fh

# Fuzzy switch git branch
gb
```

**Interactive Example:**
<!-- Add animated GIF or screenshot of fzf in action -->
*Screenshot showing fzf fuzzy search interface*

### Smart Navigation with zoxide

```bash
# Interactive jump to a directory
z

# Jump and list contents
j
```

**Example:**
After visiting directories a few times, zoxide learns your patterns:
```bash
z doc    # jumps to ~/Documents or most frequently visited directory matching 'doc'
j proj   # jumps to ~/Projects and lists contents with eza
```

### Using bat (enhanced cat)

```bash
# View a file with syntax highlighting
bat filename.js

# Use plain bat for piping (no styling)
bats filename.txt
```

**Example:**
<!-- Add screenshot of bat showing syntax highlighted code -->
*Screenshot showing bat displaying a file with syntax highlighting*

## 🖥️ Kitty Terminal Setup

### Blazer Color Scheme

The Blazer color scheme provides a comfortable dark theme optimized for extended coding sessions:

- **Background**: Deep blue-black (#0d1925)
- **Foreground**: Light blue-white (#d9e5f1)
- **16-color palette**: Muted tones for reduced eye strain

<!-- Add screenshot of Kitty with Blazer theme here -->
*Screenshot of Kitty terminal with Blazer color scheme*

### Multiple Clipboard Buffers

Kitty is configured with multiple clipboard buffers for power users:

- **F1** / **Alt+F1**: Copy/Paste buffer A
- **F2** / **Alt+F2**: Copy/Paste buffer B
- **F3** / **Alt+F3**: Copy/Paste buffer C
- **F4** / **Alt+F4**: Copy/Paste buffer D

**Usage Example:**
1. Select text and press F1 to copy to buffer A
2. Select different text and press F2 to copy to buffer B
3. Press Alt+F1 to paste from buffer A
4. Press Alt+F2 to paste from buffer B

### Recommended Kitty Settings

For the best experience with Powerlevel10k, install a Nerd Font:

```bash
# On macOS
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# On Linux, download and install manually from:
# https://github.com/romkatv/powerlevel10k#fonts
```

Then configure Kitty to use the font by adding to `kitty.conf`:
```
font_family      MesloLGS NF
bold_font        auto
italic_font      auto
bold_italic_font auto
```

## 🎨 Customization

### Modifying Aliases

Edit `~/dotfiles/zsh/aliases.zsh` to add or modify aliases:

```bash
# Add your custom aliases
alias myalias='your command here'
```

After editing, reload your shell:
```bash
source ~/.zshrc
```

### Changing the Theme

To use a different Zsh theme, edit `~/dotfiles/zsh/zshrc`:

```bash
ZSH_THEME="your-theme-name"
```

### Customizing Powerlevel10k

Re-run the configuration wizard anytime:
```bash
p10k configure
```

Or manually edit `~/.p10k.zsh` for fine-grained control.

### Modifying Kitty Theme

You can create your own color scheme:

1. Copy `~/dotfiles/kitty/Blazer.conf` to a new file
2. Modify the colors
3. Update `~/dotfiles/kitty/kitty.conf` to include your new theme:
```
include ~/dotfiles/kitty/YourTheme.conf
```

Browse more themes at: https://github.com/dexpota/kitty-themes

## 🐛 Troubleshooting

### Icons not displaying correctly

**Problem**: Icons appear as question marks or boxes.

**Solution**: Install a Nerd Font:
- Download from: https://www.nerdfonts.com/
- Recommended: MesloLGS NF (for Powerlevel10k)
- Configure your terminal to use the font

### zoxide not working

**Problem**: `z` command not found or not working.

**Solution**: 
1. Ensure zoxide is installed: `which zoxide`
2. Initialize zoxide in your shell:
```bash
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
source ~/.zshrc
```

### bat command not found (Ubuntu/Debian)

**Problem**: `bat` shows "command not found".

**Solution**: On Ubuntu/Debian, bat is installed as `batcat`:
```bash
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

### Submodules not initialized

**Problem**: Plugins or themes missing after cloning.

**Solution**: Initialize and update submodules:
```bash
cd ~/dotfiles
git submodule update --init --recursive
```

### Permission denied when running zsh.bash

**Problem**: Cannot execute the installation script.

**Solution**: Make it executable:
```bash
chmod +x ~/dotfiles/zsh/zsh.bash
```

### Powerlevel10k not loading

**Problem**: Prompt looks plain or doesn't show Powerlevel10k features.

**Solution**:
1. Verify the theme is installed:
```bash
ls ~/dotfiles/zsh/ohmyzsh-custom/themes/powerlevel10k
```
2. Check that ZSH_CUSTOM is set correctly in `~/.zshrc`
3. Run: `p10k configure`

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

### Reporting Issues

If you encounter a bug or have a suggestion:

1. Check if the issue already exists in the [Issues](https://github.com/Jose05Code/dotfiles/issues) section
2. If not, create a new issue with:
   - A clear, descriptive title
   - Detailed description of the problem or suggestion
   - Steps to reproduce (for bugs)
   - Your environment details (OS, shell version, etc.)
   - Screenshots if applicable

### Submitting Changes

1. Fork the repository
2. Create a new branch for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Make your changes
4. Test your changes thoroughly
5. Commit with a clear message:
   ```bash
   git commit -m "Add: description of your changes"
   ```
6. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
7. Open a Pull Request with:
   - Clear description of changes
   - Why the change is needed
   - Any related issue numbers

### Contribution Guidelines

- Follow the existing code style and structure
- Test your changes on at least one platform
- Update documentation if you change functionality
- Keep commits focused and atomic
- Write clear commit messages

See [CONTRIBUTING.md](CONTRIBUTING.md) for more detailed guidelines.

## 📝 License

This project is open source and available under the MIT License. Feel free to use, modify, and distribute as needed.

## 🙏 Acknowledgments

- [Oh My Zsh](https://ohmyz.sh/) - Framework for managing Zsh configuration
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Beautiful and fast Zsh theme
- [Kitty](https://sw.kovidgoyal.net/kitty/) - The fast, feature-rich, GPU-based terminal emulator
- [eza](https://github.com/eza-community/eza) - Modern replacement for ls
- [fzf](https://github.com/junegunn/fzf) - Command-line fuzzy finder
- [bat](https://github.com/sharkdp/bat) - Cat clone with syntax highlighting
- [zoxide](https://github.com/ajeetdsouza/zoxide) - Smarter cd command

## 📧 Contact

For questions or suggestions, please open an issue on GitHub or contact the repository owner.

---

**Happy coding!** 🚀
