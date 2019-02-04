<?php



    // Access-Control headers are received during OPTIONS requests


    
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


 // header("Access-Control-Allow-Origin: *");
   // header('Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT');
  //header('Access-Control-Allow-Headers: Origin,X-Requested-With, Content-Type, Accept, Authorization');




  require "config.php";

$rejson = file_get_contents("php://input");
$_POST = json_decode($rejson,true);

$username=$_POST["username"];
$password=$_POST["password"];


    $sql = "SELECT userId FROM user WHERE username = '$username' and password = '$password'";

      
	  
	  $result = mysqli_query($con,$sql);

      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);

      $active = $row['active'];

      $count = mysqli_num_rows($result);

     

      // If result matched myusername and mypassword, table row must be 1 row                    

      if($count > 0) {

     $response= "Your Login success";
	 

      }



      else {

    $response= "Your Login Email or Password is invalid";         

      }

 echo json_encode( $response);

?>