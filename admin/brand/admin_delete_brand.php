<?php
 if(!(isset($_GET["id"])))
{
    header("location:admin_manage_brand.php");
    exit();
}
include_once '../../connect.php';
$id = $_GET["id"];

        $query = "DELETE FROM `brand` WHERE name = '$id'";
$result = mysqli_query($link, $query);
        mysqli_close($link);
        header("location:admin_manage_brand.php");
        
        ?>

