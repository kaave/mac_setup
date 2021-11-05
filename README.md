# macOS setup manual for me

## before ansible

### install Mac App Store's apps before run ansible

🍎

### recover keys from backup

🔑

#### ...or generate and set to GitHub

```bash
ssh-keygen -t ed21159 -C 'junkjunctions@gmail.com'
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

#### authorize XCode

```bash
sudo xcodebuild -license
```

#### install xcode commandline tools

```bash
xcode-select --install
```

### SIP guard off (Debug level only)

reboot with pressing power switch, and run terminal.

```bash
csrutil enable --without debug
# memo https://gist.github.com/darwin/8e9192f0f2996b0f77c103e6bade1d9f
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

- manual install packages: homebrew --cask
  - parallels-desktop
  - libreoffice
  - ableton-live-suite
  - ilok-license-manager
  - microsoft-office
  - virtualbox

- install other apps
  - [HHKB Driver](http://www.pfu.fujitsu.com/hhkeyboard/macdownload.html)
  - [RME Driver](https://synthax.jp/drivers-fireface-mac.html)
  - [WebKit Nightly](https://webkit.org/downloads/)

- commandline
  - install `tpm` packages: `run tmux & prefix + I`

- Windows
  - add [virtual machines](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)
