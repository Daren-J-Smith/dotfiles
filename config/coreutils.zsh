# Colorize common tools with grc
if (( $+commands[grc] )) && (( $+commands[brew] )); then
  # grc 1.13 (latest release) calls os.fork(); Python 3.14 warns about
  # forking a multi-threaded process. Hide just that warning class.
  export PYTHONWARNINGS="ignore::DeprecationWarning"
  source `brew --prefix`/etc/grc.zsh
fi

# Override ls with exa or gls, add colors
if (( $+commands[exa] )); then
  alias ls="exa -F"
  alias l="exa -la"
  alias ll="exa -l"
  alias la="exa -a"
elif (( $+commands[gls] )); then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la="gls -A --color"
else
  alias ls="ls -F"
  alias l="ls -lAh"
  alias ll="ls -l"
  alias la="ls -A"
fi

# Override cat with bat
if (( $+commands[bat] )); then
  alias cat=bat
  export BAT_STYLE=plain # only enable syntax highlighting
  export BAT_THEME="ansi"
fi
