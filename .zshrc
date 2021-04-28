
source $HOME/.dotfile/prompt/prompt.zsh
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd


# Define a custom file for compdump
#ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump-$HOST-$ZSH_VERSION"

export ZDOTDIR=$HOME/.cache/zsh

HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=$ZDOTDIR/.zsh_history

export PATH="/usr/local/tmux/bin:$PATH"

export NVM_DIR="$HOME/.dotfile/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


note () {
  local notes_dir="$HOME/Project/notes"
  case "$1" in
    c)
      cd "$notes_dir"
      ;;
    l)
      ls "$notes_dir"
      ;;
    p)
      pushd "$notes_dir"
      msg="Regenerated at $(date -u '+%Y-%m-%d %H:%M:%S') UTC"
      git add .
      git commit -m "$msg"
      git push origin master
      popd
      ;;
    *)
      vim "$notes_dir/$1"
  esac
}

[ -f ~/.dotfile/.fzf.zsh ] && source ~/.dotfile/.fzf.zsh
