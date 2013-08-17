require 'spec_helper'

describe package('gcc') do
  it { should be_installed }
end

describe package('make') do
  it { should be_installed }
end

describe package('openssl-devel') do
  it { should be_installed }
end

describe package('zlib-devel') do
  it { should be_installed }
end

describe package('gettext') do
  it { should be_installed }
end

describe package('perl-ExtUtils-MakeMaker') do
  it { should be_installed }
end

describe package('paco') do
  it { should be_installed }
end

describe command('paco -a') do
  it { should return_stdout /git-1\.8\./ }
end

describe file('/usr/bin/git') do
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
end
