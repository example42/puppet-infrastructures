# Define here your nodes

# In this example for a small site just define a basenode with general settings 
# and the host nodes that inherit it

node basenode {
# Example42 approach permits to manage different projects (puppet nodes configurations) by the same puppetmaster:
# Different Puppet environments can map to different project modules.
        $project = "example42"

        $puppet_server = "puppet.example42.com"
        $dns_servers = ["10.42.42.1","10.42.10.1"]
        $domain = "example42.com"
        $smtp_server = "mail.example42.com"
        $local_network = "10.42.42.0/24"
        $default_gateway = "10.42.42.1"
        $dhcp_range = "10.42.42.100 10.42.42.199"

# Local root mail is forwarded to $root_email - CHANGE IT!
        $root_email = "roots@example42.com"

# Syslog servers. Can be an array.
        $syslog_servers = ["10.42.42.15"]

        $timezone = "Europe/Rome"
        $ntp_server = "ntp.example42.com"

        $update = "no"   # Auto Update packages (yes|no)

# Munin central server
        $munin_allow = "10.42.42.9"

# Collectd Central server (here we use unicast networking)
# Define the server IP (not the hostname)
        $collectd_server = "10.42.42.9"
}



node 'puppet.example42.com' inherits basenode {
	include general
	
	include foreman
	include apache
	include puppet::dashboard
#	include puppet::foreman
#	include puppet::foreman::externalnodes

	include ssh::auth::keymaster
}


node 'syslog.example42.com' inherits basenode {
        $rsyslog_host = "localhost"
        $rsyslog_db = "Syslog"
        $rsyslog_user = "syslog"
        $rsyslog_password = "syslogpw"

	include general

        include rsyslog::server::mysql
        include mysql
        include apache::php
        php::module { mysql: }
        php::module { gd: }
        mysql::grant { rsyslog:
                mysql_db         => $rsyslog_db,
                mysql_user       => $rsyslog_user,
                mysql_password   => $rsyslog_password,
        }

        netinstall { phplogcon:
                source_path      => "http://download.adiscon.com/phplogcon/",
                source_filename  => "phplogcon-2.7.2.tar.gz",
                destination_dir  => "/var/www/html",
        }
}


node 'monitor.example42.com' inherits basenode {
	include general

	include monitor::server
}


node 'backup.example42.com' inherits basenode {
	include general

	include backup::server
}


node 'cobbler.example42.com' inherits basenode {
        $cobbler_server = "10.42.10.10"
        $tftp_server = "10.42.10.10"

        include general
	
# Cobbler with some configuration settings. Review before using
        include cobbler::example42

# Vanilla Cobbler installation
#       include cobbler

        include tftp
##      include dhcpd::example42
#       include yumreposerver
}


# Cacti Monitoring Server
node 'cacti.example42.com' inherits basenode {
        $cacti_mysqluser = "cactiuser"
        $cacti_mysqlpassword = "example42"
        $cacti_mysqlhost = "localhost"
        $cacti_mysqldbname = "cacti"
        $mysql_passwd = "example42"

        include general
        include cacti
        include mysql
}



## TESTING HOSTS (Used for modules testing)

node 'test.example42.com' inherits basenode {
	include general

	include backup::server
	include monitor::server
}

node 'debiantest.example42.com' inherits basenode {
	include general
}

node 'opensusetest.example42.com' inherits basenode {
	include general
}

node 'solaristest.example42.com' inherits basenode {
	include minimal
#	include general
}




## PRODUCTION -  Internet Services


# Postfix+Mailscanner+Mailwatch Mail Server
node 'mail.example42.com' inherits basenode {
        $postfix_mysqluser = "postfix"
        $postfix_mysqlpassword = "example42"
        $postfix_mysqlhost = "127.0.0.1"
        $postfix_mysqldbname = "postfix"
        $postfix_mynetworks = $network/$netmask

        $mailwatch_mysqluser = "mailwatch"
        $mailwatch_mysqlpassword = "exampl42"
        $mailwatch_mysqlhost = "127.0.0.1"
        $mailwatch_mysqldbname = "mailscanner"

        $mysql_passwd = "example42"

        include general
        include mysql::example42
        include dovecot::example42
        include clamav::epel
        include spamassassin
        # include mailscanner::example42
        # include mailscanner::postfix::mailwatch
        include postfix::example42
        include squirrelmail

}


# Generic Httpd server
node 'www.example42.man' inherits basenode {
        include general
	include apache
}


# Samba PDC - Ldap backend 
node 'dc.example42.com' inherits basenode {
        $ldap_master = "127.0.0.1"
        $ldap_slave  = "127.0.0.1"
        $ldap_basedn = "dc=example42,dc=com"
        $ldap_rootdn = "cn=Manager,dc=example42,dc=com"
        $ldap_rootpw = "{SSHA}example42tosha"
        $ldap_rootpwclear = "example42"
        $samba_sid        = "S-1-5-21-3645972101-772173552-949487278"
        $samba_workgroup  = "EXAMPLE42"
        $samba_pdc        = "dc.example42.com"
        $mysql_passwd     = "example42"

        include general

        include samba::ldap
}

node 'gw.example42.com' inherits basenode {
        $role = "gateway"
#       $ipforward = "yes"
        $ntop_password = "CHANGE:Password"
        augeasconfig { sysctl:
                file      => "/etc/sysctl.conf",
                parameter => "net.ipv4.ip_forward",
                value     => "1",
                lens      => "@Sysctl",
        }

        include general
        include apache
        include squid::transparent
        include ntop
        include sarg
}

node 'vpn.example42.com' inherits basenode {
        $role = "vpn"
        $ipforward = "yes"

        include general
        include openvpn::example42
        include rip::example42
}


