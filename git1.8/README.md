# Git 1.8.x

ソースコードから Git 1.8.x をビルドしてインストールする Playbook です。  
インストールは Paco 経由で行うので削除も簡単にできます。  

以下の環境で確認しています。

* CentOS 6.4 x86_64
* Ansible 1.2.2

## Usage

clone 後、 hosts ファイル内に対象ホストの IP アドレスを記述して以下のように実行します。

    $ ansible-playbook site.yml -i hosts -k

