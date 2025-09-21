alias cz='chezmoi'

if command -v nvim &> /dev/null; then
  alias vim='nvim'
  alias vi='nvim'
fi

if command -v bat &> /dev/null; then
  alias cat='bat'
fi

if command -v atuin &> /dev/null; then
  eval "$(atuin init zsh)"
fi

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

if command -v gt &> /dev/null; then
  alias gs='gt s'
  alias gm='gt m'
  alias gmc='gt m -c -m ":sparkles:"'
else
  alias gs='git push'
  alias gm='git commit --amend --no-edit'
  alias gmc='git commit -m ":sparkles:"'
fi
alias gsd='git stash --keep-index -u'
alias gcm='git checkout dev'
alias gms='gm && gs'
