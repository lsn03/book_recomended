<?php
session_start();

include 'db.php';

echo json_decode(file_get_contents("php://input"), true);



if(isset($_POST["cnt"])&&$_POST["email"]){
    (int)$cnt = $_POST["cnt"];
    
    $userEmail = $_POST["email"];
    $sql1 = "select birthday from people_data where email = '$userEmail'";
    $res1 = mysqli_query($connection,$sql1);
    (string) $userBirthday = $res1 ->fetch_column();

    if (time() < strtotime('+18 years', strtotime($userBirthday))) {
        //echo 'Client is under 18 years of age.';
        $sql2 = "select * from book  order by rand() limit $cnt";
        $find = mysqli_query($connection,$sql2);
        $result = [];
        
        while($row = $find->fetch_assoc()){
            $result[] = $row;
        }
        
        echo json_encode($result,JSON_UNESCAPED_UNICODE);
     }else{
        //echo "client is 18 years old";
        $sql2 = "select * from book where age_permission<'18' order by rand() limit $cnt";
        $find = mysqli_query($connection,$sql2);
        $result = [];
        
        while($row = $find->fetch_assoc()){
            $result[] = $row;
        }
        
        echo json_encode($result,JSON_UNESCAPED_UNICODE);
     }

    
}