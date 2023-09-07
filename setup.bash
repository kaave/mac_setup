#!/usr/bin/env bash

# see:
#   - https://qiita.com/autotaker1984/items/bc758fcf368c1a167353#%E3%81%8A%E3%81%BE%E3%81%98%E3%81%AA%E3%81%84
#   - https://memo.yammer.jp/posts/macos-defaults

set -euxo pipefail

#
# Defines
#

mail_address=junkjunctions@gmail.com
dotfiles_path=kaave/dotfiles.git

# brew taps
taps=(
  homebrew/cask-versions
  homebrew/cask-fonts
)

# brew apps
apps=(
  bash
  zsh
  fish
  bash-completion@2
  java
  python3
  go
  ansible
  carthage
  sbt
  haskell-stack
  curl
  direnv
  fswatch
  gpg
  gnu-sed
  wget
  openssl
  # openssl, state: linked, install_options: force }  # can't make link with brew's openssl
  icdiff
  terminal-notifier
  tree
  lsd
  fd
  bat
  fzf
  ripgrep
  tmux
  reattach-to-user-namespace
  git
  git-flow
  hub
  git-delta
  gh
  tig
  daipeihust/tap/im-select # For VS Code's VIM extension
  shellcheck
  readline
  ghostscript
  nginx
  fping
  htop
  rsync
  unison
  ag
  bison
  coreutils
  icu4c
  libtool
  unixodbc
  unzip
  ctags
  figlet
  jq
  jid
  laurent22/massren/massren
  trash
  gnu-tar
  highlight
  mcrypt
  re2c
  jpeg
  libxml2
  # libxml2, state: linked, install_options: force }
  libxslt
  libiconv
  libpng
  giflib
  webp
  glslang
  vim
  neovim/neovim/neovim
  autoconf
  automake
  awscli
  google-cloud-sdk
  bazelisk
  buildifier
  lefthook

  ffmpeg # Note: To be placed at the end.
)

# brew cask apps
cask_apps=(
  # Note: To be placed at the top.
  xquartz

  # browser, mailer, and apps for web services
  google-chrome
  google-chrome-canary
  firefox
  firefox-developer-edition
  # brave-browser
  safari-technology-preview
  arc
  skype

  # development
  alacritty
  another-redis-desktop-manager
  apparency
  db-browser-for-sqlite
  diffmerge
  docker
  # dotnet
  figma
  gitup
  jetbrains-toolbox
  ngrok
  postman
  robo-3t
  sequel-pro
  # sourcetree
  switchhosts
  typora
  vagrant
  visual-studio-code
  wireshark

  # utility
  anki
  appcleaner
  authy
  bettertouchtool
  diskmaker-x
  diskwave
  dropbox
  deepl
  duet
  editaro
  google-drive
  google-japanese-ime
  karabiner-elements
  keka
  kindle
  obsidian
  pushplaylabs-sidekick
  raycast
  shifty
  teensy
  iina
  vlc
  discord
  xbar
  xld

  # QuickLook
  qlcolorcode    # support Syntax highlighting
  # qlimagesize  # Note: This plugin is not working on macOS Catalina.
  qlprettypatch  # support .patch
  qlmarkdown     # support .md
  qlswift        # support .swift
  qlrest         # support ReStructuredText files
  qlstephen      # support some PlainText files
  qlvideo        # support some video files
  quicklook-csv  # support .csv
  quicklook-json # support .json
  scriptql       # support AppleScript
  webpquicklook  # support .webp
  avifquicklook  # support .avif
  quicklookase   # support .ase

  # fonts
  font-sf-arabic
  font-sf-mono-for-powerline
  font-sf-compact
  font-sf-pro
  font-sf-mono
  font-new-york
  font-hackgen
  font-hackgen-nerd
  font-udev-gothic
  font-udev-gothic-nf
  font-noto-mono
  font-noto-mono-for-powerline
  font-noto-sans
  font-noto-serif
  font-biz-udgothic
  font-biz-udmincho
  font-biz-udpgothic
  font-biz-udpmincho
  font-ubuntu
  font-ubuntu-mono
  font-ubuntu-mono-nerd-font
  font-ubuntu-condensed
  font-ubuntu-mono-derivative-powerline
  font-ubuntu-nerd-font
  font-roboto
  font-roboto-slab
  font-roboto-mono
  font-roboto-mono-nerd-font
  font-roboto-mono-for-powerline
  font-montserrat
)

