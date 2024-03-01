<?php 

require_once '../includes/DbOperations.php';

$response = array(); 

if($_SERVER['REQUEST_METHOD']=='POST'){
	
		$db = new DbOperations();

        $result = $db->selectproduct($_POST['category'],
									);

    if($result == 1){
        $response['error'] = false; 
        $response['message'] = "product retrived success fully";
    }elseif($result == 2){
        $response['error'] = true; 
        $response['message'] = "";						
    }

}else{
$response['error'] = true; 
$response['message'] = "Invalid Request";
}

echo json_encode($response);