<?php
$rn = isset( $_POST[ 'rollno' ] ) ? $_POST[ 'rollno' ] : '';
if ( empty( $_POST[ 'rollno' ] ) )
 {
    echo 'Enter Roll Number first.';
    return;
}

$server = 'localhost';
$user = 'root';
$pass = '';
$db = 'studentsdb';
$conn = mysqli_connect( $server, $user, $pass, $db );
$q = "SELECT * FROM students WHERE rollno=$rn";
$results = mysqli_query( $conn, $q );

if ( mysqli_num_rows( $results ) > 0 )
 {
    echo '<table border="1"><thead><tr><th>Roll No</th><th>Name</th><th>Marks</th></tr></thead><tbody>';
    while ( $row = mysqli_fetch_assoc( $results ) )
 {
        echo '<tr>';
        echo '<td>'.$row[ 'rollno' ].'</td>';
        echo '<td>'.$row[ 'name' ].'</td>';
        echo '<td>'.$row[ 'marks' ].'</td>';
        echo '</tr>';
    }
    echo '</tbody></table>';
} else {
    echo 'No Record Found.';
}
echo '<style>table {
    justify-content: center;
    align-items: center;
    font-size: 30px;
    margin-left: 37%;
    margin-top: 15%;
}
body {
    background-color: aqua;
}
</style>';
mysqli_close( $conn );
