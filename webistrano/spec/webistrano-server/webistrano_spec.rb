require 'spec_helper'

describe command('/usr/bin/mysql -e "show databases" -h localhost -uroot') do
  it { should return_stdout /webistrano/ }
end

describe command('/usr/bin/mysql -e "select user from mysql.user" -h localhost -uroot') do
  it { should return_stdout /webistrano/ }
end

describe package('git') do
  it { should be_installed }
end

describe package('sqlite-devel') do
  it { should be_installed }
end

describe file('/var/apps/webistrano') do
  it { should be_directory }
  it { should be_owned_by 'apache' }
  it { should be_grouped_into 'apache' }
end

describe command('cd /var/apps/webistrano; /usr/bin/git branch') do
  it { should return_stdout /rails3/ }
end

describe file('/var/apps/webistrano/Gemfile') do
  it { should be_file }
end

describe file('/var/apps/webistrano/config/webistrano_config.rb') do
  it { should be_file }
end

describe file('/var/apps/webistrano/config/database.yml') do
  it { should be_file }
end

describe package('bundler') do
  it { should be_installed.by('gem') }
end

describe file('/var/apps/webistrano/vendor/bundle') do
  it { should be_directory }
end

describe file('/var/apps/webistrano/Gemfile.lock') do
  it { should be_file }
end

describe file('/etc/httpd/conf.d/webistrano.conf') do
  it { should be_file }
  it { should contain "ServerName webistrano" }
  it { should contain "<Directory /var/apps/webistrano/public>" }
end
