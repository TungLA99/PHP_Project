<?php
 if(!(isset($_GET["id"])))
{
    header("location:admin_manage_version.php");
    exit();
}
include_once '../../connect.php';
$id = $_GET["id"];

        $query = "DELETE FROM `version` WHERE ver_code = '$id'";
$result = mysqli_query($link, $query);
        mysqli_close($link);
        header("location:admin_manage_version.php");
        
        ?>

