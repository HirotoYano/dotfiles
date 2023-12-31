. ~/dotfiles/git-prompt.sh
. ~/.bash_local
alias v='vim'
alias nv='nvim'

alias pc='pbcopy <'
alias l='ls -ltr'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

alias ide='bash ~/dotfiles/ide.sh'

# git
alias g='git'
alias gs='git status -sb'
alias gco='git checkout'
alias gp='git pull'
alias gd='git diff'
alias gl='git log --graph --date=short'
alias ga='git add'
alias gc='git commit -m'

# docker
alias dk='docker'
alias dc='docker compose'
alias dcp='docker compose ps'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

# cd dir by fzf
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# git checkout by fzf
fch() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# git remote checkout by fzf
fchr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# docker exec bash by fzf
dbash() {
  local name
  name=$(docker ps --format "{{.Names}}" | fzf-tmux)
  docker exec -it $name bash
}

# cd git repository by fzf
fghq() {
  local repo
  repo=$(ghq list | fzf-tmux)
  cd $(ghq root)/$repo
}

_fzf_history() {
  local output
  output=$(history | sed 's/ *[0-9]* *//' | awk '!a[$0]++' | fzf-tmux)
  READLINE_LINE=$output
  READLINE_POINT=0x7fffffff
}
bind -x '"\C-r": _fzf_history'

# PS1_USER="\[\e[1;39;46m\] \h "
# PS1_DIR="\[\e[1;39;44m\] \W "
PS1_GIT='\[\e[1;39;46m\]$(__git_ps1 " %s ")'
# PS1_BLUE="\[\e[0;34;49m\] $ "
# PS1_WHITE="\[\e[0;39;49m\]"
# export PS1=$PS1_USER$PS1_DIR$PS1_GIT$PS1_BLUE$PS1_WHITE

prompt_color='\[\033[;32m\]'
info_color='\[\033[1;34m\]'
prompt_symbol=㉿

PS1=$prompt_color"┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)"$prompt_color")}("$info_color"\u"$prompt_symbol"\h"$prompt_color")-[\[\033[0;1m\]\w"$prompt_color"] $PS1_GIT\n"$prompt_color"└─\(*'-')/ "$info_color"\$\[\033[0m\] "

