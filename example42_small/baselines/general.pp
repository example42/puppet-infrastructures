class general {

# This general class imports all minimal settings.
# You may decide to define different "general" classes and define here site-wide logic
        include minimal

# Iptables settings.
# Some example alternatives
#       include iptables
        include iptables::disable
#       include iptables::enable


# Sysctl management. Define "$my_ipforward = yes" for activating IP forwarding
        include sysctl

# SNMP Daemon - Default settings
#	include snmpd

# NTP Daemon - Default settings (generally syncs with Internet NTP servers)
#	include ntp

# Define you local timezone. Needs $timezone
	include timezone

# Installs crond and crontabs. Generally not necessary (they are installed by default), but can be required by other modules
       include cron

# Syslog Logging to a Central server
# Needs:  $syslog_server
       include syslog::central 

# Forwards root's mail to $root_mail (change the default value!)
       include rootmail

# Installs Func. Needs configuration 
#       include func

# Installs Aide with distro/os default settings
#       include aide

# Installs Psad with distro/os default settings
#       include psad

# Installs rsyncd (via xinetd). Customize it!
#       include rsync

# Installs logrotate
       include logrotate


# Includes of a general testing baseline
# Used for... testing. Should be uncommented, generally
	include testing

}

