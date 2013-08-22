require 'spec_helper'

describe package('java-1.7.0-openjdk') do
  it { should be_installed }
end

describe package('jenkins') do
  it { should be_installed }
end

describe file('/etc/yum.repos.d/jenkins.repo') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/etc/httpd/conf.d/jenkins.conf') do
  it { should be_file }
  it { should contain "ServerName jenkins" }
  it { should contain "ProxyPass / http://localhost:8080/" }
end
