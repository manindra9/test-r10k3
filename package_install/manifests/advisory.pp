class package_install::advisory ( $advisory_names=[]) {

        $advisory_names.each |String $advisory|{

                exec {$advisory:
                        command   => "yum update --advisory ${advisory}",
                        logoutput => true,
                        path      => ['/usr/bin/', '/usr/sbin/'],
                }

        }

}

