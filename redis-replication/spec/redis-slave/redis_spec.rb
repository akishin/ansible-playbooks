require 'spec_helper'

describe package('redis') do
  it { should be_installed }
end

describe service('redis') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(6379) do
  it { should be_listening }
end

describe iptables do
  it { should have_rule('-A INPUT -p tcp -m tcp --dport 6379 -j ACCEPT') }
end

describe file('/etc/redis.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
end

describe file('/etc/sysconfig/redis') do
  it { should be_file }
  it { should be_owned_by 'root' }
end

describe file('/etc/security/limits.d/redis.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
end

describe command('/usr/bin/redis-cli info replication') do
  it { should return_stdout /role:slave/ }
  it { should return_stdout /master_link_status:up/ }
  it { should return_stdout /slave_read_only:1/ }
  it { should return_stdout /connected_slaves:0/ }
end
