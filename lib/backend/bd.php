<?php 

    try{
        $connection = new PDO('mysql:host=localhost;dbname=lab4','root','root');
        $connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        //echo "yes connection";
    }catch(PDOException $exc){
        echo $exc -> getMessage();
        die("loh");
    }

?>