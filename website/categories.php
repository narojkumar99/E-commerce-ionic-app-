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


           

          
                                


  $result = mysqli_query($con,"SELECT * from category");


  while($row = mysqli_fetch_array($result))
        {
           
           
            $obj = new stdClass;
         
              $obj->id = $row['cateogryid'];
               $obj->categoryname = $row['categoryName'];
               
                   




            
           array_push($response, $obj);
           

           
          
           
            
        }
        


  

 


 echo json_encode($response);
 

 //echo json_encode( $response);

?>