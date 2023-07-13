<%@ page import="com.controller.RegistrationController" %>
<%@ page import="static com.controller.RegistrationController.addUser" %>
<%@ page import="java.sql.SQLException" %>

<%
    // Retrieve values from the request parameters
    String fullName = request.getParameter("nameI");
    String address = request.getParameter("addressI");
    String phoneNumber = request.getParameter("phoneI");
    String nicNumber = request.getParameter("nicI");
    String birthday = request.getParameter("birthdayI");
    int age = Integer.parseInt(request.getParameter("ageI"));
    String gender = request.getParameter("genderI");
    String email = (String) session.getAttribute("email");


    try {
        addUser(fullName,address,phoneNumber,nicNumber,birthday,age,gender,email);
    } catch (SQLException e) {
        e.printStackTrace();
        throw new RuntimeException(e);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Successful message</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        /* Your CSS styles */
    </style>
</head>
<body>
<%--<div class="text-center">--%>
<%--   --%>
<%--</div>--%>

<!-- Modal HTML -->
<div id="myModal" class="modal fade">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header">
                <div class="icon-box">
                    <i class="material-icons">&#xE876;</i>
                </div>
                <h4 class="modal-title w-100">Successful!</h4>
            </div>
            <div class="modal-body">
                <p class="text-center">Data added successfully</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success btn-block" data-dismiss="modal" onclick="navigateToRegistration()">OK</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        // Trigger the modal on page load
        $('#myModal').modal('show');
    });

    function navigateToRegistration() {
        // Redirect to registration.jsp page
        window.location.href = "registration.jsp";
    }
</script>
</body>
</html>

