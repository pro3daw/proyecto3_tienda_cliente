<?php

session_start();

$mail = $_POST["mail"];
$password = $_POST["password"];

if ($mail == "root@root.com" && $password == "123") {
    $_SESSION["root"] = "admin";
    header('Location:dashboard.php');
} else {
    header('Location:loginerror.html');
}
?>