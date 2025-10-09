# Screenshot and Visual Guide

This guide explains where and how to add screenshots to enhance the documentation.

## 📸 Screenshot Locations

### Main README.md

The README has dedicated sections for screenshots. Add images to illustrate:

#### 1. Terminal Setup Section
**Location:** Near the top of README.md under "## 📸 Screenshots"

**Screenshots needed:**
- Full terminal window showing Kitty with Blazer theme
- Powerlevel10k prompt in a git repository (showing git status)
- Example of the complete setup in use

**File naming suggestions:**
```
screenshots/terminal-setup-kitty.png
screenshots/powerlevel10k-prompt.png
screenshots/complete-setup.png
```

**Example markdown:**
```markdown
### Terminal Setup with Kitty
![Kitty Terminal with Blazer Theme](screenshots/terminal-setup-kitty.png)
*Kitty terminal with Blazer color scheme and Powerlevel10k prompt*
```

#### 2. File Navigation Examples
**Location:** README.md under "### File Navigation with eza"

**Screenshots needed:**
- Output of `ls` command showing icons and colors
- Output of `ll` command with detailed file information
- Output of `tree` command showing directory structure
- Output of `lg` command showing git status

**File naming suggestions:**
```
screenshots/eza-ls-output.png
screenshots/eza-ll-details.png
screenshots/eza-tree-view.png
screenshots/eza-git-status.png
```

#### 3. Fuzzy Finding Examples
**Location:** README.md under "### Fuzzy Finding with fzf"

**Screenshots needed:**
- Interactive `fzf` file search interface
- Interactive `cdf` directory search
- Interactive `fh` history search
- Interactive `gb` git branch switching

**File naming suggestions:**
```
screenshots/fzf-file-search.png
screenshots/fzf-directory-search.png
screenshots/fzf-history-search.png
screenshots/fzf-git-branch.png
```

**Optional:** Consider creating GIFs for interactive demonstrations using tools like `asciinema` + `agg`.

#### 4. bat Examples
**Location:** README.md under "### Using bat"

**Screenshots needed:**
- bat showing syntax highlighted code (JavaScript, Python, or shell script)
- Comparison with regular cat output

**File naming suggestions:**
```
screenshots/bat-syntax-highlighting.png
screenshots/bat-vs-cat-comparison.png
```

#### 5. Kitty Terminal Features
**Location:** README.md under "## 🖥️ Kitty Terminal Setup"

**Screenshots needed:**
- Kitty with Blazer color scheme (full window)
- Demonstration of multiple clipboard buffers in use
- Split windows/tabs if you use them
- Custom keyboard shortcuts in action

**File naming suggestions:**
```
screenshots/kitty-blazer-theme.png
screenshots/kitty-clipboard-buffers.png
screenshots/kitty-split-windows.png
```

---

### Usage Guide (docs/Usage-Guide.md)

#### 1. Command Examples
Throughout the usage guide, add screenshots next to command examples:

**eza commands:**
```
screenshots/usage/eza-ls.png
screenshots/usage/eza-ll.png
screenshots/usage/eza-la.png
screenshots/usage/eza-tree.png
screenshots/usage/eza-lg-git.png
```

**fzf commands:**
```
screenshots/usage/fzf-vf-demo.png
screenshots/usage/fzf-cdf-demo.png
screenshots/usage/fzf-fh-demo.png
screenshots/usage/fzf-gb-demo.png
```

**zoxide:**
```
screenshots/usage/zoxide-interactive.png
screenshots/usage/zoxide-j-command.png
```

**bat:**
```
screenshots/usage/bat-javascript.png
screenshots/usage/bat-python.png
screenshots/usage/bat-shell.png
screenshots/usage/bat-themes.png
```

#### 2. Oh My Zsh Plugins
**Location:** Usage-Guide.md under "## Oh My Zsh Plugins"

**Screenshots needed:**
- Colored man pages example
- zsh-autosuggestions in action (showing gray suggestion text)
- zsh-syntax-highlighting (showing green for valid, red for invalid commands)
- Git aliases in use

**File naming suggestions:**
```
screenshots/usage/colored-man-page.png
screenshots/usage/zsh-autosuggestions.png
screenshots/usage/zsh-syntax-highlighting.png
screenshots/usage/git-aliases.png
```

