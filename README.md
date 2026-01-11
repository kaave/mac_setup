# macOS setup manual for me

## SIP guard off (Debug level only)

reboot with pressing power switch, and run terminal.

```bash
csrutil enable --without debug
# memo https://gist.github.com/darwin/8e9192f0f2996b0f77c103e6bade1d9f
```

## install Mac App Store's apps

🍎

## through input pass on sudo

```bash
sudo visudo

# add
[USER_NAME] ALL = (ALL) NOPASSWD: ALL
```

## authorize XCode

```bash
sudo xcodebuild -license
```

## get dotfiles and setup files

```bash
git clone git@github.com:kaave/mac_setup.git ~/mac_setup
```

## after ansible

- some hobby packages:
  - ableton-live-suite@11
  - ilok-license-manager
  - microsoft-office
  - libreoffice
  - swinsian

- install other apps:
  - [Parallels Desktop](https://my.parallels.com/dashboard)
  - [HHKB Driver](http://www.pfu.fujitsu.com/hhkeyboard/macdownload.html)
  - [RME Babyface Pro FS Driver](https://rme-audio.jp/?s=download&search_type=download&product_id=748)
  - [cooViewer](https://coo-ona.github.io/cooViewer/)
  - [Morisawa Desktop Manager](https://morisawafonts.com/mypage/dm/)

- command line:
  - install `tpm` packages: `run tmux & prefix + I`
