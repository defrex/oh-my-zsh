
function virtualenv {
    local e=`basename $VIRTUAL_ENV 2>/dev/null`
    [ ! -z "$e" ] && echo "env:$e "
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}${PWD/#$HOME/~}%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local venv='%{$fg[blue]%}$(virtualenv)%{$reset_color%}'

PROMPT="╔${user_host} ${venv}${current_dir}${git_branch}
╚╡"
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="★"
