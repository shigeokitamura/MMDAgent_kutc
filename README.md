# MMDエージェント
関西大学高槻キャンパスをMMDエージェントが案内するプロジェクトです．
8/27(土)，8/28(日)のオープンキャンパスで展示予定です．

## 使い方
### Windows
1. http://www.mmdagent.jp/
より，MMDAgent Installer (for 32-bit Windows)をダウンロードしてインストール
2. MMDAgent_kutc.mdfをMMDAgent.exeで開く

### Mac OSX
1. http://www.mmdagent.jp/
より，MMDAgent Source codeをダウンロード
2. 展開（ここでは，~/Documents/に展開します．）
3. ターミナルを開き，以下のコマンドを実行

  `cd ~/Documents/MMDAgent-1.6/`

  `make_cocoa`

  `cd Release/MMDAgent.app/Contents/MacOS/`

  `./MMDAgent ~/Documents/MMDAgent_kutc/MMDAgent_kutc.mdf`
