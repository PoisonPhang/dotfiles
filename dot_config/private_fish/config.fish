if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  ufetch-arco | lolcat
end

# vi keybindings
fish_vi_key_bindings

# PATH
fish_add_path $HOME/.cargo/bin

# Exports
set -gx GPG_TTY (tty)
set -gx EDITOR nvim

# STARSHIP
starship init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/poisonphang/.ghcup/bin # ghcup-env