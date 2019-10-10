# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/giancarlo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# Z to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
#ZSH_THEME=random
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(git web-search sudo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export EDITOR='vim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

##############
# custom stuff
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

alias gcc='gcc -Wall -std=c99'
alias cfg='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias sudo='sudo -p "[sudo] password for %u: "'
alias ssh-desktop='ssh -X giancarlo@75.159.226.175'
alias ssh-school='ssh pernudi@ug20.cs.ualberta.ca'
alias cfv='vim ~/.vimrc'
alias cfb='vim ~/.bashrc'
alias cfz='vim ~/.zshrc'
alias cfk='vim ~/.p10k.zsh'
alias cfi='vim ~/.config/i3/config'
alias cfp='vim ~/.config/polybar/config'
alias cfx='vim ~/.Xresources && xrdb ~/.Xresources;'
alias cfs='vim ~/.config/powerline-shell/themes/shell'
alias cfc='vim ~/.config/compton/compton.conf'
alias cff='code /home/giancarlo/.mozilla/firefox/x37y9dyn.default/chrome'
alias colortest='for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""'
alias neofetch='neofetch --ascii ~/.config/neofetch/img.txt --ascii_colors 3 3 3 3 3 3 --gap 11 | lolcat'
alias download='sudo pacman -S'
alias uninstall='sudo pacman -Rns'
alias search='pacman -Ss'
alias update='sudo pacman -Syu'
alias smi='sudo make install'
alias v='vim'
alias p='python'
alias pv='python3.7 -m venv venv'
#alias r='ranger'
alias l='lsd'
alias la='lsd -la'
alias pc='cd ~/Pictures'
alias dl='cd ~/Downloads'
alias doc='cd ~/Documents'
alias open='dolphin $(pwd) --split'
alias emacs='emacs -nw'
alias del='rmtrash'
alias trash='cd ~/.local/share/Trash/files'
alias weather='curl wttr.in'
alias copy='xclip -selection clipboard'

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

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs battery time date)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode ssh pyvenv context dir vcs)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`"
POWERLEVEL9K_HOME_SUB_ICON='💯'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
#POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.p10k.zsh

eval $(thefuck --alias)

# >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/giancarlo/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
    if [ -f "/home/giancarlo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/giancarlo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/giancarlo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

~/.scripts/ufetch-linux
