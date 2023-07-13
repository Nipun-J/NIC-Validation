<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>navBar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link rel="stylesheet" href="css/navBar.css">
</head>
<body>
<%--<nav class="sidebar-navigation">--%>
<%--    <ul>--%>
<%--        <li class="active">--%>
<%--            <i class="fas fa-user-plus"></i>--%>
<%--            <span class="tooltip" onclick="redirectTo('registration.jsp')">Registration</span>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <i class="fas fa-chart-bar"></i>--%>
<%--            <span class="tooltip" onclick="redirectTo('report.jsp')">Reports</span>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <i class="fas fa-eye"></i>--%>
<%--            <span class="tooltip" onclick="redirectTo('view.jsp')">View</span>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <i class="fas fa-sign-out-alt"></i>--%>
<%--            <span class="tooltip" onclick="redirectTo('index.jsp')">Logout</span>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</nav>--%>


<%--new--%>
<nav class="sidebar-navigation">
<ul>
<%--    <li class="active">--%>
    <li onclick="highlightIcon(this)">
        <i class="fas fa-user-plus" onclick="redirectTo('registration.jsp')"></i>
    </li>
<%--    <li>--%>
    <li onclick="highlightIcon(this)">
        <i class="fas fa-chart-bar" onclick="redirectTo('report.jsp')"></i>
    </li>
<%--    <li>--%>
    <li onclick="highlightIcon(this)">
        <i class="fas fa-eye" onclick="redirectTo('view.jsp')"></i>
    </li>
<%--    <li>--%>
    <li onclick="highlightIcon(this)">
        <i class="fas fa-sign-out-alt" onclick="redirectTo('index.jsp')"></i>
<%--        <i class="fas fa-sign-out-alt" onclick="logout()"></i>--%>
    </li>
</ul>
</nav>
<script>
    function redirectTo(url) {
        window.location.href = url;
    }




    <%--function logout() {--%>
    <%--    // Retrieve the email from the session--%>
    <%--    var email = '<%= session.getAttribute("email") %>';--%>

    <%--    // Invalidate the session--%>
    <%--    <% session.invalidate(); %>--%>

    <%--    // Redirect to index.jsp--%>
    <%--    redirectTo('index.jsp');--%>
    <%--}--%>


        function highlightIcon(element) {

        var liElements = document.querySelectorAll('.sidebar-navigation li');
        for (var i = 0; i < liElements.length; i++) {
        liElements[i].classList.remove('active');
    }

        // Add the 'active' class
        element.classList.add('active');
    }


</script>
</body>
</html>
