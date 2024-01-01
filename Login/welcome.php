<?php
// Initialize the session
session_start();

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link href="../Game/public/img/favicon.png" rel="icon">
    <link rel="stylesheet" href="welcome_css.css">

</head>
<body>
    <h1>Hello, admiral <strong><?php echo htmlspecialchars($_SESSION["username"]); ?></strong>. Are you ready for this?</h1>
    <p>
        <button class="buttonGreen" onclick="location.href='../Rules/rules.html';">Start</button>
        <button class="buttonYellow" onclick="location.href='reset-password.php';">Reset Your Password</button>
        <button class="buttonRed" onclick="location.href='logout.php';">Sign Out of Your Account</button>
    </p>
</body>
</html>