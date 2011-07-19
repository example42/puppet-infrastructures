# 
# /etc/manifest/site.pp is the first file that, by default, the PuppetMaster
# loads if you don't use an ENC.
#
# Here you find a sample layout of a Puppet infrastructure based on the Example42 modules
# We import explicitely various manifests classes placed in /etc/manifests/
# and modules that can't be autoloaded from your modulepath ( /etc/puppet/modules )

# Example42 common module (contains defines used by other modules that can't autoload)
import "common"

# If you want to place your modules customizations in a dedicated module, import it here
# and set the $my_project variable to the same name to autoload them in Example42 modules
# Note that once you do that you need a $my_project subclass (even empty) for most of the 
# classes present in the Example42 modules, because of the autoloading feature.
# import "lab42" # (And set $my_project="lab42")

# Baseline and infrastructure layout. Customize!
import "infrastructure.pp"

# Baselines classes include modules that can be to be applied to all nodes.
import "baselines/*.pp"

# Role classes, include modules and configurations specific to a role
import "roles/*.pp"

# Nodes. Here you define your actual "real" nodes (hostnames). They can inherit the "zone" nodes defined in 
# infrastructure.pp and have obviously to be customized. You can split the nodes definitions in different files.
import "nodes/*.pp"

# General settings for standard types
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
