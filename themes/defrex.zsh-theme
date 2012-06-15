
function virtualenv {
    local e=`basename $VIRTUAL_ENV 2>/dev/null`
    [ ! -z "$e" ] && echo "env:$e "
}

function root { [ "`whoami`" = "root" ] && echo "╔══root" }
function root_bottom { [ "`whoami`" = "root" ] && echo "╚╡" }
function user { [ "`whoami`" != "root" ] && echo "╔══`whoami`" }
function user_bottom { [ "`whoami`" != "root" ] && echo "╚╡" }

local user_host='%{$fg[red]%}$(root)%{$reset_color%}$(user)'
local current_dir='%{$terminfo[bold]%}${PWD/#$HOME/~}%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local venv='%{$fg[blue]%}$(virtualenv)%{$reset_color%}'

PROMPT="${user_host} ${venv}${current_dir}${git_branch}
%{$fg[red]%}$(root_bottom)%{$reset_color%}$(user_bottom)"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="★"
