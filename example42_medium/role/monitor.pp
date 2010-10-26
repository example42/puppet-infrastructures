class role::monitor {
    $role = "monitor"

    include general

    include nagios
    # include cacti
}

