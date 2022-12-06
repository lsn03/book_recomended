<?php 

$connection = new mysqli("localhost","root","root","recomendation");

if(!$connection){
    echo "fail";
}else{
   // echo "connect";
}
//header('Content-Type: application/json');
/*
    try{
        $connection = new PDO('mysql:host=localhost;dbname=lab4','root','root');
        $connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        //echo "yes connection";
    }catch(PDOException $exc){
        echo $exc -> getMessage();
        die("loh");
    }
*/
?>