<?php
session_start();
if (!(isset($_SESSION["admin"]) && isset($_SESSION["role"]))) {
    header("location:../admin_log_in.php");
    exit();
}
    include_once '../../connect.php';
        if(isset($_GET["edit_pro"]))
        {
            
            $current_ID = $_GET["current_ID"];
            $id_pro = $_GET["id_pro"];
            
            $name_pro = $_GET["name_pro"];
            $brand_pro = $_GET["brand_pro"];
            
            if($_GET["new_image_pro"]==NULL)
            {
                $image_pro = $_GET["current_image_pro"];
            } else {
                $image_pro = $_GET["new_image_pro"];
            }
            
            $ver_pro = $_GET["ver_pro"];
            $price_pro = $_GET["price_pro"];
            $a_s_pro = $_GET["a_s_pro"];
            $l_date_pro = $_GET["l_date_pro"];
            
           
            
            $query = "UPDATE `product` SET `ID`=$id_pro,`name`='$name_pro',`name_brand`='$brand_pro',`img`='$image_pro',`ver`='$ver_pro',`price`=$price_pro,`a_s`=$a_s_pro,`L_Date`='$l_date_pro' WHERE ID=$current_ID ";
            $result = mysqli_query($link, $query);
            
            if(!($result))
            {
                die("Edit Faile !!!!");
            }
            header("location:admin_manage_product.php");
            exit();
            mysqli_close($link);
            
        }
        ?>
