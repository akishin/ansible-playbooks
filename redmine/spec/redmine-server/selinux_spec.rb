require 'spec_helper'

describe file('/etc/selinux/config') do
  it { should be_file }
  it { should contain "SELINUX=disabled" }
end

describe command('/usr/sbin/getenforce') do
  it { should return_stdout /Permissive|Disabled/}
end
