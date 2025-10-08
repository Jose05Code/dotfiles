# ~/.zshrc

#=================================================
# Aliases for eza (a modern replacement for ls)
#=================================================

# Normal listing
alias ls='eza --color=auto --group-directories-first --icons'

# Detailed listings
alias ll='eza -lh --icons'
alias la='eza -a --icons'
alias lla='eza -lah --icons'

# Sort by size or date
alias lS='eza -lSh --icons'        # by Size
alias lt='eza -lth --icons'        # by Time

# Git-aware listings
alias lg='eza -lh --git --icons'   # show Git status for each file

# Tree view
alias tree='eza --tree --level=2 --icons'
alias treed='eza --tree --level=2 -d --icons'  # directories only

#=================================================
# Fuzzy finding and navigation
#=================================================

# Fuzzy find and open a file in the editor
alias vf='nvim $(fzf)'

# Fuzzy find and cd into a directory
alias cdf='cd $(find . -type d | fzf)'

# Fuzzy search through command history
alias fh='history | fzf'

# Fuzzy switch Git branch
alias gb='git branch | fzf | xargs git checkout'

#=================================================
# Other useful aliases
#=================================================

# bats is a bat without any styling or paging, useful for piping
alias bats='bat --style=plain --paging=never'

#=================================================
# zoxide shortcuts
#=================================================

# Jump and list contents beautifully
alias j='cd "$(zoxide query -i)" && eza -lh --icons'

# Normal zoxide jump
alias z='zoxide query -i'
