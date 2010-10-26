import "modules.pp"
import "baselines/*.pp"
import "infrastructures/*.pp"
import "role/*.pp"
import "nodes/*.pp"

# General settings for standard types
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
