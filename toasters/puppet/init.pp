# Puppet Master setup
# Example42 toaster

# General setups
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
import "common"

# The name of the puppet master
# Note: For the toaster setup of the same PuppetMaster you can leave its $fqdn fact BUT 
# remember to define it with the Puppet Masters' actual fqdn in your Puppet configurations for the clients
$puppet_server = "$fqdn" 

# Email address for root's mail forwading
$root_email = "root"
# SMTP server to use 
$smtp_server = "localhost"

# Access lists for Puppetmaster access (can be an array)
$puppet_allow = ["*.example42.com",  "10.42.42.0" ]

# Toaster components
# Choose the Puppet Master setup you want (only one!)

# Define if you want to use a node tool (with or without external nodes support)
# Possible values are "foreman" or "dashboard". Default is no tool.
$puppet_nodetool = "dashboard"

# Define if you want to enable external nodes support (you define nodes via the tools' web interface and not in Puppet language)
# Note that if you enable external nodes support you MUST define a $puppet_nodetool
$external_nodes = "no"

include puppet::master

