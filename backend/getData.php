<?php 

  include 'db.php';

  $userFirstName = $_POST["user_name"];
  $userEmail = $_POST["user_email"];
  $userPassword = password_hash( $_POST["user_password"],PASSWORD_BCRYPT);

  $query = "insert into people_data set first_name = '$userFirstName', email = '$userEmail', password = '$userPassword'";

  $res = $connection -> query($query);
  header('Content-Type: application/json');
  if($res){
    echo json_encode(array("success"=>true));

  }else{
    echo json_encode(array("success"=>false));
  }
  
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
 ?>