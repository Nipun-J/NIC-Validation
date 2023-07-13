<%@ page import="static com.controller.RegistrationController.addUser" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NIC Validation</title>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Arimo' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Hind:300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/style1.css">

</head>
<body style="background:url('images/b.jpg') no-repeat center center fixed;">
<img src="images\b.jpg" alt="background" class="responsive-image">
<div id="login-button">
    <img src="http://dqcgrsy5v35b9.cloudfront.net/cruiseplanner/assets/img/icons/login-w-icon.png">
</div>
<div id="container">
    <h1>Log In</h1>
    <span class="close-btn">
            <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png">
        </span>

    <form id="login-form" action="indexSR.jsp" method="POST">
        <input type="email" name="email" id="emailI" placeholder="E-mail" required >
        <input type="password" name="pass" id="passI" placeholder="Password" required>
        <button id="lobt" type="submit">Log in</button>
        <div id="remember-container">
            <input type="checkbox" id="checkbox-2-1" class="checkbox" checked="checked"/>
            <span id="remember">Remember me</span>
            <span id="forgotten">Forgotten password</span>
        </div>
    </form>

</div>

<!-- Forgotten Password Container -->
<div id="forgotten-container">
    <h1>Forgotten</h1>
    <span id="forgotten-close-btn" class="close-btn">
            <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
        </span>

        <form action="forgotPassword.jsp" method="POST">
        <input type="email" name="email" placeholder="E-mail" required>
            <input type="password" name="password" placeholder="Password" required pattern="[0-9]{5}" title ="Type 5 digits Password">
            <button id="fobt" class="orange-btn" type="submit">Get new password</button>
        </form>
</div>

<script src='http://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/TweenMax.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/jquery.js"></script>

<script>
    $('#login-button').on('click', function() {
        $('#login-button').fadeOut("slow", function() {
            $("#container").fadeIn();
        });
    });

    $(".close-btn").click(function() {
        $("#container").fadeOut(800, function() {
            $("#login-button").fadeIn(800);
        });
    });

    $('#forgotten').click(function(){
        $("#container").fadeOut(function(){
            $("#forgotten-container").fadeIn();
        });
    });

    // Handle close button click in forgotten-container
    $("#forgotten-close-btn").click(function(){
        $("#forgotten-container").fadeOut(800, function(){
            $("#login-button").fadeIn(800);
        });
    });



</script>

</body>
</html>




