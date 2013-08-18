require 'spec_helper'

describe command('ls -l /usr/local/src/') do
  it { should return_stdout /MySQL-client/ }
  it { should return_stdout /MySQL-devel/ }
  it { should return_stdout /MySQL-server/ }
  it { should return_stdout /MySQL-shared/ }
  it { should return_stdout /MySQL-shared-compat/ }
end

describe package('MySQL-client') do
  it { should be_installed }
end

describe package('MySQL-devel') do
  it { should be_installed }
end

describe package('MySQL-server') do
  it { should be_installed }
end

describe package('MySQL-shared') do
  it { should be_installed }
end

describe package('MySQL-shared-compat') do
  it { should be_installed }
end

describe package('MySQL-python') do
  it { should be_installed }
end

describe service('mysql') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(3306) do
  it { should be_listening }
end

describe file('/root/.mysql_secret') do
  it { should_not be_file }
end

describe file('/usr/my.cnf') do
  it { should be_file }
end

describe iptables do
  it { should have_rule('-A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT') }
end
