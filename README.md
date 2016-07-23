### sudoでパスワードをはしょれるようにする

    sudo visudo

    USER_NAME ALL=(ALL) NOPASSED: ALL

### とりあえずMac App Storeで入れられるものは全部入れておく XCodeとか
#### XCodeのライセンスを通す

    sudo xcodebuild -license

#### コマンドラインツールを入れる

    xcode-select --install

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

#### dotfilesとansibleのセットアップファイルを持ってくる

```
git clone https://github.com/kaave/dotfiles ~/dotfiles
git clone https://github.com/kaave/mac_setup ~/mac_setup
```

#### ansible実行

    ansible-playbook -i ~/mac_setup/hosts -vv ~/mac_setup/macbookpro.yml

#### 終了後

- atom
  - `apm`インストール
  - `apm install --stars`
  - Syncronize settings > いろいろ

- visual-studio-code
  - install `Visual Studio Code Settings Sync`
  - コマンドラインから起動可能に
