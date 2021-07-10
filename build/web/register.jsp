<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Account</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
  background-image: url('img/3.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
        </style>
    </head>
    <body>
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/1.jpg">
                <h1>
Register Account</h1>
<form action="Registerservlet" method="post">
                   <p>
Username</p>
<input type="text" placeholder="Username" name="name" required>
                   <p>
Useremail</p>
<input type="text" placeholder="Useremail" name="email" required>
                   <p>
Password</p>
<input type="password" placeholder="Password" name="password" required>
<input type="submit" value="Register">
                   <a href="index.jsp">Already have an Account?</a>
                </form>
</div>
</div>
</body>
</html>
