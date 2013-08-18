require 'spec_helper'

describe command('/usr/bin/mysql -e "show databases" -h localhost -uroot') do
  it { should return_stdout /redmine/ }
end

describe command('/usr/bin/mysql -e "select user from mysql.user" -h localhost -uroot') do
  it { should return_stdout /redmine/ }
end

describe package('libxml2-devel') do
  it { should be_installed }
end

describe package('libxslt-devel') do
  it { should be_installed }
end

describe package('ImageMagick') do
  it { should be_installed }
end

describe package('ImageMagick-devel') do
  it { should be_installed }
end

describe command('ls -l /usr/local/src') do
  it { should return_stdout /redmine.*\.tar\.gz/}
end

describe file('/var/apps/redmine') do
  it { should be_directory }
  it { should be_owned_by 'apache' }
  it { should be_grouped_into 'apache' }
end

describe file('/var/apps/redmine/config/database.yml') do
  it { should be_file }
end

describe package('bundler') do
  it { should be_installed.by('gem') }
end

describe file('/var/apps/redmine/vendor/bundle') do
  it { should be_directory }
end

describe file('/var/apps/redmine/Gemfile.lock') do
  it { should be_file }
end

describe file('/etc/httpd/conf.d/redmine.conf') do
  it { should be_file }
  it { should contain "ServerName redmine" }
  it { should contain "<Directory /var/apps/redmine/public>" }
end
