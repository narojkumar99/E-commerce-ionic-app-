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

        $response = array();
        $errflag = false;

        $arival = $request->start;
        $departure = $request->end;
        $adults = $request->adult;
        // $child = $_POST['child;  
        $nroom = $request->n_room;
        $roomid = $request->rm_id;
        $result = $request->result;
        $email = $request->email;
        $name = $request->name;
        $last = $request->last;
        $address = $request->address;
        $city = $request->city;
        $zip = $request->zip;
        $country = $request->country;
        // $password = $request->password;
        $email = $request->email;
        $cnumber = $request->contact;
        // $password = $_POST['password'];
        
        $result1 = mysqli_query($con,"SELECT * FROM rooms WHERE roomid='$roomid'");
        while($row = mysqli_fetch_array($result1))
        {
            $rate=$row['rate'];
            $type=$row['type'];     
        }
       
         $payable= $rate*$result*$nroom;

        
        //send the email
        $confirmation = createRandomPassword();
            $to = $email;
            $subject="Reservation notification From Trivago Hotel";
            $from = 'harshbhatt365@gmail.com';
            $body = "First Name: $name\n".
            "Last Name: $last\n".
            "Email: $email \n".
            "City: $city \n".
            "Zip Code: $zip \n".
            "Country: $country \n".
            "Contact Number: $cnumber \n".
            "Check In: $arival\n ".
            "Check Out: $departure\n ".
            "Number of Adults: $adults\n ".
            "Total nights of stay: $result\n ".
            "Room Type: $type\n ".
            "Number of rooms: $nroom\n ".
            "Payable amount: $payable\n ".
            "Confirmation Number: $confirmation\n ";  
      
            $headers = "From: $from \r\n";
            $headers .= "Reply-To: $from \r\n";
            
            mail($to, $subject, $body,$headers);
        
        // $startDate = date("Y-m-d H:i:s", strtotime($arival));
        // $endDate = date("Y-m-d H:i:s", strtotime($departure));

        $sql="INSERT INTO reservation (type,arrival, departure, adults, result, room_id, no_room,name, lastname, city, zip, province, country, email, contact, payable, confirmation) VALUES ('$type','$arival','$departure','$adults','$result','$roomid','$nroom','$name','$last','$city','$zip','$address','$country','$email','$cnumber','$payable','$confirmation')";
       

        $as = mysqli_query($con, $sql);
        if(!$as){
             echo mysqli_error($con);       
        }else{
           // mysqli_query($con,"INSERT INTO roominventory (arrival, departure, qty_reserve, room_id, confirmation) VALUES ('$arival', '$departure', '$nroom','$roomid','$confirmation')");
            $response = array('confirmID'=> $confirmation."", "amount"=>$payable);
            echo json_encode($response);
            // echo $confirmation."";
        }
    }


































      function createRandomPassword() {
    $chars = "abcdefghijkmnopqrstuvwxyz023456789";
    srand((double)microtime()*1000000);
    $i = 0;
    $pass = '' ;
    while ($i <= 7) {
        $num = rand() % 33;
        $tmp = substr($chars, $num, 1);
        $pass = $pass . $tmp;
        $i++;
    }
    return $pass;
}

?>