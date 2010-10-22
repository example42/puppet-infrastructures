# General baseline used for testing modules on different nodes

class testing {

############################################################################
# General modules  Testing
############################################################################

        include sysctl
	include snmpd
	include ntp
	include timezone
	include cron
	include syslog::central
	include rootmail
#	include func
#	include aide
#	include psad
	include rsync
	include logrotate



############################################################################
# Backup wrapper Testing
############################################################################

	include ssh::auth
	include backup::target
        backup {
                "backup_${fqdn}_etc":
                frequency  => "daily",
                path      => "/etc",
                host      => $fqdn,
        }

        backup {
                "backup_${fqdn}_var_log":
                frequency => "hourly",
                path      => "/var/log",
                host      => $fqdn,
        }

############################################################################
# Monitor wrapper Testing
############################################################################

	include monitor::target


############################################################################
# Apache Testing
############################################################################
#	include apache::php
#	php::module { "mysql": }
#	php::module { "gd": }
#	php::module { "mbstring": }

#	apache::conf 	{ "KeepAlive":	value => "On" }
#	apache::dotconf { "welcome":	source => "puppet://$servername/apache/welcome.conf" }
#	apache::virtualhost    { "www.example42.com": }



}
