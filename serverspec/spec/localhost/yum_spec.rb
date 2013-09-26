require 'spec_helper'

#epelのyumリポジトリの設定がされていること
describe file('/etc/yum.repos.d/epel.repo') do
  it { should be_file }
end

#epelのキーが存在すること
describe file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6') do
  it { should be_file }
end
