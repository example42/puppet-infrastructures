# /etc/manifest/site.pp is the first file that, by default, the PuppetMaster loads
# if no external tool is used to manage nodes.

# From here everything starts

# Example42 common module has to be explicitely imported
# (contains defines used by other modules that won't autoload)
import "common"


# The definition of nodes, what classes they include and what variables are set for them
# is done, obvisouly, accordin to custom need.
# Here are provided some example42 setups

# 1 - Example42 small site (approx. 1-20 nodes):
# You define NODES, that inherit a basenode 
# Each node can include classes or defines
# import "example42/small/site.pp"


# 2 - Example42 medium site (approx. 20-400 nodes):
# You can define ZONES (different networks, geographical sites or whatever)
# You define NODES that inherits zones
# Each node should include a ROLE
# A ROLE includes all the classes/defines necessary for a group of servers with the same functionality
import "example42/medium/site.pp"

# 3 - Only for testing (you may comment the above imports for cleaner testing)
# import example42/test/site.pp

# Baselines classes include modules that can be to be applied to all nodes.
import "baselines/*.pp"

# On a medium/big sized infrastructure it makes sense to use roles
# These are classes that include other classes and resources for a specific purpose
# You may include them in your nodes
# In the example42 nodes samples thaa use the general baseline the relevant role
# is automatically included on how you define the $role variable
import "roles/*.pp"



# General settings for standard types
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
