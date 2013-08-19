require 'spec_helper'

describe package('gcc') do
  it { should be_installed }
end

describe package('gcc-c++') do
  it { should be_installed }
end

describe package('libcurl-devel') do
  it { should be_installed }
end

describe package('openssl-devel') do
  it { should be_installed }
end

describe package('zlib-devel') do
  it { should be_installed }
end

describe package('httpd-devel') do
  it { should be_installed }
end

describe package('passenger') do
  it { should be_installed.by('gem') }
end

describe file('/etc/httpd/conf.d/passenger.conf') do
  it { should be_file }
end

describe command('/usr/sbin/apachectl -M') do
  it { should return_stdout /passenger_module/}
end
