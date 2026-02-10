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
alias nvimf='nvim $(fzf --height 40% --layout=reverse --preview="bat --style=numbers --color=always {}" )'

# Fuzzy find and cd into a directory
alias cdf='cd $(find . -type d | fzf --height 40% --layout=reverse)'

# Fuzzy search through command history
alias historyf='history | fzf --height 40% --layout=reverse | awk "{\$1=\"\"; print \$0}" | xargs -I {} sh -c "{}"'

# Fuzzy switch Git branch
alias gb='git branch | fzf --height 40% --layout=reverse | xargs git checkout'

#=================================================
# zoxide shortcuts
#=================================================

# Jump and list contents beautifully
alias zoxidej='cd "$(zoxide query -i)" && eza -lh --icons'
alias zoxidea='zoxide add'

#=================================================
# Hyprctl shortcuts 
#=================================================

# Restart Wallpaper
alias hyprpaper-reload='pkill hyprpaper && hyprctl dispatch exec hyprpaper'

# Restar Waybar
alias waybar-reload='pkill waybar && hyprctl dispatch exec waybar'

#=================================================
# Others
#=================================================

alias icat='kitty +kitten icat'
alias bashf='bash $(fzf)'
