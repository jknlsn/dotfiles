### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

#####################
# PLUGINS (NOISY)   #
#####################
# IF PLUGIN HAS CONSOLE OUTPUT NEEDS TO GO HERE ABOVE INSTANT PROMPT
# SSH-AGENT
zinit light bobsoppe/zsh-ssh-agent

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set NVM directory
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

#####################
# DOT FILES MANAGER #
#####################
zinit ice depth=1;
zinit light jknlsn/dfm

#####################
# PLUGINS           #
#####################
# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
# ENHANCD
zinit ice wait"0b" lucid
zinit light b4b4r07/enhancd
export ENHANCD_FILTER=fzf:fzy:peco
# HISTORY SUBSTRING SEARCHING
zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# TAB COMPLETIONS
zinit ice wait"0b" lucid blockf
zinit light zsh-users/zsh-completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false

zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"

zinit ice wait"1" lucid
# zinit light Aloxaf/fzf-tab
# SYNTAX HIGHLIGHTING
zinit ice wait"0c" lucid atinit"zpcompinit;zpcdreplay"
zinit light zdharma/fast-syntax-highlighting
# PowerLevel10K
zinit ice depth=1; zinit light romkatv/powerlevel10k

#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

#####################
# SETOPT            #
#####################
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
# setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.

#####################
# ALIASES           #
#####################
source $HOME/.zsh_aliases

#####################
# EXPORTS           #
#####################
export EDITOR="code --wait"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
export PATH="./vendor/bin:$PATH"
export PATH="/opt/homebrew/opt/crowdin@3/bin:$PATH"
