# Here's defined the baseline node (note that this is a Puppet default). 
# It can be empty if wanted.
# Here we use it to define general variables: they can be overriden by
# nodes that inherit basenode 

node basenode {

# If you define  $my_project , custom $project.pp classes are autoloaded
# You can place here your changes and local customizations using the same modules base with different projects
    $my_project = "example42"
    
# Uncomment below if you want you custom project classes to in in an autonomous module 
    # $my_project_onmodule = true

# Activate Automatic monitoring
# NOTE: Setting "yes" to $monitor Example42 monitor abstraction classes are automatically enabled
# and you need to set the $monitor_tool (s) to use
    $monitor = "yes"

# Define what are the monitoring tools to use (can be an array)
# NOTE: Some of the tools (such as nagios) require storeconfigs
    $monitor_tool = [ "nagios" , "monit" ]

# Activate modules debugging (not too resource intensive and useful)
    $debug = "yes"

# Some general variables used by modules
    $puppet_server = "puppet.example42.com"
    $dns_servers = ["10.42.42.1","10.42.10.1"]
    $domain = "example42.com"
    $smtp_server = "mail.example42.com"

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

