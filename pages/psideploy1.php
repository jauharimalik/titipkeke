<?php 
if (!isset($_SESSION['userlogin'])) { header("location:".$c_url."/keluar"); } 
require_once hak("pkimle"); 
require_once ROOT.DS."pages/deploy1.php"; 
?>