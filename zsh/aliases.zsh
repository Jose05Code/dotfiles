# ~/.zshrc

#=================================================
# Aliases for eza (a modern replacement for ls)
#=================================================

# Normal listing
alias ls='eza --color=auto --group-directories-first --icons'

# Detailed listings
alias ll='eza -lh --icons'
alias lla='eza -lah --icons'

# Tree view
alias tree='eza --tree --level=2 --icons'

#=================================================
# Fuzzy finding and navigation
#=================================================

# Fuzzy find and open a file in the editor
alias nvimf='nvim $(fzf)'

# Fuzzy find and cd into a directory
alias cdf='cd $(find . -type d | fzf)'

# Fuzzy search through command history
alias historyf='history | fzf'

# Fuzzy switch Git branch
alias gb='git branch | fzf | xargs git checkout'

#=================================================
# zoxide shortcuts
#=================================================

# Jump and list contents beautifully
alias zoxidej='cd "$(zoxide query -i)" && eza -lh --icons'
alias zoxidea='zoxide add'
