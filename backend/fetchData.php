<?php

session_start();

include 'db.php';

echo json_decode(file_get_contents("php://input"), true);
if(isset($_POST["fetchData"]) && isset($_POST["email"]) ){
    $email = $_POST["email"];
    $sql1 = "select cnt_of_dislike_book,cnt_of_like_book,cnt_of_wishes_book from people_data where email = '$email' ";
    $res1 = mysqli_query($connection,$sql1);
    $result = $res1 ->fetch_assoc();
    echo json_encode($result,JSON_UNESCAPED_UNICODE);
}

?>