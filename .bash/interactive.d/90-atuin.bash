# -*- mode: sh; sh-shell: bash -*-
# vim:ft=sh:

# /bin/echo -e '\033[1;32mIn .bash/interactive.d/90-atuin.bash\033[0m'

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

eval "$(atuin init bash)"

atuin_incognito () {
  if [[ $1 = disable ]] || [[ $1 == d ]]
  then
    # disable incognito
    if [[ -n "${BLE_VERSION-}" ]]; then
      echo "no idea what ble is (no incognito mode available here)"
    else
      precmd_functions+=(_atuin_precmd)
      preexec_functions+=(_atuin_preexec)
    fi
  else
    # enable incognito
    if [[ -n "${BLE_VERSION-}" ]]; then
      echo "no idea what ble is (no incognito mode available here)"
    else
      precmd_functions=("${precmd_functions[@]/_atuin_precmd}")
      preexec_functions=("${preexec_functions[@]/_atuin_preexec}")
    fi
  fi
}
