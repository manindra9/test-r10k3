class package_install::cve ( $cve_names=[]) {

        $cve_names.each |String $cve|{

                exec {$cve:
                        command   => "/bin/yum update --cve ${cve}",
                        logoutput => true,
                        path      => ['/usr/bin/', '/usr/sbin/'],
                }

        }

}

