<?php

$username = $_POST[ 'username' ];
$email = $_POST[ 'email' ];
$password =  $_POST[ 'password' ] ;
$confirm_password = $_POST[ 'confirm-password' ] ;

if ( empty( $email ) || empty( $username ) || empty( $password ) || empty( $confirm_password ) ) {
    echo '<script>alert("Please fill in all fields properly!");</script>' ;
    echo '<script>window.history.go(-1);</script>';
    exit();
}

if ( $password != $confirm_password ) {
    echo ( '<script>alert("Passwords don`t match!" );
    </script>' );
    echo '<script>window.history.go(-1);</script>';
    exit();
}

$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'zeehost';

$conn = new mysqli( $host, $user, $pass, $db );
if ( $conn->connect_error ) {
    die( 'Connection Failed ' . $conn->connect_error );
}

$sql = 'INSERT INTO zh_users ( username, email, password ) VALUES ( ?, ?, ? )';
$stmt = $conn->prepare( $sql );
$password = md5( $password );
$stmt->bind_param( 'sss', $username, $email, $password );
$stmt->execute();

if ( $stmt->affected_rows == 1 ) {
    echo '<script>alert("Registered Successfully, login now!");</script>';
    echo '<script>window.history.go(-1);</script>';
    exit();
} else {
    echo '<script>alert("Error in registration. Please try again.");</script>';
    echo '<script>window.history.go(-1);</script>';
}

$stmt->close();
$conn->close();
?>
