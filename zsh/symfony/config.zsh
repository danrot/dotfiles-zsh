# Adapted from code found at <https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/symfony2/symfony2.plugin.zsh>

_symfony2_get_command_list () {
	php app/console --no-ansi | sed "1,/Available commands/d" | awk '/^  ?[a-z]+/ { print $1 }'
}

_symfony2 () {
  if [ -f app/console ]; then
    compadd `_symfony2_get_command_list`
  fi
}

compdef _symfony2 app/console
compdef _symfony2 sf

