<?php 

  include("BD.php");

  $queryResult = $connection->
      query("SELECT * FROM `таблица поставок spj`");//change your_table with your database table that you want to fetch values

  $result = array();

  while ($fetchdata=$queryResult->fetch_assoc()) {
      $result[] = $fetchdata;
      
  }
  //echo ($result);
  echo json_encode($result);
 ?>