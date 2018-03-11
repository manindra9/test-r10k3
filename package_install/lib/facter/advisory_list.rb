Facter.add('advisory_list') do
  setcode do
    Facter::Util::Resolution.exec('/bin/yum updateinfo list | grep RHSA')
  end
end

