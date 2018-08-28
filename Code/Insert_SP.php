<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>AddSP</title>
    </head>
    <body>
        <h2>Add Sản Phẩm</h2>
        <hr/>
               <form method="POST">
            NameMobile: <input name="txtName" value=""><br/>
            Price: <input name="txtPrice" value=""><br/>
            Discount: <input name="txtdiscount" value=""><br/>
            Description: <input name="txtdescription" value=""><br/>
            Picture: <input name="picture" type="file" value=""><br/>
            <input type="submit" name="btnSubmit"><br/>
            
        </form>
        
        <?php

            include_once '../PRJ_Library/connect.php';
            if (isset($_POST["btnSubmit"])) {
                $Name = $_POST["txtName"];
                $Price = $_POST["txtPrice"];
                $Discount = $_POST['txtdiscount'];
                $Descriptions = $_POST['txtdescription'];
                $Picture = $_POST['picture'];
                $sql = "INSERT INTO sanpham VALUES (NULL,'$Name','$Price','$Discount','$Descriptions', '$Picture')";
                try {
                    $result = mysqli_query($link, $sql);
                    if (!$result) {
                        die("Add New False!");
                    }
                    echo"Add Success";
                } catch (Exception $exc) {
                    echo $exc->getTraceAsString();
                }
            }
            ?>
       
    </body>
</html>
