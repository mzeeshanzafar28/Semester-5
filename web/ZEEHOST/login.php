<?php

$username = $_POST[ 'username' ];
$password = $_POST[ 'password' ] ;

if ( empty( $username ) || empty( $password ) ) {
    echo '<script>alert("No Username or Password Supplied");</script>';
    echo '<script>window.history.go(-1);</script>';
    exit();
}

$host = 'localhost';
$user = 'root';
$pass = '';
$db_name = 'zeehost';

$conn = new mysqli( $host, $user, $pass, $db_name );

if ( $conn->connect_error ) {
    die( 'Connection Failed: ' . $conn->connect_error );
}

$sql = 'SELECT * FROM zh_users WHERE username = ? AND password = ?';
$stmt = $conn->prepare( $sql );
$password = md5( $password );
$stmt->bind_param( 'ss', $username, $password );
$stmt->execute();

$result = $stmt->get_result();

if ( !$result || $result->num_rows == 0 ) {
    echo '<script>alert("Invalid Credentials!");</script>';
    echo '<script>window.history.go(-1);</script>';
} else if ( $result->num_rows == 1 ) {
    session_start();
    $_SESSION[ 'zh_auth' ] = 'zh_user';
    header( 'Location: user/examples/dashboard.php' );
    exit();
}

$stmt->close();
$conn->close();
unsetter();

?>
