<?php
/* Database credentials.*/
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'it113800');
define('DB_USERNAME_LOCAL', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'battleship3');
define('DB_SOCKET','/home/student/it/2011/it113800/mysql/run/mysql.sock');

/* Attempt to connect to MySQL database */
  if (gethostname()=='users.iee.ihu.gr') {
         $link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME, null, DB_SOCKET);
     } else {
            $link = mysqli_connect(DB_SERVER, DB_USERNAME_LOCAL, DB_PASSWORD, DB_NAME);
            }


/* Check connection*/
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>
