#
# Class: general
#
# General baseline for all your nodes and roles
# Comment and uncomment modules as needed
# Check the README file in each module for details
# on compatibility, usage and required variables 
#
class general {

# Minimal baseline is included
    include minimal

# Manage local and ldap users
    include users # Manage local and ldap users

# Configure OpenSSH
    include openssh

# Configure rsyslog. Optional: $syslog_server  
    include rsyslog

# Basic logrotate installation
    include logrotate

# Basic cron installation
    include cron

# Basic sysctl setup. Enable Ip forwarding with $ip_forward
    include sysctl 

# Timezone setup. Set with $timezone
    include timezone 

# NTP daemon setup. Set peers with $ntp_server
    include ntp

# Set root's mail forwarding. Required: $root_email
    include rootmail

# PostFix setup. Optional $postfix_relayhost
    include postfix 

# Explicitely Disable Iptables
#    include iptables::disable # TODO Fix on Natty

# Enable Example42 automatic firewalling. Uncomment below and set $firewall=yes
#    include iptables 


# MONITORING. To enable Example42 automatic monitoring set $monitor="yes"

# Run and configure snmpd agent. 
#    include snmpd

# Install Munin. Place "munin" in $monitor_tool array to enable automunin
    include munin

# Install monit. Place "monit" in $monitor_tool array to enable automonit 
    include monit

# Installs Nagios Nrpe and Plugins. Required if you use puppi
# Required: $nrpe_allowed_hosts . May be needed: $nrpe_dont_blame_nrpe = "1"
    include nrpe

# Install mcollective server (agent for remote management by "client")
# Required: $mcollective_psk ,  $mcollective_stomp_host , $mcollective_stomp_user , $mcollective_stomp_password
    include mcollective

# Install rsync daemon
#    include rsync

# Install lsb. Required by some Example42 modules
    if ( $kernel == "Linux" ) { include "lsb" }

# If $role is set at node level, the relevant is automatically loaded
    if ( $role ) { include "role_$role" }

# INCLUDE TESTING CLASSES IF $testing="yes" 
    if ( $testing == "yes" ) { include "testing" }

}
