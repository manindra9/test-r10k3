Facter.add('cve_list') do
  setcode do
    Facter::Util::Resolution.exec('/bin/yum updateinfo list cves | grep CVE')
  end
end
