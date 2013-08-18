require 'spec_helper'

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(80) do
  it { should be_listening }
end

describe iptables do
  it { should have_rule('-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT') }
end