---

### Installation Guide (docs/Installation-Guide.md)

While the installation guide focuses on instructions, you could add:

**Platform-specific screenshots:**
```
screenshots/install/arch-installation.png
screenshots/install/ubuntu-installation.png
screenshots/install/macos-installation.png
```

**Post-installation verification:**
```
screenshots/install/first-launch.png
screenshots/install/p10k-configure-wizard.png
screenshots/install/successful-setup.png
```

---

### Customization Guide (docs/Customization.md)

#### Customization Examples

**Screenshots for customization:**
- Different Powerlevel10k configurations (lean, classic, rainbow)
- Different Kitty themes
- Custom aliases in action
- Modified prompts

**File naming suggestions:**
```
screenshots/custom/p10k-lean-style.png
screenshots/custom/p10k-classic-style.png
screenshots/custom/p10k-rainbow-style.png
screenshots/custom/kitty-custom-theme.png
screenshots/custom/custom-aliases.png
```

---

## 📁 Recommended Directory Structure

Create this structure for organizing screenshots:

```
dotfiles/
├── screenshots/
│   ├── README.md                    # This file
│   ├── terminal-setup-kitty.png
│   ├── powerlevel10k-prompt.png
│   ├── complete-setup.png
│   ├── eza-ls-output.png
│   ├── eza-ll-details.png
│   ├── eza-tree-view.png
│   ├── eza-git-status.png
│   ├── fzf-file-search.png
│   ├── fzf-directory-search.png
│   ├── fzf-history-search.png
│   ├── fzf-git-branch.png
│   ├── bat-syntax-highlighting.png
│   ├── kitty-blazer-theme.png
│   ├── kitty-clipboard-buffers.png
│   ├── usage/
│   │   ├── eza-ls.png
│   │   ├── eza-ll.png
│   │   ├── fzf-vf-demo.png
│   │   ├── zsh-autosuggestions.png
│   │   ├── colored-man-page.png
│   │   └── ...
│   ├── install/
│   │   ├── first-launch.png
│   │   ├── p10k-configure-wizard.png
│   │   └── successful-setup.png
│   └── custom/
│       ├── p10k-lean-style.png
│       ├── kitty-custom-theme.png
│       └── ...
```

---

## 🎬 How to Capture Screenshots

### For Static Terminal Output

**macOS:**
```bash
# Full screen
Cmd + Shift + 3

# Selected area
Cmd + Shift + 4
```

**Linux (GNOME):**
```bash
# Screenshot tool
gnome-screenshot -a

# Using scrot
scrot -s screenshot.png
```

**Linux (KDE):**
```bash
# Spectacle
spectacle
```

### For Terminal Recordings (Animated)

**Using asciinema:**
```bash
# Install
# Arch: sudo pacman -S asciinema
# Ubuntu: sudo apt install asciinema
# macOS: brew install asciinema

# Record
asciinema rec demo.cast

# Stop with Ctrl+D

# Convert to GIF using agg
cargo install agg
agg demo.cast demo.gif
```

**Using terminalizer:**
```bash
# Install
npm install -g terminalizer

# Record
terminalizer record demo

# Render to GIF
terminalizer render demo
```

---

## 🎨 Screenshot Best Practices

### 1. Terminal Preparation

Before taking screenshots:

```bash
# Clear the terminal
clear

# Set a reasonable size
# In Kitty: Ctrl+Shift+= to increase font size if needed

# Navigate to a good example directory
cd ~/Projects/example-project

# Run the command you want to capture
ls
```

### 2. Content Guidelines

**Do:**
- Use a clean, organized directory for examples
- Show realistic but not sensitive data
- Include the prompt to show context
- Use consistent terminal size
- Ensure text is readable

**Don't:**
- Include personal/sensitive information
- Use messy directories with too many files
- Crop too tightly - show context
- Use tiny fonts that are hard to read

### 3. Image Optimization

After capturing screenshots:

```bash
# Optimize PNG files
# Install optipng: sudo pacman -S optipng
optipng -o7 screenshot.png

# Or use pngquant for better compression
pngquant --quality=85-95 screenshot.png
```

### 4. Consistent Styling

**Recommended Kitty settings for screenshots:**
```
font_size 12.0
window_padding_width 4
background_opacity 1.0    # Full opacity for screenshots
```

