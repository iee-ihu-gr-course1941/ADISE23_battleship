<?php
/* Database credentials.*/
/*define('DB_SERVER', 'users.iee.ihu.gr');
define('DB_USERNAME', 'it113800');
define('DB_PASSWORD', '');
define('DB_NAME', 'battleship3');*/
/*define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'battleship3');*/
/* Attempt to connect to MySQL database */
/*$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);*/

/* Check connection*/
/*if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}*/
?>
<?php
$user='it113800';
$pass= '';
$host='users.iee.ihu.gr';
$db = 'battleship3';


$mysqli = new mysqli($host, $user, $pass, $db,null,'/home/student/it/2011/it113800/mysql/run/mysql.sock');
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" .
    $mysqli->connect_errno . ") " . $mysqli->connect_error;
}?>
