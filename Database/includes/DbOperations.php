<?php 

	class DbOperations{

		private $con; 

		function __construct(){

			require_once dirname(__FILE__).'/DbConnect.php';

			$db = new DbConnect();

			$this->con = $db->connect();

		}

		/*CRUD -> C -> CREATE */

		public function createUser($name, $email, $password){
			if($this->isUserExist($email)){
				return 0; 
			}else{
				$password = md5($password);
				$stmt = $this->con->prepare("INSERT INTO `users` (`name`, `email`, `password`) VALUES (?, ?, ?);");
				$stmt->bind_param("sss",$name,$email,$password);

				if($stmt->execute()){
					return 1; 
				}else{
					return 2; 
				}
			}
		}

		public function userLogin($email, $pass){
			$password = md5($pass);
			$stmt = $this->con->prepare("SELECT id FROM users WHERE email = ? AND password = ?");
			$stmt->bind_param("ss",$email,$password);
			$stmt->execute();
			$stmt->store_result(); 
			return $stmt->num_rows > 0; 
		}

		public function getUserByEmail($email){
			$stmt = $this->con->prepare("SELECT * FROM users WHERE email = ?");
			$stmt->bind_param("s",$email);
			$stmt->execute();
			return $stmt->get_result()->fetch_assoc();
		}
		

		private function isUserExist($email){
			$stmt = $this->con->prepare("SELECT id FROM users WHERE email = ?");
			$stmt->bind_param("s", $email);
			$stmt->execute(); 
			$stmt->store_result(); 
		
			return $stmt->num_rows > 0; 
		}

		public function selectproduct($product_category){
			// $stmt = $this->con->prepare("select productname, sku, price, quantity FROM products left join product_category on products.category = product_category.id WHERE product_category.category = ?");
			// $stmt->bind_param("s", $product_category);
			// $stmt->execute();
			$stmt = "select productname, sku, price, quantity FROM products left join product_category on products.category = product_category.id";
			// $stmt->store_result();
			$result = $this->con->query($stmt);
			$data = [];
			if($result->num_rows > 0){

				while($row = $result->fetch_assoc()) 
				{ 
					// echo "Product Name: " . 
					// 	$row["productname"]. " - SKU: " . 
					// 	$row["sku"]. " | Price: " .  
					// 	$row["price"]. " | Quantity: " .  
					// 	$row["quantity"]; 

					$data[] = $row; 
				} 

				$response  = [];
				$response['data'] = $data;

				echo json_encode($response, JSON_PRETTY_PRINT);

				return 1;
			}else{
				return 2; 
			}

	
			// $stmt->store_result();

			// return $stmt->num_rows > 0;
		
		}

	}