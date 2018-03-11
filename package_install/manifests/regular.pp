class package_install::regular ($package_list = [] , $reboot = false) {

	schedule { 'maintenance_window':
  		range     => '08:00 - 12:00',
  		weekday   => 'Tuesday',
	}	

	package { $package_list:
    		ensure    => latest,
		schedule  => 'maintenance_window',
  	}
  	if($reboot) {
    		reboot { 'after':
      			subscribe => Package[$package_list],
    		}
	}
}
