# macOS setup manual for me

## before ansible

### install Mac App Store's apps before run ansible

🍎

### recover keys from backup

🔑

#### ...or generate and set to GitHub

```bash
ssh-keygen -b 4096 -t rsa -C 'junkjunctions@gmail.com'
# copy public key to clipboard
pbcopy < ~/.ssh/id_rsa.pub
open https://github.com/settings/keys
```

### through input pass on sudo

```bash
sudo visudo

# add
[USER_NAME] ALL=NOPASSWD: ALL
```

### kill Gatekeeper

```bash
sudo spctl --master-disable
```

### kill sleep

System configuration > Low energy

### SIP guard off (Debug level only)

reboot with pressing `⌘ + r` keys, and run terminal.

```bash
csrutil enable --without debug
# memo https://gist.github.com/darwin/8e9192f0f2996b0f77c103e6bade1d9f
```

#### authorize XCode

```bash
sudo xcodebuild -license
```

#### install xcode commandline tools

```bash
xcode-select --install
```

#### install homebrew

```bash
# install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# check
brew doctor
```

#### install python and ansible

```bash
brew install python ansible
```

#### get dotfiles and setup files

```bash
# use your dotfiles
git clone git@github.com:kaave/dotfiles.git ~/dotfiles
git clone git@github.com:kaave/mac_setup.git ~/mac_setup
```

#### run ansible

```bash
ansible-playbook -i ~/mac_setup/hosts -vv ~/mac_setup/macbookpro.yml
```

#### after ansible

- manual install homebrew cask
  - parallels-desktop
  - microsoft-office
  - virtualbox
  - libreoffice

- install other apps
  - [HHKB Driver](http://www.pfu.fujitsu.com/hhkeyboard/macdownload.html)
  - [MOTU Audio driver](http://motu.com/download)
  - [WebKit Nightly](https://webkit.org/downloads/)

- commandline
  - install `tpm` packages: `run tmux & prefix + I`

- key settings on web service
  - GitHub
  - Bitbucket
  - Office tools

- atom
  - install `sync-settings`
  - Syncronize settings > Recover
    - GistID: [7c9a416cb1934c28a453](https://gist.github.com/kaave/7c9a416cb1934c28a453)

- visual-studio-code
  - install `Settings Sync`
  - setup plugin
  - `cmd + p` > `Sync: Download`
    - GistID: [9f4a74a7c814a9036fb1db5a5d70e04d](https://gist.github.com/kaave/9f4a74a7c814a9036fb1db5a5d70e04d)

- Setup Xcode
  - CocoaPods setup: `pod setup`
  - Unsigned Xcode: `update_xcode_plugins --unsign`
  - Install Alcatraz: `curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh`
  - Install [XVim2](https://github.com/XVimProject/XVim2)
  - Add UUID to Alcatraz & XVim2: `update_xcode_plugins`

- install emulators
  - iOS
    - run Xcode and install Simulator
  - Android
    - run Androud Studio and setup Android SDK

- Windows
  - add [virtual machines](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)
