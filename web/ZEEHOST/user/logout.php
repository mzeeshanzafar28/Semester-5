<?php
session_start();

if ( isset( $_SESSION[ 'zh_auth' ] ) && $_SESSION[ 'zh_auth' ] == 'zh_user' )
 {
    unset( $_SESSION[ 'zh_auth' ] );
    session_destroy();
    echo '<script>alert("Logged Out Successfully.");</script>';
    echo '<script>window.location.href="/zeehost";</script>';
    exit();
}
