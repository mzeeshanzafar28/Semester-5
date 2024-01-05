<?php
if (isset($_GET['user'])){
    $username = $_GET['user'];
    $conn = mysqli_connect("localhost","root", "", "web_db");
    $q = "SELECT * FROM users where name='$username'";
    $result = mysqli_query($conn, $q);
    if (mysqli_num_rows( $result ) > 0) {
    echo 'Valid Username';
    }
    else{
        echo 'Invalid Username';
    }
    mysqli_close($conn);
    unset($_GET['username']);
    }

if (isset($_GET['login']) && $_GET['login'] == 'attempt') {
    if (isset($_GET['username']) && isset($_GET['password'])) {
        $username = $_GET['username'];
        $password = $_GET['password'];
        $conn = new mysqli("localhost", "root", "", "web_db");
        $q = "SELECT * FROM users where name='$username' AND password='$password'";
        $result = $conn->query($q);
        if (mysqli_num_rows( $result ) > 0)
        {
            echo "Success";
        }
        else{
            echo "Failed";
        }
        mysqli_close($conn);
        unset($_GET['login']);
}
}