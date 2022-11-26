<?php 
    $connection = new mysqli("localhost", "root", "root", "lab4");

    if (!$connection) {
        echo "connection failed!";
        exit();
    }
    echo "help";
?>