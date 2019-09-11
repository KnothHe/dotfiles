# left prompt
PROMPT='${directory} '

# current directory
directory="%{$fg[magenta]%}[%c]%{$reset_color%}"

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})[%*]%{$reset_color%}"
time_disabled="%{$fg[green]%}[%*]%{$reset_color%}"
time=$time_enabled

RPROMPT='$(mnml_git) ${time}'

# mnml_git, copyed from minimal.zsh.theme
MNML_OK_COLOR="${MNML_OK_COLOR:-2}"
MNML_ERR_COLOR="${MNML_ERR_COLOR:-1}"

function mnml_git {
    local statc="%{\e[0;3${MNML_OK_COLOR}m%}" # assume clean
    local bname="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"

    if [ -n "$bname" ]; then
        if [ -n "$(git status --porcelain 2> /dev/null)" ]; then
            statc="%{\e[0;3${MNML_ERR_COLOR}m%}"
        fi
        printf '%b' "$statc$bname%{\e[0m%}"
    fi
}
