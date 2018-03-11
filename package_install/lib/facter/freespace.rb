Facter.add('FreeSpace') do
  setcode do
    if Dir.exists?('/var')
      Facter::Util::Resolution.exec("df -h /var | awk '{print $4}' | sed -n 2p")
    else
      Facter::Util::Resolution.exec("df -h / | awk '{print $4}' | sed -n 2p")
    end
  end
end





