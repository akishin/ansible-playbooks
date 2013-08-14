# Redmine

Redmine と、動作に必要な Ruby, MySQL, Apache + Passenger をインストール・設定するための Playbook です。  

以下の環境で確認しています。

* CentOS 6.4 x86_64
* Ansible 1.2.2

## Usage

clone 後、 hosts ファイル内に対象ホストのホスト名または IP アドレスを記述して以下のように実行します。

    $ ansible-playbook site.yml -i hosts -k

