# GitLab

GitLab 6.3.0 を Nginx + Unicorn で動作するようにインストールするための Playbook です。  
動作環境として以下がインストールされます。  

* Ruby 2.0
* Git 1.8
* Redis 2.6
* MySQL
* Nginx

以下の環境で確認しています。

* CentOS 6.4 x86_64
* Ansible 1.2.2

## Usage

clone 後、 hosts ファイル内に対象ホストのホスト名または IP アドレスを記述して以下のように実行します。

    $ ansible-playbook site.yml -i hosts -k

