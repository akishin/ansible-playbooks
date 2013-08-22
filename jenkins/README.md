# Jenkins

Jenkins をインストールするための Playbook です。  
動作環境としては以下をインストールします。  

* Apache
* java-1.7.0-openjdk

以下の環境で確認しています。

* CentOS 6.4 x86_64
* Ansible 1.2.2

## Usage

clone 後、 hosts ファイル内に対象ホストのホスト名または IP アドレスを記述して以下のように実行します。

    $ ansible-playbook site.yml -i hosts -k

