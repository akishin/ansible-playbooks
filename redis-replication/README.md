# Redis Replication

Redis のレプリケーション環境を構築するための Playbook です。  
以下がインストールされます。  

* Redis 2.6(Remi リポジトリ)

以下の環境で確認しています。

* CentOS 6.4 x86_64
* Ansible 1.2.2

## Usage

clone 後、 hosts ファイル内に対象ホストのホスト名または IP アドレスを記述して以下のように実行します。

    $ ansible-playbook site.yml -i hosts -k

