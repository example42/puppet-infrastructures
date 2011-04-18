class general {
# You may decide to define different "general" classes and define here site-wide logic

# This general class imports all minimal settings.
    include minimal

# GENERAL SYSTEM STUFF
# Check module/README for module's variables 
    include users
    include rsyslog
    include openssh
    include logrotate
    include cron
    include sysctl

    include openssh

# Time
    include timezone
    include ntp

# Iptables 
#    include iptables::disable
    include iptables # And (automatic) firewall for All!

# Mail
    include rootmail
    include postfix

# MONITORING
#    include snmpd
#    include monit
    include munin
    include nrpe

# EXTRA STUFF
    include mcollective
#    include func
#    include aide
#    include psad
#    include rsync

# Some Example42 modules use LSB based facts
    if ( $kernel == "Linux" ) { include "lsb" }

# ROLE SPECIFIC CLASSES ARE INCLUDED HERE
   if ( $role ) { include "role_$role" }

# INCLUDE TESTING CLASSES IF $testing="yes" 
   if ( $testing == "yes" ) { include "testing" }

}
