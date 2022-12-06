<?php
session_start();
if (isset($_SESSION['user'])) {
    echo json_encode(array("login" => true));
    die;
}


include 'db.php';


echo json_decode(file_get_contents("php://input"), true);
$errorArray = array();

if (!isset($_POST["password"])) {
    $errorArray[] = (array("password" => false));
}

if (!isset($_POST["email"])) {
    $errorArray[] = (array("email" => false));
}

if (count($errorArray) == 0) {
    $userEmail = $_POST["email"];
    $userPassword = password_hash($_POST["password"], PASSWORD_BCRYPT);
    if (!ValidateUserEmail($userEmail)) {
        $errorArray[] = (array("validUserEmail" => false));
    } else {
        $find = mysqli_query($connection, "select * from people_data where email = '$userEmail'");
        $user = $find->fetch_assoc();

        if (!password_verify($_POST["password"], $user['password'])) {
            $errorArray[] = (array("IncorrectPassword" => false));
            
        } else {
            $_SESSION["user"] = $userEmail;
            
            echo json_encode(array("login" => true));
        }
       
    }

}
if(count($errorArray) > 0) echo json_encode($errorArray);


function ValidateUserEmail($email)
{
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}
