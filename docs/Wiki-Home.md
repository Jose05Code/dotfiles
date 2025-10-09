# Wiki Home

Welcome to the comprehensive documentation for this dotfiles repository! This documentation will help you install, configure, and master your terminal environment.

## 📚 Documentation Overview

This wiki contains everything you need to know about using and customizing your dotfiles configuration.

### Quick Links

- **[Installation Guide](Installation-Guide.md)** - Complete installation instructions for all platforms
- **[Usage Guide](Usage-Guide.md)** - Learn how to use all the features and tools
- **[Customization](Customization.md)** - Make the configuration your own
- **[Advanced Features](Advanced-Features.md)** - Power user tips and workflows
- **[Contributing](../CONTRIBUTING.md)** - How to contribute to the project

---

## 🚀 Quick Start

New to dotfiles? Start here:

1. **[Prerequisites](#prerequisites)** - What you need before starting
2. **[Choose Your Platform](#installation-by-platform)** - Installation instructions for your OS
3. **[First Steps](#first-steps-after-installation)** - What to do after installation
4. **[Learn the Basics](#learning-the-basics)** - Essential commands and features

---

## Prerequisites

Before you begin, ensure you have:

- **Git** - Version control system
- **Zsh** - The Z shell (we'll help you install this)
- **Terminal access** - Command line interface
- **Internet connection** - For downloading dependencies

### Supported Platforms

✅ **Arch Linux** (Primary development platform)  
✅ **Ubuntu/Debian** (Fully supported)  
✅ **macOS** (Fully supported)

---

## Installation by Platform

Choose your operating system and follow the detailed installation guide:

### Arch Linux
The simplest installation path with automated dependency management.

**Quick Install:**
```bash
git clone --recurse-submodules https://github.com/Jose05Code/dotfiles.git ~/dotfiles
cd ~/dotfiles/zsh && bash zsh.bash
```

👉 **[Full Arch Linux Guide](Installation-Guide.md#arch-linux)**

### Ubuntu/Debian
Requires manual installation of some modern CLI tools.

**Quick Install:**
```bash
git clone --recurse-submodules https://github.com/Jose05Code/dotfiles.git ~/dotfiles
# Then follow the detailed guide
```

👉 **[Full Ubuntu/Debian Guide](Installation-Guide.md#ubuntudebian)**

### macOS
Uses Homebrew for easy package management.

**Quick Install:**
```bash
git clone --recurse-submodules https://github.com/Jose05Code/dotfiles.git ~/dotfiles
brew install eza fzf bat zoxide
```

👉 **[Full macOS Guide](Installation-Guide.md#macos)**

---

## First Steps After Installation

After installation, try these commands to verify everything works:

### 1. Check Your Prompt
Your terminal should now show a beautiful Powerlevel10k prompt. If not, run:
```bash
p10k configure
```

### 2. Test File Navigation
```bash
ls      # Should show colorful output with icons
ll      # Detailed file listing
tree    # Tree view of directories
```

### 3. Try Fuzzy Finding
```bash
fh      # Search command history
vf      # Find and edit a file
cdf     # Navigate to a directory
```

### 4. Test Smart Navigation
```bash
# Navigate to a few directories first
cd ~/Documents
cd ~/Downloads
cd ~/Projects

# Then use zoxide
z doc   # Jump to Documents
j down  # Jump to Downloads and list contents
```

**All working?** You're ready to explore! 🎉

---

## Learning the Basics

### Essential Commands

| Command | Description | Example |
|---------|-------------|---------|
| `ls` | List files with icons | `ls` |
| `ll` | Detailed file listing | `ll` |
| `tree` | Tree view | `tree` |
| `vf` | Fuzzy find and edit file | `vf` |
| `cdf` | Fuzzy find directory | `cdf` |
| `fh` | Search command history | `fh` |
| `z` | Jump to directory | `z proj` |
| `bat` | View file with highlighting | `bat file.js` |
| `gb` | Fuzzy git branch switch | `gb` |

### Where to Learn More

- **New users** → Start with the [Usage Guide](Usage-Guide.md)
- **Want to customize** → Check [Customization](Customization.md)
- **Advanced users** → Explore [Advanced Features](Advanced-Features.md)

---

## 🎨 What's Included

### Modern CLI Tools

- **[eza](https://github.com/eza-community/eza)** - Modern `ls` replacement with icons
- **[fzf](https://github.com/junegunn/fzf)** - Fuzzy finder for files and history
- **[bat](https://github.com/sharkdp/bat)** - `cat` with syntax highlighting
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** - Smarter `cd` command

### Shell Configuration

- **[Zsh](https://www.zsh.org/)** - Powerful shell with advanced features
- **[Oh My Zsh](https://ohmyz.sh/)** - Framework for managing Zsh configuration
- **[Powerlevel10k](https://github.com/romkatv/powerlevel10k)** - Fast and beautiful prompt

### Terminal Emulator

- **[Kitty](https://sw.kovidgoyal.net/kitty/)** - GPU-accelerated terminal with:
  - Custom Blazer color scheme
  - Multiple clipboard buffers
  - Advanced keyboard shortcuts

### Plugins Included

**Built-in Oh My Zsh plugins:**
- git, sudo, history-substring-search, web-search, pip, colored-man-pages

**External plugins:**
- zsh-autosuggestions - Command suggestions
- zsh-syntax-highlighting - Syntax coloring
- autoenv - Directory-based environments

---

## 📖 Documentation Structure

### Core Documentation

1. **[Installation Guide](Installation-Guide.md)**
   - Platform-specific installation steps
   - Dependency installation
   - Post-installation setup
   - Troubleshooting

2. **[Usage Guide](Usage-Guide.md)**
   - File navigation with eza
   - Fuzzy finding with fzf
   - Smart navigation with zoxide
   - Enhanced viewing with bat
   - Git workflow enhancements
   - Kitty terminal features
   - Tips and tricks

3. **[Customization](Customization.md)**
   - Understanding the structure
   - Adding custom aliases
   - Modifying the prompt
   - Changing terminal themes
   - Adding new plugins
   - Creating custom functions

4. **[Advanced Features](Advanced-Features.md)**
   - Advanced Zsh features
   - Shell scripting techniques
   - Workflow automation
   - Performance optimization
   - Integration with other tools
   - Git workflows

5. **[Contributing Guide](../CONTRIBUTING.md)**
   - How to report bugs
   - Suggesting enhancements
   - Submitting changes
   - Development guidelines

---

## 📸 Visual Examples

### Where to Add Screenshots

Throughout the documentation, you'll see placeholders for screenshots like:
```markdown
<!-- Screenshot placeholder: Description of what to show -->
```

**Recommended screenshots to add:**

1. **Terminal Setup**
   - Full terminal with Powerlevel10k prompt
   - Showing git integration in a repository
   - Displaying the Blazer color scheme

2. **File Navigation (eza)**
   - Output of `ls` command with icons
   - Output of `ll` detailed listing
   - Output of `tree` command
   - Git-aware listing with `lg`

3. **Fuzzy Finding (fzf)**
   - Interactive fuzzy file search (`vf`)
   - Directory search (`cdf`)
   - History search (`fh`)
   - Git branch switching (`gb`)

4. **Kitty Terminal**
   - Multiple clipboard buffers in action
   - Split windows/tabs
   - Blazer color scheme showcase

5. **Advanced Features**
   - Colored man pages
   - zsh-autosuggestions in action
   - Syntax highlighting examples
   - Custom aliases/functions in use

### How to Take Screenshots

1. **For terminal output:**
   - Use `Shift+Cmd+4` (macOS) or screenshot tool
   - Ensure your terminal shows the relevant output
   - Include the prompt for context

2. **For interactive tools:**
   - Consider using `asciinema` for recordings
   - Convert to GIF for embedding in docs

3. **For comparisons:**
   - Show before/after scenarios
   - Side-by-side comparisons

---

## 🎯 Example Workflows

### Example 1: Starting a New Project

```bash
# Navigate to projects directory
cd ~/Projects

# Create and enter new project
mkcd my-new-project

# Initialize git
git init

# Open in editor
code .

# Start development
npm init -y
npm install
```

### Example 2: Daily Development Workflow

```bash
# Jump to project
z myproj

# Check status
lg

# Switch branch
gb

# Make changes and commit
# ... edit files ...
ga .
gc "Add new feature"
gp
```

### Example 3: Finding and Editing Files

```bash
# Search for file
vf
# Type: "config"
# Select: app.config.js
# Opens in Neovim
```

---

## 🛠️ Troubleshooting

### Common Issues

**Icons not displaying?**
- Install a Nerd Font (recommended: MesloLGS NF)
- Configure your terminal to use it

**Commands not found?**
- Ensure all dependencies are installed
- Check that PATH is correctly set
- Reload shell: `source ~/.zshrc`

**Prompt looks broken?**
- Run `p10k configure`
- Check font installation

**Plugins not loading?**
- Initialize submodules: `git submodule update --init --recursive`
- Check plugin list in `~/.zshrc`

👉 **[Full Troubleshooting Guide](Installation-Guide.md#troubleshooting-common-issues)**

---

## 🤝 Getting Help

### Need Assistance?

1. **Check the documentation** - Most questions are answered here
2. **Search existing issues** - Someone may have had the same problem
3. **Open a new issue** - Describe your problem clearly
4. **Join discussions** - Share tips and learn from others

### Contributing

We welcome contributions! See the **[Contributing Guide](../CONTRIBUTING.md)** for:
- How to report bugs
- How to suggest features
- How to submit changes
- Code style guidelines

---

## 📝 Additional Resources

### External Documentation

- [Zsh Documentation](http://zsh.sourceforge.net/Doc/)
- [Oh My Zsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Powerlevel10k Documentation](https://github.com/romkatv/powerlevel10k#configuration)
- [Kitty Documentation](https://sw.kovidgoyal.net/kitty/)
- [fzf Wiki](https://github.com/junegunn/fzf/wiki)

### Useful Links

- **GitHub Repository**: [Jose05Code/dotfiles](https://github.com/Jose05Code/dotfiles)
- **Issues**: [Report bugs or request features](https://github.com/Jose05Code/dotfiles/issues)
- **Discussions**: [Ask questions and share tips](https://github.com/Jose05Code/dotfiles/discussions)

---

## 🎓 Learning Path

### For Beginners

1. ✅ Install the configuration
2. ✅ Complete the [Usage Guide](Usage-Guide.md)
3. ✅ Practice basic commands daily
4. ✅ Explore one new feature per week

### For Intermediate Users

1. ✅ Read the [Customization Guide](Customization.md)
2. ✅ Add your own aliases
3. ✅ Customize your prompt
4. ✅ Explore Oh My Zsh plugins

### For Advanced Users

1. ✅ Study [Advanced Features](Advanced-Features.md)
2. ✅ Write custom functions
3. ✅ Automate workflows
4. ✅ Contribute improvements

---

## 📊 Feature Comparison

### Before vs After

| Task | Before | After (With Dotfiles) |
|------|--------|----------------------|
| List files | `ls` (basic) | `ls` (colorful, icons) |
| Find files | `find . -name "*.js"` | `vf` (interactive) |
| Navigate | `cd ../../..` | `z proj` (smart jump) |
| View code | `cat file.js` | `bat file.js` (highlighted) |
| Git branches | `git branch` | `gb` (fuzzy search) |
| Command history | `history \| grep` | `fh` (interactive) |

---

## 🎉 Next Steps

Ready to dive deeper? Choose your path:

- 🔰 **Just installed?** → [Usage Guide](Usage-Guide.md)
- 🎨 **Want to customize?** → [Customization](Customization.md)  
- 🚀 **Power user?** → [Advanced Features](Advanced-Features.md)
- 🐛 **Found a bug?** → [Contributing](../CONTRIBUTING.md)

---

**Happy coding!** 🚀 If you find this configuration helpful, consider ⭐ starring the repository!
