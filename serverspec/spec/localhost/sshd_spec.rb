require 'spec_helper'

# openssh-serverがインストールされていること
describe package('openssh-server') do
  it { should be_installed }
end

# openssh-clientsがインストールされていること
describe package('openssh-clients') do
  it { should be_installed }
end

#sshdサービスが起動していること
describe service('sshd') do
  it { should be_enabled   }
  it { should be_running   }
end
