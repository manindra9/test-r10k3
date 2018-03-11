# Class: repo_manage
# ===========================
#
# Full description of class repo_manage here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'repo_manage':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class repo_manage($enable_disable = enable, $repo_names = []) {
	
	$repo_names.each |String $repo|{
	
		if $enable_disable == enable {
			
			if !($repo in $::rhsm_enabled_repos) {
				$execrm = "${repo}${enable_disable}"
                		exec {$execrm:
                        		command   => "subscription-manager repos --${enable_disable}=${repo}",
                        		logoutput => true,
                        		path      => ['/usr/bin/', '/usr/sbin/'],
                		}

        		}
		}
	
		if $enable_disable == disable {

                        if !($repo in $::rhsm_disabled_repos) {
                                $execrm = "${repo}${enable_disable}"
                                exec {$execrm:
                                        command   => "subscription-manager repos --${enable_disable}=${repo}",
                                        logoutput => true,
                                        path      => ['/usr/bin/', '/usr/sbin/'],
                                }

                        }
                }

	}	
}
