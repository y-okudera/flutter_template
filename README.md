# flutter_template

A Flutter template project.

## Getting Started

### FVMをインストールする
- HomebrewでFVMをインストールする

```
$ brew tap leoafarias/fvm
$ brew install fvm
```

- PATHを通す

~/.zshrcなどに追記する
```
export PATH="$PATH:$HOME/.pub-cache/bin"

```

### アプリアイコンを設定する

- assets/images/launcher_iconにFlavor毎の画像を用意する
  - icon-staging.png
  - icon-production.png

- 以下を実行する
```
$ fvm flutter pub run flutter_launcher_icons:main
```
