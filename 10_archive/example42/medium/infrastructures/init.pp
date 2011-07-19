# Here fin some example Puppet infrastructures templates.

# There can be many approaches:
# - Nodes are defined in an inheritance tree (basenode -> zones -> node),
# with different custom "zones" used to group nodes according to custom logic.

# Here's defined the baseline node (note that this is a Puppet default). 
# It can be empty if wanted.
# Here we use it to define general variables: they can be overriden by
# nodes that inherit basenode 

node basenode {

# If you define  $my_project , custom $project.pp classes are autoloaded
# You can place here your changes and local customizations using the same modules base with different projects
    $my_project = "example42"
    
# Uncomment below if you want you custom project classes to in in an autonomous module 
    # $my_project_onmodule = true

# Activate Automatic monitoring
# NOTE: Setting "yes" to $monitor Example42 monitor abstraction classes are automatically enabled
# and you need to set the $monitor_tool (s) to use
    $monitor = "yes"

# Define what are the monitoring tools to use (can be an array)
# NOTE: Some of the tools (such as nagios) require storeconfigs
    $monitor_tool = [ "nagios" , "puppi" ]

# Activate Automatic firewalling
#    $firewall = "yes"
    $firewall_tool = "iptables"
    $firewall_destination = "0/0" # Default is $ip_address
# Iptables management
    $iptables_block_policy = "accept"

# Activate automatic links collection (via psick)
#    $link = yes
    $link_tool = "psick"

# Activate modules debugging (not too resource intensive and useful)
    $debug = "yes"

# Some general variables used by modules
    $puppet_server = "puppet.example42.com"
    $dns_servers = [ "10.42.42.1" , "8.8.8.8" ]
    $domain = "example42.com"
    $smtp_server = "mail.example42.com"

# Local root mail is forwarded to $root_email - CHANGE IT!
    $root_email = "roots@example42.com"

# Syslog servers. Can be an array.
    $syslog_servers = ["10.42.42.15"]

# Set proxy, if needed
    $proxy_server = "proxy.example42.com:8080"

    $timezone = "Europe/Rome"
#     $ntp_server = "ntp.example42.com"

    $update = "no"   # Auto Update packages (yes|no)

# Munin central server
    $munin_server = "10.42.42.12"
# Add extra custom plugins
    $munin_plugins = "yes"

# Collectd Central server (here we use unicast networking)
# Define the server IP (not the hostname)
    $collectd_server = "10.42.42.16"

# NRPE ACCESS
    $nrpe_allowed_hosts = "10.42.42.11,10.42.42.36"
    $nrpe_dont_blame_nrpe = "1"
    $nrpe_use_ssl = "yes"
# Nagios servers grouping logic
   # $nagios_grouplogic = "zone"

# MCollective
    $mcollective_psk = "42324bws!988!"
    $mcollective_stomp_host = "mq1.example42.com"
    $mcollective_stomp_user = "mcollective"
    $mcollective_stomp_password = "Unf0rg3tt4bl3!"

# Ldap Authentication
    $users_auth = "ldap" # By default we want ldap auth
    $users_ldap_servers = ["ldap1.example42.com","ldap2.example42.com"]
    $users_ldap_basedn = "dc=example42,dc=com"
#    $users_ldap_ssl = "yes"
#    $users_automount = "yes"

# Yum repos (for Rhel)
    $yum_extrarepo = [ "epel" , "tmz" , "puppetlabs" ] 
    $yum_update = "updatesd"

# Use puppi and activate puppi subclasses in modules
    $puppi = "yes"
}




# An example of Development / Staging / Production Infrastructure  

# CHANGE EXAMPLE VARIABLES!
# Move or redefine variables accounding to a single inheritance tree (Ex: yournode inherits prod inherits basenode)
# Here zones are generally related to different networks / host position

# Example Development / Staging / Production Infrastructure

node devel inherits basenode {
        $zone = "devel"
        $dns_servers = ["10.42.42.1","8.8.8.8"]
        $default_gateway = "10.42.42.1"

# WE WANT TO USE THE TESTING BASELINE 
    $testing = "yes"

}

node test inherits basenode {
	$network = "10.42.0.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.0.1"
        $zone = "test"
}

node prod inherits basenode {
	$network = "10.42.10.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.10.1"
        $zone = "prod"
}


# Example of a 2 layer production with management network
node management inherits basenode {
	$network = "10.42.100.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.100.1"
        $zone = "management"
}

node frontend inherits basenode {
	$network = "10.42.101.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.101.1"
	$update = "yes" # Overrides previosly defined settings
        $zone = "frontend"
}

node backend inherits basenode {
	$network = "10.42.102.0"
	$netmask = "255.255.255.0"
        $default_gateway = "10.42.102.1"
        $zone = "backend"
}

