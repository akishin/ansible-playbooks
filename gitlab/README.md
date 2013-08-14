# GitLab

GitLab 5.4 を Ruby 2.0, MySQL, Apache + Passenger でインストール・動作させる Playbook です。  

以下の環境で確認しています。

* CentOS 6.4 x86_64
* Ansible 1.2.2

## Usage

clone 後、 hosts ファイル内に対象ホストのホスト名または IP アドレスを記述して以下のように実行します。

    $ ansible-playbook site.yml -i hosts -k

