<?php

session_start();

include 'db.php';

echo json_decode(file_get_contents("php://input"), true);
if(isset($_POST["cnt_of_wishes_book"])&& isset($_POST["cnt_of_like_book"]) && isset( $_POST["cnt_of_dislike_book"]) ){
    (int)$cnt_of_wishes_book = $_POST["cnt_of_wishes_book"];
    (int)$cnt_of_like_book = $_POST["cnt_of_like_book"];
    (int)$cnt_of_dislike_book = $_POST["cnt_of_dislike_book"];
    $email = $_POST['email'];
    $query = "update people_data set cnt_of_wishes_book = '$cnt_of_wishes_book' ,cnt_of_like_book='$cnt_of_like_book', cnt_of_dislike_book = '$cnt_of_dislike_book' where email ='$email'";
    //$query = "insert into people_data cnt_of_wishes_book,cnt_of_like_book,cnt_of_dislike_book values('$cnt_of_wishes_book','$cnt_of_like_book','$cnt_of_dislike_book') where email ='$email'";

    $res = $connection->query($query);
    if($res){
        echo json_encode( array("successful"=>true),JSON_UNESCAPED_UNICODE);
    }
    
}

?>