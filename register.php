<?php
/**
 * register.php
 * ------------
 * Allows new users to create an account
 * - Saves username + hashed password in DB
 */

include_once __DIR__ . '/database.php';

$database = new Database();
$db = $database->getConnection();

if (!$db) { exit; }

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    // Sanitize username so no HTML is stored
    $user_name = htmlspecialchars(strip_tags($_POST['user_name']));

    // Hash password (never store plain text passwords)
    $password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $query = "INSERT INTO users (user_name, password)
              VALUES (:user_name, :password)";
    $stmt = $db->prepare($query);
    $stmt->bindParam(":user_name", $user_name);
    $stmt->bindParam(":password", $password_hash);

    $success = "";
$error = "";

if ($stmt->execute()) {
    $success = "Registration successful!";
} else {
    $error = "Error registering user.";
}
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register</title>


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

    .register-container {
        background: white;
        padding: 30px;
        border-radius: 12px;
        width: 320px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        text-align: center;
    }

    .register-container h2 {
        margin-bottom: 20px;
    }

    .register-container input {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border-radius: 8px;
        border: 1px solid #ddd;
        font-size: 14px;
    }

    .register-container button {
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

    .register-container button:hover {
         background: #5a67d8;
    }
    
    .footer-text {
        margin-top: 15px;
        font-size: 13px;
        color: #666;
    }

    .success {
    background: #e6fffa;
    color: #2f855a;
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 10px;
    font-size: 14px;
    border: 1px solid #b2f5ea;
}

.error {
    background: #ffe6e6;
    color: #c53030;
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 10px;
    font-size: 14px;
    border: 1px solid #feb2b2;
}
    </style>

<body>

<div class="register-container">

<?php if (!empty($success)): ?>
        <div class="success">
            <?php echo $success; ?>
            <br>
            <a href="login.php">Click here to login</a>
        </div>
    <?php endif; ?>

    <?php if (!empty($error)): ?>
        <div class="error">
            <?php echo $error; ?>
        </div>
    <?php endif; ?>
    <h2>Create Account</h2>

        

    <form method="post">
        <input type="text" name="user_name" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Register</button>
    </form>

    <!-- Back to Login -->
    <form action="login.php" method="get">
        <button type="submit" class="login-btn">Back to Login</button>
    </form>

    <div class="footer-text">
        Already have an account? Login above
    </div>
</div>

</body>
</html>