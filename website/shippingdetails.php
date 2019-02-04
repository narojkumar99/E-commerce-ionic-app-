<?php





  header("Access-Control-Allow-Origin: *");
  header("Access-Control-Allow-Credentials: true");
  header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
  header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
  header('P3P: CP="CAO PSA OUR"'); // Makes IE to support cookies
  header("Content-Type: application/json; charset=utf-8");



  require "config.php";

    $data = file_get_contents("php://input");

    if (isset($data)) 
      {



        $request = json_decode($data);

      
      $user= $request->userid;
        $address1 = $request->address1;
        $address2 = $request->address2;
       
        $country = $request->country;
        // $child = $_POST['child;  
        $state = $request->state;
        $city = $request->city;
        $postalcode = $request->postalcode;
        $phone = $request->phone;
       
        // $password = $_POST['password'];
        
      
        
        // $startDate = date("Y-m-d H:i:s", strtotime($arival));
        // $endDate = date("Y-m-d H:i:s", strtotime($departure));

        $sql="INSERT INTO shipping(userId,Address1,Address2,country,state,city,postalcode,phone)VALUES('$user','$address1','$address2','$country','$state','$city','$postalcode','$phone')";  

       
       

        $as = mysqli_query($con, $sql);
        if(!$as){
             echo mysqli_error($con);       
        }else{
           // mysqli_query($con,"INSERT INTO roominventory (arrival, departure, qty_reserve, room_id, confirmation) VALUES ('$arival', '$departure', '$nroom','$roomid','$confirmation')");
            $response = "shipping details  inserted";
            echo json_encode($response);
            // echo $confirmation."";
        }
    }


?>