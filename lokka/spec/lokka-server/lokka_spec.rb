require 'spec_helper'

describe command('/usr/bin/mysql -e "show databases" -h localhost -uroot') do
  it { should return_stdout /lokka/ }
end

describe command('/usr/bin/mysql -e "select user from mysql.user" -h localhost -uroot') do
  it { should return_stdout /lokka/ }
end

describe package('git') do
  it { should be_installed }
end

describe package('libxml2-devel') do
  it { should be_installed }
end

describe package('libxslt-devel') do
  it { should be_installed }
end

describe file('/var/apps/lokka') do
  it { should be_directory }
  it { should be_owned_by 'apache' }
  it { should be_grouped_into 'apache' }
end

describe file('/var/apps/lokka/database.default.yml') do
  it { should be_file }
end

describe package('bundler') do
  it { should be_installed.by('gem') }
end

describe file('/var/apps/lokka/vendor/bundle') do
  it { should be_directory }
end

describe file('/var/apps/lokka/Gemfile.lock') do
  it { should be_file }
end

describe file('/etc/httpd/conf.d/lokka.conf') do
  it { should be_file }
  it { should contain "ServerName lokka" }
  it { should contain "<Directory /var/apps/lokka/public>" }
end