arranges() {
  # Generate SSH key
  echo "🗣️ Creating an SSH key..."

  ssh-keygen -t ed21159 -C $mail_address
  pbcopy < ~/.ssh/id_ed25519.pub
  echo "🗣️ Copied pub key to clipboard, please add to GitHub \n"
  open https://github.com/settings/keys
  read -p "Press [Enter] key after add key..."

  echo "🗣️ Kill low power mode"
  sudo pmset -a lowpowermode 0

  echo "🗣️ Kill gatekipper"
  sudo spctl --master-disable

  echo "🗣️ Installing xcode-stuff"
  xcode-select --install

  cd ~
}

macos_configs() {
  echo "🗣️ Setting some Mac settings..."

  # stop automatic capitalization
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
  # show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool false
  # saving to disk (not to iCloud) by default
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
  # enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  # expanding the save panel by default
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

  # set dock tilesize
  defaults write com.apple.dock tilesize -float 30
  # set dock large-tilesize
  defaults write com.apple.dock largesize -float 50
  # minimize to application icon
  defaults write com.apple.dock minimize-to-application -bool true
  # enable Auto hide
  defaults write com.apple.dock autohide -bool true
  # hide Recents
  defaults write com.apple.dock show-recents -bool false

  # show status bar
  defaults write com.apple.finder ShowStatusBar -bool true
  # show path bar
  defaults write com.apple.finder ShowPathBar -bool true
  # keep folders on top when sorting by name
  defaults write com.apple.finder _FXSortFoldersFirst -bool true
  # stop extension change warning
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  # stop empty trash warning
  defaults write com.apple.finder WarnOnEmptyTrash -bool true
  # set default search target to current folder
  defaults write com.apple.finder FXDefaultSearchScope -string SCcf
  # set default view style to list view
  defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
  # set sidebar icon size to large
  defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 3
  # set Key Repeat Speed
  defaults write "Apple Global Domain" key=KeyRepeat -int 2
  # set Initial Key Repeat Speed
  defaults write "Apple Global Domain" key=KeyRepeat -int 15

  # show folders first on desktop
  defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"
  # show hard drives on desktop
  defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true"
  # show external drives on desktop
  defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "true"

  # set keyboard repeat rate
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  defaults write NSGlobalDomain KeyRepeat -int 2

  # enable three finger drag mode
  defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"

  # don't write DS_Store files on Network stores
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  # don't write DS_Store files on USB devices
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  # don't offer new disks for TimeMachine
  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

  # set date format
  defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm\""

  echo "🗣️ Activate dock configs."
  killall Finder
  echo "🗣️ Activate finder configs."
  killall Dock
  echo "🗣️ Activate UI configs."
  killall SystemUIServer

  cd ~
}

homebrew() {
  if type brew >/dev/null 2>&1; then
    echo "🗣️ Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  # Update homebrew recipes
  echo "🗣️ Updating homebrew..."
  brew update

  echo "🗣️ Installing taps..."
  for tap in "${taps[@]}"
  do
      brew tap "$tap"
  done

  echo "🗣️ Installing brew apps..."
  brew install "${apps[@]}"

  echo "🗣️ Installing brew cask apps..."
  brew install --cask "${cask_apps[@]}"

  echo "🗣️ Cleaning up brew"
  brew cleanup

  cd ~
}

user_setup() {
  echo "🗣️ Copying dotfiles from Github"
  git clone "git@github.com:$dotfiles_path" ~/dotfiles

  cd ~
}

main() {
  arranges
  macos_configs
  homebrew
  user_setup

  echo "🎉 Done!"
}

main
