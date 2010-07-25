# Oracle Prerequisites setup
# Example42 toaster

# General setups
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
import "common"

# Toaster components
# Choose the Oracle setup you want (only one!)

# Setup of the prerequisites for Oracle Database. Choose the version you need
include oracle

#include oracle::db::11g
#include oracle::db::10g
#include oracle::db::9i

# Setup of the prerequisites for Oracle Grid. Choose the version you need
#include oracle::grid::11g
#include oracle::grid::10g
#include oracle::grid::9i

# Setup of the prerequisites for Oracle RAC. Choose the version you need
#include oracle::rac::11g
#include oracle::rac::10g
#include oracle::rac::9i
