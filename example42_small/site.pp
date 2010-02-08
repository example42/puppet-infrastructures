import "modules.pp"
import "baselines/*.pp"
import "nodes.pp"

Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }

# Filebuckets
filebucket { main: server => puppet }
filebucket { local: path => "/var/lib/puppet/clientbucket" }
