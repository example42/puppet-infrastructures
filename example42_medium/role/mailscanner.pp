class role::mailscanner {
    # MailScanner components
    include mysql
    include sendmail::disable
    include postfix::mysql
    include postfix::postfixadmin
    include dovecot::mysql
    include mailscanner::mailwatch
    include clamav
    include squirrelmail
}

