<?php
require_once ROOT.DS."/config.php";
if(isset($_SESSION['username'])){
session_unset($_SESSION['username']);
session_unset($_SESSION['password']);
session_unset($_SESSION['level']);
session_unset($_SESSION['avatar']);
}
session_destroy();
echo '<META HTTP-EQUIV="Refresh" Content="0; URL='.$c_url.'/login">';