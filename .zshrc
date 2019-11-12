# ~/.zshrc
# --------


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
ZSH_CACHE_DIR=$HOME/.cache/zsh
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
if [ ! -d "$ZSH_CACHE_DIR" ]; then
    mkdir -p "$ZSH_CACHE_DIR"
fi

# vi mode
bindkey -v

# completion {{{

# packages: zsh-completions

zstyle :compinstall filename '/home/pablo/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES

bindkey '\e.' insert-last-word

autoload -Uz compinit
compinit
# }}}
# source common rc {{{
if [ -f ~/.shrc ]; then
    . ~/.shrc
fi
# }}}
# prompt {{{
autoload -Uz promptinit
promptinit
prompt adam2
# }}}

# package: autoenv
if [ -f /usr/share/autoenv/activate.sh ]; then
    source /usr/share/autoenv/activate.sh
fi

# package: fasd
if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init auto >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache

  alias j=z
fi

# package: zsh-syntax-highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# package: zsh-history-substring-search-git
if [ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi

# vim: fdm=marker

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/tom/r/semaphore-demo-cloudflare-workers/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/tom/r/semaphore-demo-cloudflare-workers/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/tom/r/semaphore-demo-cloudflare-workers/node_modules/tabtab/.completions/sls.zsh ]] && . /home/tom/r/semaphore-demo-cloudflare-workers/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/tom/r/semaphore-demo-cloudflare-workers/node_modules/tabtab/.completions/slss.zsh ]] && . /home/tom/r/semaphore-demo-cloudflare-workers/node_modules/tabtab/.completions/slss.zsh