<?php


if (!isset($_SERVER['HTTP_ORIGIN'])) {
    echo "This is not cross-domain request";
    exit;
}
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

          $qty = $request->qty;
        $startDate = $request->startDate;
        $endDate = $request->endDate;



        $response = array();


           

          
                                }


  $result = mysqli_query($con,"SELECT * FROM rooms where max_adult >= '$qty'");


  while($row = mysqli_fetch_array($result))
        {
            $a=$row['roomid'];
           
            $obj = new stdClass;
            $obj->room_id = $a;
            $obj->type = $row['type'];
            $obj->rate = $row['rate'];            
            $obj->max = $row["max_adult"];
             $obj->guest = $row['guest'];
          
            $obj->desc = $row["description"];
            $obj->bed = $row["bed"];
           

            array_push($response, $obj);
        }






 echo json_encode($response);
 

 //echo json_encode( $response);

?>