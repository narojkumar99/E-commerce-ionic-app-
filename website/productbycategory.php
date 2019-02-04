<?php



  header("Access-Control-Allow-Origin: *");
  header("Access-Control-Allow-Credentials: true");
  header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
  header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
  header('P3P: CP="CAO PSA OUR"'); // Makes IE to support cookies
  header("Content-Type: application/json; charset=utf-8");



  require "config.php";

  //  $data = file_get_contents("php://input");

    $data = file_get_contents("php://input");

    if (isset($data)) {

        $request = json_decode($data);

        

         
          

          
                                }


        $response = array();


           

          
                                
  $result = mysqli_query($con,"SELECT r.id,r.productName,r.productPrice,r.productDescription,r.productImage1,r.productImage2,r.productImage3 from products r INNER JOIN category u ON r.categoryid = u.categoryid AND u.categoryName = '$request'");

  


  while($row = mysqli_fetch_array($result))
        {
           
           
            $obj = new stdClass;
         
              $obj->productid = $row['id'];
               $obj->productname = $row['productName'];
                $obj->productprice = $row['productPrice'];
                 $obj->productdescription = $row['productDescription'];
                  $obj->productimage = $row['productImage1'];
                   $obj->productimage2 = $row['productImage2'];
                    $obj->productimage3 = $row['productImage3'];

               
                   




            
           array_push($response, $obj);
           

           
          
           
            
        }
        


  

 


 echo json_encode($response);
 

 //echo json_encode( $response);

?>