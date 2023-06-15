# Enable colors and change prompt:
autoload -U colors && colors
PS1="%F{red}[%F{blue}%n %F{cyan}%c%F{red}]%f$%b "

# Homebrew aliases
alias bi="brew install"
alias bic="brew install --cask"
alias bin="brew info"
alias bs="brew search"

# Misc aliases
alias code="open -a 'Visual Studio Code'"
alias df="df -h"
alias free="free -m"
alias grep="grep --color=auto"
alias ls="ls --color"
alias v=vim

# Aliases for editing and sourcing config files
alias vs="vim ~/.skhdrc"
alias vv="vim ~/.vimrc"
alias vy="vim ~/.yabairc"
alias vz="vim ~/.zshrc"

alias ss="source ~/.skhdrc"
alias sv="source ~/.vimrc"
alias sy="source ~/.yabairc"
alias sz="source ~/.zshrc"

# Git aliases
alias ga="git add"
alias gall="git add ."
alias gcl="git clone"
alias gcm="git commit"
alias gp="git pull"
alias gph="git push"

# Get top process eating memory
alias mem='ps auxf | sort -nr -k 4 | head -5'

# Get top process eating cpu ##
alias cpu='ps auxf | sort -nr -k 3 | head -5'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'H' vi-backward-char
bindkey -M menuselect 'K' vi-up-line-or-history
bindkey -M menuselect 'L' vi-forward-char
bindkey -M menuselect 'J' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

function manv {
   man $1 | col -b | vim -MR - 
}

function path {
    echo $PATH | tr ':' '\n'
} 


# Added for cyberpeacock_login
export PATH="/Users/206764881/Library/CloudStorage/OneDrive-NBCUniversal/My Documents/Code:$PATH"
# Added for ruby
export PATH="/opt/homebrew/opt/ruby/bin:/usr/local/lib/ruby/gems/3.2.2/bin:$PATH"


# Activate syntax highlighting plugin
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate autosuggestions plugin
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
