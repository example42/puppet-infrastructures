class role_drupal {

    # $drupal_use_package = "true"
    $drupal_use_package = "false"
    $drupal_version = "7"
    # $drupal_basedir = "/var/www/html/drupal6"
    $drupal_extra = "yes"
    include drupal

    drupal::site { "example42":
        url         => "http://drupal.example42.com/example42" ,
        db_name     => "example42" ,
        db_user     => "example42" ,
        db_password => "n0np0ss0r4cc0nt4rl4!!" ,
        db_host     => "localhost" ,
        db_type     => "mysql" ,
        install_mode => "no",
    }

    drupal::site { "mycorp":
        url         => "http://www.mycorp.com/" ,
        db_name     => "mycorp" ,
        db_user     => "mycu" ,
        db_password => "!n0n!p0s!s0r!" ,
        db_host     => "localhost" ,
        db_type     => "mysql" ,
        install_mode => "yes",
    }


}
