PROMPT='%{$fg[magenta]%}[%c] %{$reset_color%}'

RPROMPT='${time}'

# RPROMPT='$(_vi_status)%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

## just copy frome avit.zsh-theme
#function _vi_status() {
#  if {echo $fpath | grep -q "plugins/vi-mode"}; then
#    echo "$(vi_mode_prompt_info)"
#  fi
#}

