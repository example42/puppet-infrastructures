class general {
# You may decide to define different "general" classes and define here site-wide logic

# This general class imports all minimal settings.
    include minimal

# GENERAL SYSTEM STUFF
# Check module/README for module's variables 
    include users
    include rsyslog
    include logrotate
    include cron
    include timezone
#    include ntp
    include iptables::disable
    include sysctl
    include rootmail

# MONITORING
#    include snmpd
#    include monit
    include munin
    include nrpe

# EXTRA STUFF
#    include func

#    include aide
#    include psad
#    include rsync

# ROLE SPECIFIC CLASSES ARE INCLUDED HERE
   if ( $role ) { include "role_$role" }
}
