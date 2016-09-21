### through input pass on sudo

```bash
sudo visudo

# add
USER_NAME ALL=(ALL) NOPASSED: ALL
```

### kill Gatekeeper

```bash
sudo spctl --master-disable
```

### SIP guard off (Debug level only)

reboot with pressing `⌘ + r` keys, and run terminal.

```bash
csrutil enable --without debug
```

### (install Mac App Store's apps before run ansible)

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
which brew > /dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# check
brew doctor
# update
brew update
```

#### install ansible

```bash
brew install python
brew install ansible
```

#### get dotfiles and setup files

```bash
# use your dotfiles
git clone https://github.com/kaave/dotfiles ~/dotfiles
git clone https://github.com/kaave/mac_setup ~/mac_setup
```

#### run ansible

```bash
ansible-playbook -i ~/mac_setup/hosts -vv ~/mac_setup/macbookpro.yml
```

#### after ansible

- commandline
    - create key & regist GitHub: `ssh-keygen`
    - install `tpm` packages: `run tmux & prefix + I`
    - install `zplug` packages: run terminal & hit `Y`

- key settings on web service
    - GitHub
    - Bitbucket
    - Office tools

- atom
    - run atom & install `apm`
    - `apm install --stars`
    - Syncronize settings > something...
        - GistID: [7c9a416cb1934c28a453](https://gist.github.com/kaave/7c9a416cb1934c28a453)

- visual-studio-code
    - install `Visual Studio Code Settings Sync`
        - GistID: [9f4a74a7c814a9036fb1db5a5d70e04d](https://gist.github.com/kaave/9f4a74a7c814a9036fb1db5a5d70e04d)
    - use commandline tools

- install other apps
    - [SOPHOS](https://www.sophos.com/ja-jp/lp/sophos-home.aspx)
    - [Duet display](http://www.duetdisplay.com/jp/)
    - [MOTU Audio driver](http://motu.com/download)
    - [Google Chrome](https://www.google.co.jp/chrome/browser/desktop/)
    - [Google Chrome Canary](https://www.google.co.jp/chrome/browser/canary.html)
    - [Firefox](https://www.mozilla.org/ja/firefox/new/)
    - [Firefox Developer Edition](https://www.mozilla.org/ja/firefox/developer/)
    - [Safari Technology Preview](https://developer.apple.com/safari/technology-preview/)
    - [blisk](https://blisk.io/)
    - [Vivaldi](https://vivaldi.com/download/?lang=ja_JP)

- build Workspaces
    - Docker
        - `git clone https://github.com/kaave/workspace ~/workspace`
        - `cd ~/workspace`
        - `./_setup.bash`
    - Vagrant
        - `git clone https://github.com/kaave/workspace-vagrant ~/workspace`
        - `cd ~/workspace`
        - `vagrant up`

- install emulators
    - iOS
        - run Xcode and run Simulator
            - 8.4
            - 9.3
    - Android
        - 

- Windows
    - add Vagrant boxes (TODO: add on Ansible task)
        - `vagrant box add win7-ie9 http://aka.ms/vagrant-win7-ie9`
        - `vagrant box add win7-ie11 http://aka.ms/vagrant-win7-ie11`
        - `vagrant box add win10-edge modernIE/w10-edge`

- Start `Karabiner` and create private.xml link
    - `ln -sf ~/dotfiles/private.xml ~/Library/Application\ Support/Karabiner/private.xml`

