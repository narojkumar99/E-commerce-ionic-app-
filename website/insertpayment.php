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

      
      
        $userid = $request->userid;
        $paymentmethod = $request->paymentmethod;
       
        $ordernumber =  createRandomnumber();
        // $child = $_POST['child;  
       
       
        // $password = $_POST['password'];
        
      
        
        // $startDate = date("Y-m-d H:i:s", strtotime($arival));
        // $endDate = date("Y-m-d H:i:s", strtotime($departure));

        $sql="INSERT INTO orders (paymentMethod,ordernumber)VALUES('$paymentmethod','$ordernumber')";
       

        $as = mysqli_query($con, $sql);
        if(!$as){
             echo mysqli_error($con);       
        }else{
           // mysqli_query($con,"INSERT INTO roominventory (arrival, departure, qty_reserve, room_id, confirmation) VALUES ('$arival', '$departure', '$nroom','$roomid','$confirmation')");
            $response = "paymentmethod & order inserted";
            echo json_encode($response);
            // echo $confirmation."";
        }
    }


































      function createRandomnumber() {
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