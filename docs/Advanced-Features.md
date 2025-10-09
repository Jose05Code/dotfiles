# Advanced Features

Advanced tips, tricks, and workflows for power users.

## Table of Contents

- [Advanced Zsh Features](#advanced-zsh-features)
- [Shell Scripting Techniques](#shell-scripting-techniques)
- [Workflow Automation](#workflow-automation)
- [Performance Optimization](#performance-optimization)
- [Integration with Other Tools](#integration-with-other-tools)
- [Advanced Git Workflows](#advanced-git-workflows)
- [Debugging and Profiling](#debugging-and-profiling)

---

## Advanced Zsh Features

### History Management

#### Shared History Across Sessions

Already enabled! All terminal sessions share the same history.

```bash
# View history
history

# Search history
history | grep "docker"

# Execute command from history by number
!1234

# Execute last command
!!

# Execute last command starting with "git"
!git
```

#### History Search Improvements

Use `Ctrl+R` for reverse search (enhanced by fzf):
```bash
# Press Ctrl+R, then type search term
# Use arrows to navigate, Enter to select
```

#### Advanced History Expansion

```bash
# Use arguments from previous command
!$              # Last argument
!^              # First argument
!*              # All arguments

# Example:
ls /long/path/to/directory
cd !$           # cd /long/path/to/directory
```

### Glob Patterns

#### Recursive Globbing

```bash
# Find all .js files recursively
ls **/*.js

# Find all Python files in specific subdirectories
ls **/src/**/*.py
```

#### Qualifiers

```bash
# List only directories
ls *(/)

# List only files
ls *(.)

# List only executable files
ls *(*)

# List only symlinks
ls *(@)

# List files modified in last day
ls *(m-1)

# List files by size (largest first)
ls *(OL)

# List 10 newest files
ls *(om[1,10])
```

### Command Substitution

```bash
# Store command output in variable
files=$(find . -name "*.txt")

# Use in another command
echo "Found: $files"

# Process substitution
diff <(ls dir1) <(ls dir2)
```

### Arrays and Loops

```bash
# Create array
servers=(web1 web2 web3 db1)

# Loop through array
for server in $servers; do
    echo "Connecting to $server"
    ssh $server "uptime"
done

# Array with index
for i in {1..5}; do
    echo "Number: $i"
done
```

---

## Shell Scripting Techniques

### Creating Reusable Scripts

Create scripts in `~/dotfiles/scripts/`:

```bash
#!/bin/zsh
# ~/dotfiles/scripts/project-setup.sh
# Quick project setup script

set -e  # Exit on error

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: project-setup <name>"
    exit 1
fi

echo "Setting up project: $PROJECT_NAME"

# Create project structure
mkdir -p ~/Projects/$PROJECT_NAME/{src,tests,docs}
cd ~/Projects/$PROJECT_NAME

# Initialize git
git init
echo "# $PROJECT_NAME" > README.md
echo "node_modules/" > .gitignore

# Initialize npm (if Node.js project)
npm init -y

echo "Project $PROJECT_NAME created!"
cd ~/Projects/$PROJECT_NAME
```

Make it executable and add to PATH:
```bash
chmod +x ~/dotfiles/scripts/project-setup.sh
echo 'export PATH="$HOME/dotfiles/scripts:$PATH"' >> ~/dotfiles/zsh/zshrc
```

### Error Handling

```bash
#!/bin/zsh

# Exit on error
set -e

# Custom error handler
error_handler() {
    echo "Error on line $1"
    exit 1
}

trap 'error_handler $LINENO' ERR

# Your commands here
risky_command || echo "Failed gracefully"
```

### Parameter Validation

```bash
validate_args() {
    if [ $# -lt 2 ]; then
        echo "Usage: $0 <arg1> <arg2>"
        return 1
    fi
    
    if [ ! -f "$1" ]; then
        echo "Error: File $1 not found"
        return 1
    fi
}
```

---

## Workflow Automation

### Project-Specific Setup

Use `autoenv` for automatic project setup:

```bash
# ~/Projects/my-project/.env

# Automatically activate Python virtual environment
if [ -d "venv" ]; then
    source venv/bin/activate
fi

# Load project-specific aliases
alias run='python manage.py runserver'
alias test='pytest'

# Set project variables
export PROJECT_ROOT=$(pwd)
export DEBUG=true

echo "🚀 Project environment loaded!"
```

### Git Hooks Integration

Create pre-commit hooks:

```bash
# ~/Projects/my-project/.git/hooks/pre-commit
#!/bin/zsh

echo "Running pre-commit checks..."

# Run linter
npm run lint || exit 1

# Run tests
npm test || exit 1

echo "✅ All checks passed!"
```

Make it executable:
```bash
chmod +x .git/hooks/pre-commit
```

### Batch Operations

```bash
# Process multiple directories
for dir in ~/Projects/*/; do
    echo "Processing $dir"
    cd "$dir"
    git pull
    npm install
done

# Backup all git repos
for repo in ~/Projects/*/.git; do
    dir=$(dirname "$repo")
    name=$(basename "$dir")
    tar -czf ~/Backups/"$name-$(date +%Y%m%d).tar.gz" -C ~/Projects "$name"
done
```

---

## Performance Optimization

### Lazy Loading Plugins

Speed up shell startup by lazy loading heavy plugins:

```bash
# Add to ~/dotfiles/zsh/zshrc

# Lazy load NVM
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  nvm() {
    unfunction nvm
    source "$HOME/.nvm/nvm.sh"
    nvm "$@"
  }
fi

# Lazy load RVM
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
  rvm() {
    unfunction rvm
    source "$HOME/.rvm/scripts/rvm"
    rvm "$@"
  }
fi
```

### Caching

```bash
# Cache expensive commands
if [ ! -f ~/.cache/package-list ]; then
    npm list -g > ~/.cache/package-list
fi

# Use cached version
cat ~/.cache/package-list
```

### Parallel Execution

```bash
# Run commands in parallel using background jobs
for server in web{1..10}; do
    ssh $server "uptime" &
done
wait  # Wait for all background jobs
```

---

## Integration with Other Tools

### tmux Integration

Create sessions automatically:

```bash
# ~/dotfiles/scripts/tmux-dev.sh
#!/bin/zsh

SESSION="dev"

# Check if session exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
    # Create new session
    tmux new-session -d -s $SESSION
    
    # Window 1: Editor
    tmux rename-window -t $SESSION:1 'editor'
    tmux send-keys -t $SESSION:1 'cd ~/Projects && nvim' C-m
    
    # Window 2: Server
    tmux new-window -t $SESSION:2 -n 'server'
    tmux send-keys -t $SESSION:2 'cd ~/Projects/my-app && npm run dev' C-m
    
    # Window 3: Shell
    tmux new-window -t $SESSION:3 -n 'shell'
    tmux send-keys -t $SESSION:3 'cd ~/Projects/my-app' C-m
fi

# Attach to session
tmux attach-session -t $SESSION
```

### Docker Integration

Advanced Docker aliases:

```bash
# Add to aliases.zsh

# Remove all stopped containers
alias docker-clean='docker container prune -f'

# Remove all unused images
alias docker-clean-images='docker image prune -a -f'

# Show container resource usage
alias docker-stats='docker stats --no-stream'

# Enter running container
denter() {
    docker exec -it $1 /bin/bash
}

# Build and run in one command
docker-build-run() {
    docker build -t $1 . && docker run -it $1
}

# Show container logs with follow
dlogs() {
    docker logs -f $1
}
```

### IDE Integration

Open projects quickly:

```bash
# Visual Studio Code
code-project() {
    cd ~/Projects
    project=$(ls | fzf)
    if [ -n "$project" ]; then
        code ~/Projects/$project
    fi
}

# JetBrains IDEs
idea-project() {
    cd ~/Projects
    project=$(ls | fzf)
    if [ -n "$project" ]; then
        idea ~/Projects/$project
    fi
}
```

---

## Advanced Git Workflows

### Interactive Git Functions

```bash
# Fuzzy search git log and show diff
gflog() {
    git log --oneline --color=always | \
    fzf --ansi --no-sort --preview 'git show --color=always {1}' | \
    cut -d ' ' -f1
}

# Interactive staging with preview
gadd() {
    git status --short | \
    fzf -m --preview 'git diff --color=always {2}' | \
    awk '{print $2}' | \
    xargs git add
}

# Interactive unstaging
greset() {
    git diff --cached --name-only | \
    fzf -m --preview 'git diff --cached --color=always {}' | \
    xargs git reset HEAD
}
```

### Git Aliases (Advanced)

Add to `~/.gitconfig`:

```ini
[alias]
    # Show pretty log
    lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

    # Show branches with last commit
    br = branch -vv
    
    # Amend without editing message
    amend = commit --amend --no-edit
    
    # Undo last commit but keep changes
    undo = reset --soft HEAD^
    
    # Show changed files in last commit
    changed = show --name-only
    
    # Diff with word highlighting
    wdiff = diff --word-diff
    
    # List all aliases
    aliases = config --get-regexp alias
```

### Worktree Management

Work on multiple branches simultaneously:

```bash
# Create worktree for feature branch
git worktree add ../my-project-feature feature/new-feature

# Work in both locations
cd ~/Projects/my-project          # main branch
cd ~/Projects/my-project-feature  # feature branch

# List worktrees
git worktree list

# Remove worktree
git worktree remove ../my-project-feature
```

---

## Debugging and Profiling

### Shell Debugging

Enable debug mode:

```bash
# Debug mode
set -x

# Your commands here
ls -la
cd ~

# Disable debug
set +x
```

### Profile Zsh Startup Time

```bash
# Add to top of ~/.zshrc temporarily
zmodload zsh/zprof

# Add to bottom of ~/.zshrc
zprof
```

Then restart shell to see profiling output.

### Check Plugin Loading Times

```bash
# Time a specific command
time source ~/.zshrc

# Time Oh My Zsh loading
time source $ZSH/oh-my-zsh.sh
```

### Find Slow Commands

```bash
# Enable command timing in prompt
# Add to ~/.zshrc
setopt PROMPT_SUBST
REPORTTIME=3  # Show time for commands taking > 3 seconds
```

### Trace Function Execution

```bash
# Add to function for debugging
function my_function() {
    echo "Entering my_function with args: $@" >&2
    # Your code here
    echo "Exiting my_function" >&2
}
```

---

## Advanced fzf Usage

### Custom fzf Functions

```bash
# Search and preview files, with syntax highlighting
fzf-bat() {
    fzf --preview 'bat --color=always --style=numbers {}'
}

# Multi-select and execute command
fzf-run() {
    local cmd=$1
    shift
    fzf -m | xargs $cmd "$@"
}

# Interactive kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    
    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

# Search history and execute
fh-exec() {
    eval $(history | fzf --tac --no-sort | sed 's/^[ ]*[0-9]*[ ]*//')
}
```

### fzf with Git

```bash
# Checkout branch with preview
gcb() {
    git branch -a | \
    grep -v HEAD | \
    fzf --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' | \
    sed 's/^..//' | \
    cut -d' ' -f1 | \
    xargs git checkout
}

# Interactive rebase
grbi() {
    git log --oneline --color=always | \
    fzf --ansi --preview 'git show --color=always {1}' | \
    cut -d ' ' -f1 | \
    xargs -I {} git rebase -i {}^
}
```

---

## Security Best Practices

### Sensitive Information

Never commit sensitive data:

```bash
# Create .env for secrets
echo ".env" >> .gitignore
echo "*.key" >> .gitignore
echo "*.pem" >> .gitignore

# Use environment variables
export API_KEY=$(cat ~/.secrets/api_key)
```

### SSH Key Management

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to SSH agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub | pbcopy  # macOS
cat ~/.ssh/id_ed25519.pub | xclip   # Linux
```

### GPG Signing Commits

```bash
# Generate GPG key
gpg --full-generate-key

# List keys
gpg --list-secret-keys --keyid-format LONG

# Configure git to use GPG
git config --global user.signingkey YOUR_KEY_ID
git config --global commit.gpgsign true
```

---

## Advanced Customization Ideas

### Context-Aware Prompt

Show different info based on context:

```bash
# In .p10k.zsh or custom function

# Show Python version in Python projects
if [ -f "requirements.txt" ] || [ -f "setup.py" ]; then
    PYTHON_VERSION=$(python --version 2>&1 | cut -d ' ' -f2)
    echo "🐍 $PYTHON_VERSION"
fi

# Show Node version in Node projects
if [ -f "package.json" ]; then
    NODE_VERSION=$(node --version)
    echo "⬢ $NODE_VERSION"
fi
```

### Smart Directory Shortcuts

```bash
# Hash directories for quick access
hash -d proj=~/Projects
hash -d dots=~/dotfiles
hash -d down=~/Downloads

# Usage:
cd ~proj    # Goes to ~/Projects
cd ~dots    # Goes to ~/dotfiles
```

---

## Performance Monitoring

### System Resources

```bash
# CPU usage
alias cpu-top='ps aux | sort -rk 3,3 | head -n 10'

# Memory usage
alias mem-top='ps aux | sort -rk 4,4 | head -n 10'

# Disk usage
alias disk-usage='df -h | grep -v tmpfs'

# Monitor file changes
alias watch-dir='watch -n 1 ls -lah'
```

---

## Next Level Workflows

### One-Command Project Start

```bash
dev() {
    local project=$1
    if [ -z "$project" ]; then
        project=$(ls ~/Projects | fzf)
    fi
    
    if [ -n "$project" ]; then
        cd ~/Projects/$project
        code .
        npm install
        npm run dev
    fi
}
```

### Automated Backup

```bash
# Add to crontab: crontab -e
# 0 2 * * * /home/user/dotfiles/scripts/backup.sh

#!/bin/zsh
# backup.sh

BACKUP_DIR=~/Backups
DATE=$(date +%Y%m%d)

# Backup dotfiles
tar -czf $BACKUP_DIR/dotfiles-$DATE.tar.gz ~/dotfiles

# Backup projects
for project in ~/Projects/*; do
    name=$(basename "$project")
    tar -czf $BACKUP_DIR/projects-$name-$DATE.tar.gz "$project"
done

# Keep only last 7 days
find $BACKUP_DIR -name "*.tar.gz" -mtime +7 -delete
```

---

**Keep Exploring!** The possibilities are endless. Check the [Customization Guide](Customization.md) for more ideas.
