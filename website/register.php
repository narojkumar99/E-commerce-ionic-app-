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

        $email = $request->email;

          $password = $request->password;

           $name = $request->name;
           $username = $request->username;

          $confirmpassword = $request->confirmpassword;

           

          
                                }



$sql = "INSERT INTO user(name,username, email, password,confirmpassword)

VALUES('$name', '$username','$email', '$password','$confirmpassword')";


 $as = mysqli_query($con, $sql);

if ($as) {

                $response= "Registration successfull";

} else {

   $response= "Error: " . $sql . "<br>" . $db->error;

}

 echo json_encode( $response);

?>