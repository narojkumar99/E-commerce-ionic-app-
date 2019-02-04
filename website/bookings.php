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


           

          
                                


  $result = mysqli_query($con,"SELECT r.userStatus,r.adminStatus,r.confirmation,r.name,r.lastname,r.adults,r.arrival,r.departure,r.contact,r.email,r.type,r.payable from reservation r INNER JOIN user u ON r.email = u.email AND u.username = '$request'");


  while($row = mysqli_fetch_array($result))
        {
           
           
            $obj = new stdClass;
         
              $obj->confirmation = $row['confirmation'];
               $obj->name = $row['name'];
                $obj->lastname = $row['lastname'];
                 $obj->adult= $row['adults'];
                  $obj->arrival = $row['arrival'];
                   $obj->departure = $row['departure'];
                   $obj->contact = $row['contact'];
                   $obj->email = $row['email'];
                   $obj->type = $row['type'];
                    $obj->payable = $row['payable'];


                    if(($row['userStatus']==1) && ($row['adminStatus']==1))  
{
  $obj->status="confirmed";
 
}
if(($row['userStatus']==0) && ($row['adminStatus']==1))  
{
  $obj->status="cancel by user";
 
}

if(($row['userStatus']==1) && ($row['adminStatus']==0))  
{
 $obj->status="cancel by admin";
 
}



            
           array_push($response, $obj);
           

           
          
           
            
        }
        


  

 


 echo json_encode($response);
 

 //echo json_encode( $response);

?>