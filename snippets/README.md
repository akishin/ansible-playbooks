# Snippets

1 ファイルで動作する簡単な Playbook のサンプルです。
以下の環境で確認しています。

* CentOS 6.4 x86_64
* Ansible 1.2.2

## Usage

clone 後、 hosts ファイル内に対象のホスト名または IP アドレスを記述して以下のように実行します。

    $ ansible-playbook site.yml -i hosts -k

