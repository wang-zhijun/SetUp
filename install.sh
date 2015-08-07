#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

brew install tmux

cat << EOF > ~/.tmux.conf
# Our .tmux.conf file

# Setting the prefix from C-b to C-a
# START:prefix
set -g prefix C-a  
# END:prefix

# Free the original Ctrl-b prefix keybinding
# START:unbind
unbind C-b 
# END:unbind

#setting the delay between prefix and command
# START:delay
set -s escape-time 1
# END:delay

# START: renumber
set-option -g renumber-windows on
# END: renumber

# Ensure that we can send Ctrl-A to other apps
# START:bind_prefix
bind C-a send-prefix
# END:bind_prefix

# Set the base index for windows to 1 instead of 0
# START:index
set -g base-index 1
# END:index

# Set the base index for panes to 1 instead of 0
# START:panes_index
setw -g pane-base-index 1
# END:panes_index

# Reload the file with Prefix r
# START:reload
bind r source-file ~/.tmux.conf \; display "Reloaded!"
# END:reload

# splitting panes
# START:panesplit
bind | split-window -h
bind - split-window -v
# END:panesplit

# moving between panes
# START:paneselect
bind h select-pane -L 
bind j select-pane -D 
bind k select-pane -U
bind l select-pane -R    
# END:paneselect

# Quick pane selection
# START:panetoggle
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+
# END:panetoggle

# Pane resizing
# START:paneresize
bind -r H resize-pane -L 5 
bind -r J resize-pane -D 5 
bind -r K resize-pane -U 5 
bind -r L resize-pane -R 5
# END:paneresize

# mouse support - set to on if you want to use the mouse
# START:mouse
setw -g mode-mouse on 
# END:mouse
set -g mouse-select-pane on
set -g mouse-resize-pane on 
set -g mouse-select-window on

# Set the default terminal mode to 256color mode
# START:termcolor
set -g default-terminal "screen-256color"
# END:termcolor

# enable activity alerts
#START:activity
setw -g monitor-activity on
set -g visual-activity on
#END:activity

# set the status line's colors
# START:statuscolor
set -g status-fg white
set -g status-bg black
# END:statuscolor

# set the color of the window list
# START:windowstatuscolor
setw -g window-status-fg cyan 
setw -g window-status-bg default 
setw -g window-status-attr dim
# END:windowstatuscolor

# set colors for the active window
# START:activewindowstatuscolor
setw -g window-status-current-fg white 
setw -g window-status-current-bg red 
setw -g window-status-current-attr bright
# END:activewindowstatuscolor

# pane colors
# START:panecolors
set -g pane-border-fg green
set -g pane-border-bg black
set -g pane-active-border-fg white
set -g pane-active-border-bg yellow
# END:panecolors

# Command / message line
# START:cmdlinecolors
set -g message-fg white
set -g message-bg black
set -g message-attr bright
# END:cmdlinecolors

# Status line left side
# START:statusleft
set -g status-left-length 40 
set -g status-left "#[fg=green]Session: #S #[fg=yellow]#I #[fg=cyan]#P"
# END:statusleft

#START:utf8
set -g status-utf8 on
#END:utf8

# Status line right side
# 15% | 28 Nov 18:15
# START: statusright
set -g status-right "#(~/battery Discharging) | #[fg=cyan]%d %b %R"
# END:statusright

# Update the status bar every sixty seconds
# START:updateinterval
set -g status-interval 60
# END:updateinterval

# Center the window list
# START:centerwindowlist
set -g status-justify centre
# END:centerwindowlist

# enable vi keys.
# START:vikeys
setw -g mode-keys vi
# END:vikeys

# shortcut for synchronize-panes toggle
# START:sync
bind C-s set-window-option synchronize-panes
# END:sync

# Maximize and restore a pane. Only needed for 1.7 and lower.
# START:max
unbind Up
bind Up new-window -d -n tmp \; swap-pane -s tmp.1 \; select-window -t tmp
# END:max

# START:restore
unbind Down
bind Down last-window \; swap-pane -s tmp.1 \; kill-window -t tmp
# END:restore

# Log output to a text file on demand
# START:pipe-pane
bind P pipe-pane -o "cat >>~/#W.log" \; display "Toggled logging to ~/#W.log"
# END:pipe-pane
EOF

## brew を制限なしで使えるようにトークンを設定
echo "export HOMEBREW_GITHUB_API_TOKEN=150c24d700f489d62f8aa9ded0269ea0c31e82c9" >> ~/.bash_profile

brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install karabiner
brew cask install sizeup
brew install s3cmd
brew install homebrew/dupes/gzip
brew install htop-osx
brew cask install slack
brew tap homebrew/versions
brew install mysql55
brew install Caskroom/cask/python3
brew install wget
brew install Caskroom/cask/virtualbox
brew install docker
brew install boot2docker
