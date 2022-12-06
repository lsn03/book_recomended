<?php
session_start();

include 'db.php';

//var_dump($_POST);
echo json_decode(file_get_contents("php://input"), true);

$errorArray = array();

if (!isset($_POST["first_name"])) {
  $errorArray[] =  array("firstname" => false);
}
if (!isset($_POST["password"])) {
  $errorArray[] = (array("password" => false));
}
if (!isset($_POST["password_confirm"])) {
  $errorArray[] = (array("password_confirm" => false));
}
if (!isset($_POST["email"])) {
  $errorArray[] = (array("email" => false));
}
if (!isset($_POST["birthday"])) {
  $errorArray[] = (array("birthday" => false));
}

if (count($errorArray) > 0) {
  $connection->close();
  echo json_encode($errorArray);
  die;
}

if (count($errorArray) == 0) {
  $userFirstName = $_POST["first_name"];
  $userSecondName = isset($_POST["second_name"]) ? "" : $_POST["second_name"];
  $userEmail = $_POST["email"];
  $userPassword = password_hash($_POST["password"], PASSWORD_BCRYPT);
  $userBirthday = $_POST["birthday"];
  $find = mysqli_query($connection, "select * from people_data where email = '$userEmail'");

  if (!ValidateUserName($userFirstName, $userFirstName)) {
    $errorArray[] = (array("validUserName" => false));
  }
  if (!ValidateUserEmail($userEmail)) {
    $errorArray[] = (array("validUserEmail" => false));
  }
  if (!ValidateUserBirthday($userBirthday)) {
    $errorArray[] = (array("validUserBirthday" => false));
  }
  if (count($errorArray) > 0) {
    echo json_encode($errorArray);
    $connection->close();
    die;
  }


  $find = mysqli_query($connection, "select * from people_data where email = '$userEmail'");
  $user = $find->fetch_assoc();
  if (!($_POST["password"] == $_POST["password_confirm"])) {
    $errorArray[] = array("PasswordIsEqual" => false);
  } else if (isset($user['email'])) {
    $errorArray[] = array("EmailIsFree" => false);
  } else {

    if (count($errorArray) > 0) {
      echo json_encode($errorArray);
      $connection->close();
      die;
    }

    $userPassword = password_hash($_POST["password"], PASSWORD_BCRYPT);
    $userBirthday = ReverseBirthday($userBirthday);
    $query = "insert into people_data set first_name = '$userFirstName' ,second_name='$userSecondName', email = '$userEmail', password = '$userPassword',birthday = '$userBirthday'";

    $res = $connection->query($query);

    if ($res) {
      echo json_encode(array("signup" => true));
      $_SESSION["user"] = $userEmail;
    }
  }
}
if (count($errorArray) > 0) {
  echo json_encode($errorArray);
  $connection->close();
  die;
}
function ValidateUserBirthday($birthday)
{
  // birrthday = 21.04.2003


  $res = explode(".", $birthday);
  return checkdate((int)$res[1], (int)$res[0], (int)$res[2]);
}
function ReverseBirthday($birthday)
{
  // 21.04.2003
  $res = explode(".", $birthday);
  $temp = "$res[2]-$res[1]-$res[0]";
  return $temp;
}
function ValidateUserName($fn, $sn)
{

  $res1 = preg_match('/^([а-яА-ЯЁёa-zA-Z_]+)$/u', $fn);
  $res2 = true;
  if ($sn)
    $res2 = preg_match('/^([а-яА-ЯЁёa-zA-Z_]+)$/u', $sn);
  return $res1 & $res2;
}
function ValidateUserEmail($email)
{
  return filter_var($email, FILTER_VALIDATE_EMAIL);
}

  /*if(isset($_POST["first_name"]) && isset($_POST["password"]) && isset($_POST["birthday"])&& isset($_POST["password_confirm"])){
   
    $userFirstName = $_POST["first_name"];
    $userSecondName = isset($_POST["second_name"])?"":$_POST["second_name"];
    $userEmail = $_POST["email"];
    $userPassword = password_hash( $_POST["password"],PASSWORD_BCRYPT);
    $userBirthday = $_POST["birthday"];
    
    
    $query = "insert into people_data set first_name = '$userFirstName' ,second_name='$userSecondName', email = '$userEmail', password = '$userPassword',birthday = '$userBirthday'";

    $res = $connection -> query($query);

    if($res){
      //echo json_encode(array("success"=>true));
      //echo json_encode(file_get_contents("php://input"),true);
      echo json_encode(array($_POST));
    }else{
      echo json_encode(array("success"=>false));
    }
}else{
  echo json_encode(array("success"=>false));
  
}
*/
/* 
окно регистрации 
окно авторизации
главная страница (карты)
каталог
подкаталог
топ-100
статистика
люди
профиль(личный кабинет)
настройки

опционально профиль других людей
заставка
иконка приложения

*/
/*
    require("BD.php");

    $query ="SELECT * FROM `таблица поставок spj`;";

    $statement = $connection ->prepare($query);

    $statement->execute();

    $myarray = array();

   


  while ($fetchdata=$statement->fetch()) {
     array_push(
        $myarray,array(
        "postavshik" => $fetchdata['№ поставщика'],
        )
    );
      
  }
  
  echo json_encode($myarray);
  */
