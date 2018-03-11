class package_updates {

	$updates_subcommand = "package updates --render-as json"

  	if $::kernel != 'windows' {
    		$puppet_path       = '/opt/puppetlabs/bin/puppet'
    		$facts_d_directory = '/opt/puppetlabs/facter/facts.d'
    		$tmp_path          = '/tmp/package_updates.json'

    		$command = "${puppet_path} ${updates_subcommand} > ${tmp_path} && mv -f ${tmp_path} ${facts_d_directory}/"

    		exec { 'package_updates':
      			command  => $command,
    		}
  	} else {
    		notice('The package_updates class only supports non-Windows systems currently')
  	}
}
