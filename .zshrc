# Enable colors and change prompt:
autoload -U colors && colors
# returns just the name of the git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
set_prompt() {
    PS1="%F{red}[%F{blue}%n %F{cyan}%c%F{red}]%F{green}$(parse_git_branch)%f $%b "
}
# updates prompt every time a command is run
set_prompt
precmd_functions+=set_prompt

# Homebrew aliases
alias bi="brew install"
alias bic="brew install --cask"
alias bin="brew info"
alias bs="brew search"
alias bun="brew uninstall"

# Quick navigation (user dependent)
alias h="cd ~"
alias con="cd ~/.config"
alias dot="cd ~/dotfiles"
if [ $(whoami) = 'roddur' ]; then
    alias a="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Videos/0\ Edit/assets"
    alias b="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Music/Beats/2024/2024-11"
    alias c="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Code"
    alias d="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents"
    alias e="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Videos/Edit"
    alias m="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Music"
    alias sd="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Music/Song\ Downloads"
    alias boi="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Code/boi-rd"
    alias rd="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Code/roddur.xyz"
else
    alias c="cd /Users/206764881/Library/CloudStorage/OneDrive-NBCUniversal/My\ Documents/Code/"
    alias d="cd /Users/206764881/Library/CloudStorage/OneDrive-NBCUniversal/My\ Documents/"
fi

# Misc aliases
alias df="df -h"
alias free="free -m"
alias grep="grep --color=auto"
alias ls="ls -a --color"
alias n=nvim
alias v=vim
alias yd=yt-dlp
alias ydm='yt-dlp  S vcodec:h264,res,acodec:m4at-dlp'
#alias ydw='yt-dlp -x --audio-format wav'
function ydw() {
    local url="$1"
    local filename="$2"

    if [ -z "$filename" ]; then
        yt-dlp -x --audio-format wav "$url"
    else
        yt-dlp -x --audio-format wav -o "$filename.%(ext)s" "$url"
    fi
    eval "open ."
}

function ydv() {
    local url="$1"
    local filename="${2:-video}"

    # Download with best video quality
    yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -o "$filename.%(ext)s" "$url"

    # If the result is webm, convert to mp4
    if [ -f "$filename.webm" ]; then
        ffmpeg -fflags +genpts -i "$filename.webm" -r 24 "$filename.mp4"
        rm "$filename.webm"
    fi
    eval "open ."
}

# DOWNLOADING WITH TIMESTAMPS
# Base function for downloading with timestamps
# Audio with timestamps - direct implementation
function ydts() {
    local format_args="$1"
    local range="$2"
    local url="$3"
    local filename="${4:-clip}"
    
    # Use eval to properly handle the format arguments
    eval "yt-dlp $format_args --download-sections \"*$range\" -o \"$filename.%(ext)s\" \"$url\""
}

# Audio with timestamps
function ydwt() {
    local start="$1"
    local end="$2"
    local url="$3"
    local filename="${4:-clip}"

    # Make sure the timestamp format includes *
    local range="*$start-$end"
    local cmd="yt-dlp -x --audio-format wav --download-sections \"$range\" -o \"$filename.%(ext)s\" \"$url\""

    # Debug output
    echo "Executing audio command: $cmd"

    # Execute the command
    eval "$cmd"
    eval "open ."
}


# Video with timestamps

# Additional function to check and fix video if needed
function ydvt() {
    local start="$1"
    local end="$2"
    local url="$3"
    local filename="${4:-clip}"

    # Make sure the timestamp format includes *
    local range="*$start-$end"
    local cmd="yt-dlp --format \"bestvideo+bestaudio/best\" --merge-output-format mp4 --download-sections \"$range\" -o \"$filename.%(ext)s\" \"$url\""

    # Debug output
    echo "Executing video command: $cmd"

    # Execute the command
    eval "$cmd"

    # Check if the file exists and has video
    if [ -f "$filename.mp4" ]; then
        echo "Checking video content in $filename.mp4..."
        # Check if file has video stream
        local has_video=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_type -of csv=p=0 "$filename.mp4")

        if [ -z "$has_video" ]; then
            echo "No video stream found. Trying to re-download with different options..."
            local retry_cmd="yt-dlp --format \"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best\" --download-sections \"$range\" -o \"${filename}_retry.%(ext)s\" \"$url\""
            echo "Retry command: $retry_cmd"
            eval "$retry_cmd"

            if [ -f "${filename}_retry.mp4" ]; then
                mv "${filename}_retry.mp4" "$filename.mp4"
            fi
        fi
    fi
    eval "open ."
}





function webm2mp4() {
    ffmpeg -fflags +genpts -i $1.webm -r 24 $1.mp4
}

function vid2wav() {
    ffmpeg -i $1 -vn -acodec pcm_s16le -ac 2 -ar 44100 -y $1.wav

}



# fzf functions
# magic cd with optional argument to prefill query
mcd() {
  cd "$(find . -type d -print | fzf --query="$1" --bind 'j:down,k:up,ctrl-j:preview-down,ctrl-k:preview-up')"
}


# Aliases for editing and sourcing config files
alias vs="vim ~/.skhdrc"
alias vv="vim ~/.vimrc"
alias vy="vim ~/.yabairc"
alias vz="vim ~/.zshrc"

alias s=source
alias ss="skhd --restart-service"
alias sy="yabai --restart-service"
alias sz="source ~/.zshrc"

# Git aliases
alias g=git
alias ga="git add"
alias gall="git add ."
alias gb="git branch"
alias gcl="git clone"
alias gcm="git commit -m"
alias gd="git diff @ ."
alias gp="git pull"
alias gph="git push"
alias gs="git status"

# Python and pip aliases
alias py="python3"
alias pi="pip3 install"
alias pfr="pip3 freeze > requirements.txt"

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

# Allow fzf to see hidden files and directories
export FZF_DEFAULT_COMMAND='find .'

# Activate syntax highlighting plugin
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate autosuggestions plugin
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
