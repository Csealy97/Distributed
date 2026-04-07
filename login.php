<?php
/**
 * login.php
 * ---------
 * Checks username + password
 * If correct, saves user_id + user_name in SESSION
 */

session_start();
include_once __DIR__ . '/database.php';

$database = new Database();
$db = $database->getConnection();
if (!$db) { exit; }

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $user_name = htmlspecialchars(strip_tags($_POST['user_name']));
    $password  = $_POST['password'];

    $query = "SELECT user_id, user_name, password FROM users WHERE user_name = :user_name";
    $stmt = $db->prepare($query);
    $stmt->bindParam(":user_name", $user_name);
    $stmt->execute();

    $user = $stmt->fetch();

    // Verify password hash
    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id']   = (int)$user['user_id'];
        $_SESSION['user_name'] = $user['user_name'];

        // Redirect to chat
        header("Location: index.php");
        exit;
    } else {
        echo "Invalid login credentials.";
    }
}
?>




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login</title>



</head>
<style>
     body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #acbaf7, #3c4eb0);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }

    .login-container {
        background: white;
        padding: 30px;
        border-radius: 12px;
        width: 320px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        text-align: center;
    }

    .login-container h2 {
        margin-bottom: 20px;
    }

    .login-container input {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border-radius: 8px;
        border: 1px solid #ddd;
        font-size: 14px;
    }

    .login-container button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 8px;
        background: #667eea;
        color: white;
        font-size: 16px;
        cursor: pointer;
        margin-top: 10px;
        transition: 0.3s;
    }

    .login-container button:hover {
        background: #5a67d8;
    }


    .error {
        color: red;
        margin-bottom: 10px;
        font-size: 14px;
    }

    .footer-text {
        margin-top: 15px;
        font-size: 13px;
        color: #666;
    }
    </style>


<body>

<div class="login-container">
    <h2>Welcome Back</h2>

    <form method="post">
        <input type="text" name="user_name" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>

    <!-- Register Button -->
    <form action="register.php" method="get">
        <button type="submit" class="register-btn">Create Account</button>
    </form>

    <div class="footer-text">
        Don’t have an account? Register above
    </div>
</div>

</body>
</html>