---

## 📝 Example Screenshot Workflow

### Example: Capturing eza output

1. **Prepare the environment:**
```bash
cd ~/Projects
mkdir -p demo-project/{src,tests,docs}
touch demo-project/README.md
touch demo-project/package.json
touch demo-project/src/{main.js,utils.js}
```

2. **Navigate and clear:**
```bash
cd demo-project
clear
```

3. **Run the command:**
```bash
ls
```

4. **Take screenshot** (Cmd+Shift+4 on macOS)

5. **Save with descriptive name:**
```
screenshots/eza-ls-output.png
```

6. **Clean up demo files** (if temporary)

7. **Add to documentation:**
```markdown
![eza ls output](screenshots/eza-ls-output.png)
*Colorful file listing with icons using eza*
```

---

## 🖼️ Image Format Guidelines

### File Formats

**PNG** (Preferred for screenshots)
- Lossless compression
- Best for text and terminal output
- Larger file size

**JPEG** (Not recommended for terminal)
- Lossy compression
- Blurry text
- Smaller file size

**GIF** (For animations only)
- Animation support
- Limited colors
- Good for short demos

**WebP** (Modern alternative)
- Better compression
- Good quality
- Not universally supported yet

### Image Dimensions

**Recommended dimensions:**
- **Full terminal:** 1200x800 or larger
- **Command output:** Crop to relevant area but keep context
- **Side-by-side comparisons:** Ensure both are same height

### File Sizes

**Target sizes:**
- Single screenshots: < 500 KB (optimize with tools)
- GIF animations: < 5 MB (keep short and focused)
- Use compression tools to reduce size

---

## ✅ Screenshot Checklist

Before committing screenshots:

- [ ] Image is clear and readable
- [ ] No personal/sensitive information visible
- [ ] File is appropriately sized and optimized
- [ ] Filename is descriptive and follows convention
- [ ] Screenshot shows relevant context
- [ ] Terminal font size is readable
- [ ] Colors are representative of actual usage
- [ ] Image is added to documentation with proper markdown
- [ ] Alt text is descriptive for accessibility

---

## 🎯 Priority Screenshots

If time is limited, prioritize these screenshots:

### High Priority
1. ✅ Terminal with Kitty and Powerlevel10k prompt
2. ✅ eza ls output with icons
3. ✅ fzf interactive search in action
4. ✅ bat syntax highlighting example
5. ✅ Kitty with Blazer theme

### Medium Priority
6. eza detailed listing (ll)
7. tree command output
8. zsh-autosuggestions in action
9. git branch fuzzy switching
10. Colored man pages

### Nice to Have
11. Various Powerlevel10k styles
12. Different Kitty themes
13. Custom aliases in use
14. Advanced workflows
15. Split windows/tabs

---

## 🤝 Contributing Screenshots

When contributing screenshots:

1. Follow the naming conventions above
2. Optimize file sizes
3. Include alt text in markdown
4. Test that images display correctly
5. Submit via pull request with clear description

---

## 📱 Mobile-Friendly Considerations

While terminal usage is primarily desktop/laptop:

- Keep images reasonably sized
- Use descriptive alt text
- Consider that some users may view docs on mobile
- Text in screenshots should be readable when scaled down

---

## 🔗 Using Screenshots in Markdown

### Basic Image

```markdown
![Alt text](path/to/image.png)
```

### Image with Caption

```markdown
![Alt text](path/to/image.png)
*Caption text explaining the image*
```

### Image with Link

```markdown
[![Alt text](path/to/image.png)](link-url)
```

### Relative vs Absolute Paths

**Relative path** (recommended):
```markdown
![Screenshot](../screenshots/example.png)
```

**From repository root:**
```markdown
![Screenshot](screenshots/example.png)
```

---

## 🎥 Video Alternatives

For complex workflows, consider video tutorials:

**Platforms:**
- YouTube (embed in wiki)
- Asciinema (terminal recordings)
- Vimeo

**Example embed:**
```markdown
[![Video Title](video-thumbnail.png)](https://www.youtube.com/watch?v=VIDEO_ID)
```

---

**Ready to add screenshots?** Start with the high-priority list and gradually add more visual examples to make the documentation more engaging and easier to follow!
