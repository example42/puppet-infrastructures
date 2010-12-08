# Example42 common module has to be explicitely imported
# (contains defines used by other modules that won't autoload)
import "common"

# Baselines classes include modules that have to be applied to all nodes.
import "baselines/*.pp"

# The layout of your Infrastructure may be defined here
import "infrastructures/*.pp"

# On a medium/big sized infrastructure it makes sense to provide a role for each node.
import "role/*.pp"

# Nodes definitions are here
import "nodes/*.pp"

# General settings for standard types
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
