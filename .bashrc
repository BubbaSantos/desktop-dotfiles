# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias hc='hyprctl clients'
alias al='nvim ~/.bashrc'
alias alr='source ~/.bashrc'
alias wayb='nvim /home/bubba/.config/waybar'
alias xcom='nvim /home/bubba/.XCompose'
alias hscripts='nvim ~/.config/hypr/scripts'
alias hconf='nvim ~/.config/hypr'
alias hdconf='nvim ~/.local/share/omarchy/default/hypr'
alias er='espanso restart'
alias pcc='pick-current-colors'
alias ee='espanso edit'
alias ip="ip -4 route get 1.1.1.1 | awk '{print $7; exit}'"
alias dsr='rm ~/.local/share/org.gnome.SoundRecorder/Recording*'
export PATH="$HOME/.local/bin:$PATH"

# Enable bash completion
if [ -r /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion
fi

# fzf keybindings and completion
if [ -r /usr/share/fzf/key-bindings.bash ]; then
  source /usr/share/fzf/key-bindings.bash
fi

if [ -r /usr/share/fzf/completion.bash ]; then
  source /usr/share/fzf/completion.bash
fi

eval "$(atuin init bash --disable-up-arrow)"


alias ddot='git --git-dir=$HOME/.desktop-dotfiles/ --work-tree=$HOME'
