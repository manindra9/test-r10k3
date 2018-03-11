Facter.add('subscription_status') do
  setcode do
    Facter::Util::Resolution.exec("/sbin/subscription-manager status | awk -F : 'NR==4 {print $2}'")
  end
end

