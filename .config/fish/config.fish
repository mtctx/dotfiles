# ~/.config/fish/config.fish
# ----------------------------------
# Hide default Fish welcome message
set -U fish_greeting ""

# Run fastfetch on interactive shells
if status is-interactive
    fastfetch
end

# Better command history search with arrow keys
bind \e\[A history-search-backward
bind \e\[B history-search-forward

# Colorful, minimal prompt
function fish_prompt
    set_color cyan
    echo -n (whoami)
    set_color yellow
    echo -n "@"
    set_color magenta
    echo -n (string split '.' $hostname)[1]
    set_color normal
    echo -n " "
    set_color green
    echo -n (prompt_pwd)
    set_color normal

    # Show git branch if in repo
    set branch (git symbolic-ref --short HEAD ^/dev/null 2>/dev/null)
    if test -n "$branch"
        set_color blue
        echo -n " [$branch]"
        set_color normal
    end

    echo -n \n
    echo -n "> "
end

# Use human-readable sizes in ls
alias ls="ls --color=auto -h"
alias ll="ls -lAh"

# Quick cd shortcuts
alias ..="cd .."
alias ...="cd ../.."

# Add any custom PATH additions here
# set -gx PATH $HOME/.local/bin $PATH
