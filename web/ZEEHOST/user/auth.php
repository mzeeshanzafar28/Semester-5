<?php
session_start();

if ( !isset( $_SESSION[ 'zh_auth' ] ) || $_SESSION[ 'zh_auth' ] != 'zh_user' )
 {
    echo "<script>alert('Unauthorized Access!');</script>";
    echo '<script>window.history.go(-1);</script>';
    exit();
}