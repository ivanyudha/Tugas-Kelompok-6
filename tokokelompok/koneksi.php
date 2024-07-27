<?php
$host = "localhost";
$username = "root";
$password = "";
$db = "toko_kel6";
$port = 3307;

$connect = mysqli_connect($host, $username, $password, $db, $port);

if (!$connect) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
?>