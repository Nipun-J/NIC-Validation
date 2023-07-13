<%@ page import="com.database.DatabaseConnector" %>
<%@ page import="java.sql.SQLException" %>
<%
    // Get the form input values
    String email = request.getParameter("email");
    String newPassword = request.getParameter("password");

    // Create an instance of DatabaseConnector
    DatabaseConnector connector = null;
    try {
        connector = DatabaseConnector.getInstance();

        // Update the password in the login table
        String updateQuery = "UPDATE login SET password = '" + newPassword + "', changedTime = CURRENT_TIMESTAMP WHERE email = '" + email + "'";
        int rowsUpdated = connector.update(updateQuery);

        if (rowsUpdated > 0) {
            // Redirect to a success page or display a success message
            response.sendRedirect("passUpdated.jsp");
        } else {
            // Redirect to an error page or display an error message
            response.sendRedirect("error.jsp");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle any errors that occur during the database update
        // Redirect to an error page or display an error message
        response.sendRedirect("error.jsp");
    } finally {
        // Close the DatabaseConnector instance
        if (connector != null) {
            connector.getConnection().close();
        }
    }
%>

