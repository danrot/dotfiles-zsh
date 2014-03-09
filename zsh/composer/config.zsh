# Adadpted from code found at <https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/composer/composer.plugin.zsh>

_composer_get_command_list () {
	composer --no-ansi | sed "1,/Available commands/d" | awk '/^  [a-z]+/ { print $1 }'
}

_composer_get_required_list () {
    composer show -s --no-ansi | sed '1,/requires/d' | awk 'NF > 0 && !/^requires \(dev\)/{ print $1 }'
}

_composer () {
  local curcontext="$curcontext" state line
  typeset -A opt_args
  _arguments \
    '1: :->command'\
    '*: :->args'
  if [ -f composer.json ]; then
    case $state in
      command)
        compadd `_composer_get_command_list`
        ;;
      *)
        compadd `_composer_get_required_list`
        ;;
    esac
  else
    compadd create-project init search selfupdate show
  fi
}

compdef _composer composer
