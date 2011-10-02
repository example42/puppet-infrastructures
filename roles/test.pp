class role_test {
# Testing class. Used in test-* nodes
    # include cacti
     include mcollective
 #   include bind


# $samba_monitor_url_pattern = "OKK"
#    include samba
# $drupal_use_package = "false"
#   include drupal
#   include tomcat
    include openldap
    # include openvpn

    include apache

    puppi::project::dir { "openskills":
        source           => "rsync://deploy.${domain}/deploy/openskills",
        user             => "root",
        postdeploy_customcommand => "/bin/true",
        postdeploy_user          => "${apache::params::username}",
        postdeploy_priority      => "44",
        init_source      => "rsync://deploy.${domain}/init/openskills/",
        disable_services => "puppet",
        firewall_src_ip  => "10.42.10.1/30",
        deploy_root      => "${apache::params::documentroot}/openskills/",
        report_email     => "root@example42.com",
        enable           => "true",
    }

    puppi::project::maven { "test-maven":
        source           => "http://deploy.${domain}/nexus/..../",
#        init_source      => "rsync://deploy.${domain}/init/test-maven/",
        user             => "${tomcat::params::username}",
        deploy_root      => "${apache::params::documentroot}/test-maven/",
        firewall_src_ip  => "10.42.10.1/30",
        report_email     => "root@example42.com",
        enable           => "true",
    }

    puppi::project::tar { "test-tar":
        source           => "http://deploy.${domain}/deploy/test-tar/release.tgz",
        init_source      => "rsync://deploy.${domain}/init/test-tar/",
        user             => "${apache::params::username}",
        deploy_root      => "${apache::params::documentroot}/test-tar/",
        firewall_src_ip  => "10.42.10.1/30",
        report_email     => "root@example42.com",
        enable           => "true",
    }

}
