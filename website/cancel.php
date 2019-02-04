<?php



  header("Access-Control-Allow-Origin: *");
  header("Access-Control-Allow-Credentials: true");
  header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
  header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
  header('P3P: CP="CAO PSA OUR"'); // Makes IE to support cookies
  header("Content-Type: application/json; charset=utf-8");



  require "config.php";

  

   
    $data = file_get_contents("php://input");

    if (isset($data)) {

        $request = json_decode($data);
       

        

}
         
          

          
                                



        
  

           

          
                              


  $sql = mysqli_query($con,"UPDATE reservation r INNER JOIN user u ON r.email = u.email AND u.username='$request' set r.userStatus='0'  ");


  if($sql)
        {
           
          $response="cancelled";

           
          
           
            
        }
        else{
          $response="cancellation errror";

        }
        


  

 


 echo json_encode($response);
 

 //echo json_encode( $response);

?>