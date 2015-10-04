### dotfilesとansibleのセットアップファイルを持ってくる

```
git clone https://github.com/blastpartition/dotfiles ~/dotfiles
git clone https://github.com/blastpartition/mac_setup ~/mac_setup
```

### とりあえずMac App Storeで入れられるものは全部入れておく XCodeとか
#### XCodeのライセンスを通す

    sudo xcodebuild -license

#### コマンドラインツールを入れる

    xcode-select --install

#### sudoでパスワードをはしょれるようにする

    sudo visudo

    abe all={ALL} NOPASSED: ALL

#### homebrewを入れる(なかったら)

    which brew > /dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#### 動くか確認

    brew doctor

#### とりあえず更新

    brew update

#### 何はともあれansibleを仕込む

```
brew install python
brew install ansible
```

#### ansible実行

    mac_setup-playbook -i ~/mac_setup/hosts -vv ~/mac_setup/macbookpro.yml
