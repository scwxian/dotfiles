# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OPTS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt PROMPT_SUBST

# ENV VARS
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$PATH:/bin"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH="/opt/homebrew/bin:$PATH"
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# ALIASES
alias bash=/opt/homebrew/bin/bash
alias gaa="git add ."
alias gitp="git push"
alias ls="eza"
alias ll="eza -la --git --git-repos --icons --hyperlink --sort=name"
alias lt="eza -laT --git --git-repos --icons --hyperlink --level=3 --sort=name"
alias cd="z"
alias synas="ssh -v shawnadmin@192.168.0.152 -p 9441"
alias icat="kitten icat"
alias cat=prettybat
alias rg='batgrep --color=auto'
alias man=batman
alias watch='batwatch --color=auto'
alias diff='batdiff --color=auto'

# -------- BEGIN PLUGIN CONFIGS
## FZF CONFIG
export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_OPTS="
    --bind 'shift-up:preview-half-page-up,shift-down:preview-half-page-down'
    --color 'border:#aaaaaa,label:#cccccc'
    --color 'preview-border:#9999cc,preview-label:#ccccff'
    --color 'list-border:#669966,list-label:#99cc99'
    --color 'input-border:#996666,input-label:#ffcccc'
    --color 'header-border:#6699cc,header-label:#99ccff'
    --border --padding 1,2
    --border-label ' Search ' --input-label ' Input ' --header-label ' File Type ' --preview-label ' Preview ' --list-label ' Matches '
"

export FZF_CTRL_R_OPTS="
  --color header:italic
  --preview-window=:hidden"

export FZF_CTRL_T_OPTS="
  --height 70%
  --style full
  --walker file,dir,follow,hidden
  --walker-skip .git,node_modules,target,.DS_Store,Library,Applications,Music,Movies,Pictures,Public
  --preview 'fzf-preview.sh {}'
  --preview-window 70%
  "
# --------END PLUGIN CONFIGS

# INIT PLUGINS
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source <(fzf --zsh)
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
eval "$(zoxide init zsh)"

# INIT ZSH
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
pfetch
