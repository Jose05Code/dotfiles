# Usage Guide

A comprehensive guide to using your new dotfiles configuration effectively.

## Table of Contents

- [Getting Started](#getting-started)
- [File Navigation with eza](#file-navigation-with-eza)
- [Fuzzy Finding with fzf](#fuzzy-finding-with-fzf)
- [Smart Navigation with zoxide](#smart-navigation-with-zoxide)
- [Enhanced File Viewing with bat](#enhanced-file-viewing-with-bat)
- [Git Workflow Enhancements](#git-workflow-enhancements)
- [Kitty Terminal Features](#kitty-terminal-features)
- [Oh My Zsh Plugins](#oh-my-zsh-plugins)
- [Tips and Tricks](#tips-and-tricks)

---

## Getting Started

After installation, open a new terminal session. You should see your new Powerlevel10k prompt with:
- Current directory
- Git status (if in a git repository)
- Previous command status
- And more, depending on your configuration

### Basic Navigation

All the standard commands work, but now with enhanced features!

```bash
# Navigate to a directory
cd ~/Documents

# Go back to previous directory
cd -

# Go up one directory
cd ..
```

---

## File Navigation with eza

The `eza` tool is a modern replacement for `ls` with beautiful output and additional features.

### Basic Listing Commands

#### `ls` - Standard Directory Listing
```bash
ls
```
**What it shows:**
- Files and directories with color coding
- Icons for file types
- Directories listed first
- Clean, organized output

<!-- Screenshot placeholder: ls command output with icons and colors -->

#### `ll` - Detailed Listing
```bash
ll
```
**Shows:**
- File permissions
- Owner and group
- File size (human-readable)
- Last modified date
- Icons

**Example output:**
```
drwxr-xr-x user user 4.0 KB Oct 10 14:30  Documents
drwxr-xr-x user user 4.0 KB Oct 10 12:15  Pictures
.rw-r--r-- user user 1.2 KB Oct 10 09:00  README.md
```

<!-- Screenshot placeholder: ll command detailed output -->

#### `la` - Show All Files
```bash
la
```
Shows all files including hidden files (those starting with `.`)

#### `lla` - Detailed View of All Files
```bash
lla
```
Combines `ll` and `la` - detailed view including hidden files.

### Sorting Options

#### `lS` - Sort by Size
```bash
lS
```
Lists files sorted by size (largest first), useful for finding large files.

**Example use case:**
```bash
cd ~/Downloads
lS | head -10  # Show 10 largest files
```

#### `lt` - Sort by Time
```bash
lt
```
Lists files sorted by modification time (newest first).

**Example use case:**
```bash
lt  # Quickly see what you modified recently
```

### Advanced Features

#### `lg` - Git-Aware Listing
```bash
lg
```
Shows git status for each file when in a git repository.

**Example output:**
```
.M file1.txt    # Modified
N  file2.txt    # New/untracked
-- file3.txt    # Unchanged
```

<!-- Screenshot placeholder: lg command with git status -->

#### `tree` - Tree View
```bash
tree
```
Shows directory structure as a tree (2 levels deep by default).

**Example output:**
```
.
├──  src
│  ├──  main.js
│  └──  utils.js
├──  tests
│  └──  test.js
└──  README.md
```

<!-- Screenshot placeholder: tree command output -->

#### `treed` - Tree View (Directories Only)
```bash
treed
```
Shows only directories in tree format.

---

## Fuzzy Finding with fzf

The `fzf` tool enables interactive fuzzy searching for files, directories, and more.

### Finding and Editing Files

#### `vf` - Fuzzy Find and Edit
```bash
vf
```
**How it works:**
1. Type `vf` and press Enter
2. Start typing part of a filename
3. Use arrow keys to navigate results
4. Press Enter to open the selected file in Neovim

**Example workflow:**
```bash
vf
# Type: "readme"
# Results show: README.md, readme.txt, etc.
# Select and press Enter to edit
```

<!-- Screenshot placeholder: vf interactive search -->

**Tip:** Works recursively from current directory!

### Finding Directories

#### `cdf` - Change Directory with Fuzzy Finding
```bash
cdf
```
**How it works:**
1. Shows all directories under current location
2. Type to filter
3. Select with Enter to cd into that directory

**Example:**
```bash
cd ~
cdf
# Type: "proj"
# Select "Projects/my-project"
# Now in ~/Projects/my-project
```

### Searching Command History

#### `fh` - Fuzzy History Search
```bash
fh
```
**How it works:**
1. Shows your command history
2. Type to search
3. Selected command is displayed (not executed)

**Example:**
```bash
fh
# Type: "git commit"
# See all your git commit commands
# Select one to see it
```

**Tip:** Use `Ctrl+R` in the shell for similar functionality (built into Oh My Zsh with fzf integration)

<!-- Screenshot placeholder: fh fuzzy history search -->

---

## Smart Navigation with zoxide

The `zoxide` tool learns from your navigation habits and lets you jump to frequently used directories.

### Interactive Jump

#### `z` - Jump to Directory
```bash
z
```
Opens an interactive menu of your most-used directories.

**First-time use:**
Navigate to directories normally a few times:
```bash
cd ~/Documents
cd ~/Projects/website
cd ~/Pictures
```

**Then use zoxide:**
```bash
z doc    # Jumps to ~/Documents
z proj   # Jumps to ~/Projects/website
z pic    # Jumps to ~/Pictures
```

**Features:**
- No need for full path
- Learns from frequency and recency
- Works with partial matches

<!-- Screenshot placeholder: z interactive directory selection -->

#### `j` - Jump and List
```bash
j
```
Like `z`, but after jumping, lists the directory contents with `eza`.

**Example:**
```bash
j proj
# Jumps to ~/Projects and shows:
# 📁 website
# 📁 dotfiles
# 📄 README.md
```

### Tips for zoxide

1. **Be specific:** If multiple directories match, add more characters
   ```bash
   z web      # Might be ambiguous
   z websi    # More specific → ~/Projects/website
   ```

2. **Recent vs Frequent:** zoxide balances both frequency and recency

3. **View database:** See all tracked directories:
   ```bash
   zoxide query -l
   ```

---

## Enhanced File Viewing with bat

The `bat` tool is like `cat` but with syntax highlighting and line numbers.

### Viewing Files

#### `bat` - View with Syntax Highlighting
```bash
bat filename.js
```

**Features:**
- Syntax highlighting for many languages
- Line numbers
- Git integration (shows changes)
- Paging for long files

<!-- Screenshot placeholder: bat showing syntax highlighted code -->

**Example:**
```bash
bat ~/.zshrc
# Shows your zsh config with:
# - Syntax highlighting
# - Line numbers
# - Beautiful formatting
```

### Plain Output

#### `bats` - Plain bat (for piping)
```bash
bats filename.txt
```
No styling or paging, useful when piping to other commands.

**Example:**
```bash
bats data.txt | grep "important"
bats config.json | jq '.settings'
```

### Advanced bat Usage

**Compare files side by side:**
```bash
bat file1.js file2.js
```

**Show specific lines:**
```bash
bat --line-range 10:20 large-file.txt
```

**Different themes:**
```bash
bat --theme="Monokai Extended" file.js
```

List available themes:
```bash
bat --list-themes
```

---

## Git Workflow Enhancements

### Fuzzy Branch Switching

#### `gb` - Git Branch (Fuzzy)
```bash
gb
```
**How it works:**
1. Shows all your git branches
2. Fuzzy search to find the one you want
3. Press Enter to checkout that branch

**Example:**
```bash
cd my-git-repo
gb
# Type: "feat"
# Shows: feature/new-feature, feature/update, etc.
# Select and switch!
```

<!-- Screenshot placeholder: gb fuzzy branch selection -->

### Git-Aware Listing

Use `lg` to see git status alongside files:
```bash
cd my-git-repo
lg
# See which files are modified, new, or staged
```

---

## Kitty Terminal Features

### Multiple Clipboard Buffers

Kitty is configured with 4 separate clipboard buffers for power users.

#### Keyboard Shortcuts

| Action | Buffer A | Buffer B | Buffer C | Buffer D |
|--------|----------|----------|----------|----------|
| **Copy** | F1 | F2 | F3 | F4 |
| **Paste** | Alt+F1 | Alt+F2 | Alt+F3 | Alt+F4 |

#### Usage Example

**Scenario:** You need to copy multiple snippets and paste them in different places.

1. **Copy first snippet:**
   - Select text
   - Press `F1`

2. **Copy second snippet:**
   - Select different text
   - Press `F2`

3. **Paste first snippet:**
   - Move cursor to destination
   - Press `Alt+F1`

4. **Paste second snippet:**
   - Move cursor to different location
   - Press `Alt+F2`

<!-- Screenshot placeholder: Kitty with multiple clipboard buffers demonstration -->

### Opening Files in Editor

The default editor is Visual Studio Code. To open files:

```bash
kitty @ launch code filename.txt
```

Or configure a different editor in `kitty.conf`:
```
editor nvim
```

### Kitty Themes

The Blazer theme provides a comfortable dark color scheme:
- Deep blue-black background (#0d1925)
- Light blue-white foreground (#d9e5f1)
- Muted colors for reduced eye strain

<!-- Screenshot placeholder: Kitty with Blazer theme -->

**Change themes:**
Browse themes at: https://github.com/dexpota/kitty-themes

---

## Oh My Zsh Plugins

This configuration includes several powerful Oh My Zsh plugins.

### Built-in Plugins

#### git
Provides many git aliases:
```bash
ga        # git add
gc        # git commit
gp        # git push
gst       # git status
gco       # git checkout
gl        # git pull
```

See all: `alias | grep git`

#### sudo
Press `Esc` twice to prefix the current or previous command with `sudo`.

**Example:**
```bash
apt update    # Oops, forgot sudo
# Press Esc Esc
sudo apt update   # Fixed!
```

#### history-substring-search
Use `Up` and `Down` arrows to search history based on what you've typed.

**Example:**
```bash
git      # Type this
# Press Up arrow
# Cycles through: git commit, git push, git pull, etc.
```

#### web-search
Search the web from terminal:
```bash
google "how to use zsh"
stackoverflow "bash scripting"
github "dotfiles"
```

#### colored-man-pages
Makes manual pages colorful and easier to read:
```bash
man ls
```

<!-- Screenshot placeholder: Colored man page -->

### External Plugins

#### zsh-autosuggestions
Suggests commands as you type based on history.

**Usage:**
- Start typing a command
- Gray text appears suggesting completion
- Press `→` (right arrow) to accept
- Press `Ctrl+→` to accept one word

<!-- Screenshot placeholder: zsh-autosuggestions in action -->

#### zsh-syntax-highlighting
Highlights commands as you type:
- Green: Valid command
- Red: Invalid command
- Blue: Option/flag

#### autoenv
Automatically sources `.env` files when entering directories.

**Example:**
Create `.env` in project directory:
```bash
export PROJECT_NAME="my-app"
export DEBUG=true
```

Navigate to directory:
```bash
cd ~/Projects/my-app
# Environment variables automatically loaded!
```

---

## Tips and Tricks

### Quick Tips

1. **Command chaining with aliases:**
   ```bash
   cd ~/Projects && ll
   ```

2. **Combine tools:**
   ```bash
   bat $(fzf)  # Fuzzy find and view with bat
   ```

3. **Search and replace in history:**
   ```bash
   ^old^new    # Replaces 'old' with 'new' in last command
   ```

4. **Use tab completion:**
   ```bash
   cd Pro<Tab>  # Completes to Projects/
   ```

5. **Quick directory navigation:**
   ```bash
   cd -        # Go to previous directory
   cd          # Go to home directory
   ```

### Power User Workflows

#### Workflow 1: Finding and Editing Configuration Files
```bash
cd ~/dotfiles
vf           # Fuzzy find the file you want to edit
# Make changes
source ~/.zshrc   # Reload configuration
```

#### Workflow 2: Exploring a New Project
```bash
z project-name    # Jump to project
tree              # See structure
ll                # List files
bat README.md     # Read documentation
```

#### Workflow 3: Git Branch Management
```bash
cd my-repo
gb                # Switch to branch
lg                # Check file status
```

#### Workflow 4: Finding Large Files
```bash
cd ~/Downloads
lS | head -20     # Show 20 largest files
```

### Customization Ideas

1. **Add your own aliases** in `~/dotfiles/zsh/aliases.zsh`
2. **Customize prompt** with `p10k configure`
3. **Change Kitty theme** by editing `kitty.conf`
4. **Add shell functions** for repeated tasks

---

## Practice Exercises

Try these to get comfortable:

1. **Exercise: File Navigation**
   ```bash
   cd ~
   ls
   ll
   la
   tree
   ```

2. **Exercise: Fuzzy Finding**
   ```bash
   vf          # Find and edit a file
   cdf         # Find and cd to a directory
   fh          # Search your command history
   ```

3. **Exercise: Zoxide Learning**
   ```bash
   cd ~/Documents
   cd ~/Downloads
   cd ~/Projects
   z doc       # Try jumping
   j down      # Jump and list
   ```

4. **Exercise: Git Workflow**
   ```bash
   cd your-git-repo
   lg          # Check status
   gb          # Switch branch
   ```

---

## Getting Help

- **Command help:** Most commands support `--help`
  ```bash
  eza --help
  fzf --help
  bat --help
  ```

- **Man pages:**
  ```bash
  man zsh
  man git
  ```

- **Alias definitions:**
  ```bash
  alias ls    # See what 'ls' is aliased to
  alias       # See all aliases
  ```

---

**Next:** Check out [Advanced Features](Advanced-Features.md) for even more power user tips!
