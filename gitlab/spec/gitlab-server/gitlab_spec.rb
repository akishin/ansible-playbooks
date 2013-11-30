require 'spec_helper'

describe command('/usr/bin/mysql -e "show databases" -h localhost -uroot') do
  it { should return_stdout /gitlabhq_production/ }
end

describe command('/usr/bin/mysql -e "select user from mysql.user" -h localhost -uroot') do
  it { should return_stdout /gitlab/ }
end

describe package('patch') do
  it { should be_installed }
end

describe package('libxml2-devel') do
  it { should be_installed }
end

describe package('libxslt-devel') do
  it { should be_installed }
end

describe package('libicu-devel') do
  it { should be_installed }
end

describe file('/home/git') do
  it { should be_directory }
  it { should be_owned_by 'git' }
  it { should be_grouped_into 'git' }
  it { should be_mode 750 }
end

describe file('/home/git/gitlab-shell') do
  it { should be_directory }
  it { should be_owned_by 'git' }
  it { should be_grouped_into 'git' }
  it { should be_mode 755 }
end

describe file('/home/git/gitlab') do
  it { should be_directory }
  it { should be_owned_by 'git' }
  it { should be_grouped_into 'git' }
  it { should be_mode 755 }
end

describe file('/home/git/repositories') do
  it { should be_directory }
  it { should be_owned_by 'git' }
  it { should be_grouped_into 'git' }
  it { should be_mode 2770 }
end

describe file('/home/git/gitlab/config/gitlab.yml') do
  it { should be_file }
  it { should be_owned_by 'git' }
end

describe file('/home/git/gitlab/config/database.yml') do
  it { should be_file }
  it { should be_owned_by 'git' }
end

describe file('/home/git/gitlab/tmp/pids') do
  it { should be_directory }
  it { should be_owned_by 'git' }
  it { should be_grouped_into 'git' }
end

describe package('bundler') do
  it { should be_installed.by('gem') }
end

describe file('/home/git/gitlab/vendor/bundle') do
  it { should be_directory }
end

describe file('/home/git/gitlab/Gemfile.lock') do
  it { should be_file }
end

describe file('/etc/init.d/sidekiq') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

describe service('sidekiq') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/httpd/conf.d/gitlab.conf') do
  it { should be_file }
  it { should contain "ServerName gitlab" }
  it { should contain "<Directory /home/git/gitlab/public>" }
end
