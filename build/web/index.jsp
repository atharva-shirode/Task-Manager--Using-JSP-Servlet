<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Join Us</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
  background-image: url('img/6.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
          }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="regbox">
                <img class="avatar" src="img/2.jpg">
                <h1>
Login Account</h1>
<form action="LoginServlet" method="post">
                    <p>
Username</p>
<input type="text" placeholder="Username" name="email" required>
                    <p>
Password</p>
<input type="password" placeholder="Password" name="password" required>
<input type="submit" value="Login"><br>
<a href="register.jsp">Create New Account</a>
</form>
</div>
</div>
</body>
</html>