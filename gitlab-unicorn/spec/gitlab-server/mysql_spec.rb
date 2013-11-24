require 'spec_helper'

describe package('mysql-server') do
  it { should be_installed }
end

describe package('mysql-devel') do
  it { should be_installed }
end

describe package('MySQL-python') do
  it { should be_installed }
end

describe service('mysqld') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(3306) do
  it { should be_listening }
end

describe file('/etc/my.cnf') do
  it { should be_file }
end
