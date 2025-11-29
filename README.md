# gitのブランチ戦略と，それに関する自動化など

## ブランチ
- `master` : 全ての根源のブランチ．
- `feat/*_#{Issue番号}` : 機能追加用のブランチ．masterから分岐．masterへマージ．
- `bugfix/*_#{Issue番号}` : バグ修正用のブランチ．masterから分岐．masterへマージ．
- `misc/*_#{Issue番号}` : その他のブランチ．masterから分岐．masterへマージ．

Issue番号の扱いについて，例えば #50 に関するブランチは `misc/branch_strategy_#50` などとする．

## コミットメッセージへのIssue番号の記載

GitHub上では，コミットメッセージ上に `#{Issue番号}` を記載することで，Issueとコミットを紐付けることができる．

例: [このコメントの直後のcommit](https://github.com/microsoft/vscode/issues/249117#issuecomment-2890070097) など

本リポジトリでは，gitのhookを用いて，ブランチの末尾の `_#{Issue番号}` をコミットメッセージに自動で追加するようにしている．

その設定のために，**リポジトリのclone時 または hooksが更新された時（この場合は更新者が連絡すること）に `automation/setup_hooks.sh` を実行する必要がある**（このリポジトリ内であればどこで実行してもOK．例: `automation/` にて `$ bash setup_hooks.sh` として実行 ）．
このスクリプトは，カスタムhookへのシンボリックリンクを `.git/hooks` から貼ることで実現している．
すでにカスタムhookが存在する場合は，ファイル名末尾に `_bkup` をつけて別名でバックアップを作成した上で**上書きされる**ので注意．
