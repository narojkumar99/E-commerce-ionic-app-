<?php



  header("Access-Control-Allow-Origin: *");
  header("Access-Control-Allow-Credentials: true");
  header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
  header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
  header('P3P: CP="CAO PSA OUR"'); // Makes IE to support cookies
  header("Content-Type: application/json; charset=utf-8");



  require "config.php";

  //  $data = file_get_contents("php://input");

   


        $response = array();


           

          
                                


  $result = mysqli_query($con,"SELECT * from products");


  while($row = mysqli_fetch_array($result))
        {
           
           
            $obj = new stdClass;
         
              $obj->id = $row['id'];
               $obj->productname = $row['productName'];
                $obj->productprice = $row['productPrice'];
                 $obj->productdescription= $row['productDescription'];
                  $obj->productimage1 = $row['productImage1'];
                   




            
           array_push($response, $obj);
           

           
          
           
            
        }
        


  

 


 echo json_encode($response);
 

 //echo json_encode( $response);

?>