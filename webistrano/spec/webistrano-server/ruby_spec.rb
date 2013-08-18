require 'spec_helper'

describe package('ruby') do
  it { should_not be_installed }
end

describe package('ruby-libs') do
  it { should_not be_installed }
end

describe package('gcc') do
  it { should be_installed }
end

describe package('make') do
  it { should be_installed }
end

describe package('zlib-devel') do
  it { should be_installed }
end

describe package('openssl-devel') do
  it { should be_installed }
end

describe package('readline-devel') do
  it { should be_installed }
end

describe package('ncurses-devel') do
  it { should be_installed }
end

describe package('gdbm-devel') do
  it { should be_installed }
end

describe package('db4-devel') do
  it { should be_installed }
end

describe package('tk-devel') do
  it { should be_installed }
end

describe package('libyaml') do
  it { should be_installed }
end

describe package('libyaml-devel') do
  it { should be_installed }
end

describe package('paco') do
  it { should be_installed }
end

describe command('paco -a') do
  it { should return_stdout /ruby-2\.0\.0/ }
end

describe file('/usr/bin/ruby') do
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
end

describe file('/usr/bin/gem') do
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
end
