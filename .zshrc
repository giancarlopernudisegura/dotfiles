export TERMINFO=/usr/lib/terminfo

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search sudo aws battery command-not-found)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

##############
# custom stuff
alias gcc='gcc -Wall -std=c99'
alias cfg='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias sudo='sudo -p "[sudo] password for %u: "'
alias ssh-desktop='ssh -X giancarlo@75.159.226.175'
alias ssh-school='ssh pernudi@ue10.cs.ualberta.ca'
alias cfv='vim ~/.config/nvim/init.lua'
alias cfb='vim ~/.bashrc'
alias cfa='vim ~/.config/alacritty/alacritty.yml'
alias cfz='vim ~/.zshrc'
alias cfi='vim ~/.config/i3/config'
alias cfp='vim ~/.config/polybar/config'
alias cfx='vim ~/.xinitrc'
alias cfs='vim ~/.config/powerline-shell/themes/shell'
alias cfc='vim ~/.config/compton/compton.conf'
alias cfq='vim "+cd ~/.config/qtile" ~/.config/qtile/'
alias cff='code $HOME/.mozilla/firefox/r2n4znb9.default-nightly/chrome/'
alias colortest='for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""'
alias search='pacman -Ss'
alias update='sudo pacman -Syu'
alias smi='sudo make install'
alias v='vim'
alias p='python'
#alias r='ranger'
alias l='lsd'
alias ls='lsd'
alias la='lsd -lah'
alias lh='lsd -lh'
alias tree='lsd --tree'
alias open='dolphin $(pwd) --split'
alias emacs='emacs -nw'
alias del='rmtrash'
alias trash='cd ~/.local/share/Trash/files'
alias weather='curl wttr.in'
alias copy='xclip -selection clipboard'
alias git-upstream='git push --set-upstream origin $(git branch --show-current)'

function configs {
    echo cfv: ~/.vimrc
    echo cfb: ~/.bashrc
    echo cfz: ~/.zshrc
    echo cfi: ~/.config/i3/config
    echo cfp: ~/.config/polybar/config
    echo cfc: ~/.config/compton/compton.conf
    echo cfs: ~/.config/powerline-shell/themes/shell
    echo cfx: ~/.Xresources
}

function rn {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# This binds Ctrl-O to rn:
bindkey -s '^O' 'ranger\n'
# This binds Alt-C to clear screen:
bindkey -s '^[c' 'clear\n'
# Vi Mode
# bindkey -v

source ~/.oh-my-zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh


# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
