# -*- mode: sh; sh-shell: bash -*-
# vim:ft=sh:

# /bin/echo -e '\033[1;32mIn .zsh/interactive.d/90-atuin.zsh\033[0m'

eval "$(atuin init zsh)"

atuin_incognito () {
    if [[ $1 = disable ]] || [[ $1 == d ]]
    then
        add-zsh-hook precmd _atuin_precmd
        add-zsh-hook preexec _atuin_preexec
    else
        add-zsh-hook -d precmd _atuin_precmd
        add-zsh-hook -d preexec _atuin_preexec
    fi
}
