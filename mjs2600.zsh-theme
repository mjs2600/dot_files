ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
purple="%F{093}"

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Ruby Version
ruby_status() {
  if [[ -s ~/.rvm/scripts/rvm ]] ; then
    echo "%{$fg[red]%}[`~/.rvm/bin/rvm-prompt`]%{$reset_color%}"
  else
    if which rbenv &> /dev/null; then
      echo "%{$fg[red]%}[`rbenv version | sed -e "s/ (set.*$//"`]%{$reset_color%}"
    else
      if [[ -n `which chruby_prompt_info` && -n `chruby_prompt_info` ]]; then
        echo "%{$fg[red]%}[`chruby_prompt_info`]%{$reset_color%}"
      else
        echo ""
      fi
    fi
  fi
}


elixir_status() {
  if which exenv &> /dev/null; then
    echo "%{$purple%}[`exenv version | sed -e "s/ (set.*$//"`]%{$reset_color%}"
  else
    ""
  fi
}

function haskell_status() {
    cabal_files=(*.cabal(N))
    if [ $#cabal_files -gt 0 ]; then
        if [ -f cabal.sandbox.config ]; then
            echo "%{$fg[green]%}[Sandbox]%{$reset_color%}"
        else
            echo "%{$fg[red]%}[Global]%{$reset_color%}"
        fi
    fi
}

PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
RPS1='$(git_custom_status)$(ruby_status)$(elixir_status)$(haskell_status) $EPS1'

