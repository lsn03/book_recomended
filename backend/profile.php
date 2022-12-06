<?php
session_start();

include 'db.php';

echo json_decode(file_get_contents("php://input"), true);

if(isset($_POST["email"])){
    $email = $_POST["email"];
    $sql = "select * from people_data where email='$email'";
    $find = mysqli_query($connection,$sql);
    $result = $find->fetch_assoc();
    echo json_encode($result);
}