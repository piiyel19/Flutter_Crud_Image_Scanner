<?php

define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'api');

$con = mysqli_connect(HOST, USER, PASS, DB) or die('tidak bisa konek');

if(isset($_POST['email'])){
    $email = $_POST['email'];
} else {
    $email = '';
}

if(isset($_POST['password'])){
    $password = $_POST['password'];
} else {
    $password ='';
}

$email = str_replace(' ', '', $email);

$response['email'] = $email;
$response['password'] = $password;
// echo json_encode($response);
// exit();
// echo $email; exit();

if($_SERVER['REQUEST_METHOD'] == "POST"){
    $response = array();

    $email = preg_replace('/\s+/','',$email);
    
    //$password = md5($_POST['password']);
    //$password = $_POST['password'];

    $cek = "SELECT * FROM users WHERE email = '$email' and password='$password'";
    $response['cek'] = $cek;
    //echo json_encode($response);
    //exit();

    $result = mysqli_fetch_array(mysqli_query($con, $cek));

    if(isset($result)){

        $response['username'] = $result["nama"];
        $response['level'] = $result["level"];
        $response['value'] = 1;
        $response['message'] = 'Login Berhasil';
        echo json_encode($response);

    } else{
            $response['value'] = 0;
            $response['message'] = "login gagal";
            echo json_encode($response);
        }
    }

?>