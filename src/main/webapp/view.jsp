<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.database.DatabaseConnector" %>
<%@ page import="com.model.User" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.controller.RetrieveData" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DataTables </title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" rel=" stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link rel="stylesheet" href="css/datatables.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">


        <link rel="stylesheet" href="css/view.css">

</head>

<%
    RetrieveData retrieveData = new RetrieveData();
    ArrayList<User> userList = retrieveData.getAllUsers();
%>
<body class="bg-gray-100 text-gray-900 tracking-wider leading-normal">
<!-- Container -->
<jsp:include page="navBar.jsp" />

<div class="container w-full md:w-4/5 xl:w-3/5 mx-auto px-2">


    <!-- Card -->
    <div class="row">
        <div class="col-md-12">
            <div class="card" style="margin-left: 75px;">
                <div class="card-body">
                    <div class="table-responsive">

                        <div class="flex justify-end mt-4">
                            <a href="registration.jsp" class="icon-button mr-2">
                                <i class="fas fa-arrow-left" style="font-size: 30px"></i> <!-- Back icon -->
                            </a>
                            <a href="index.jsp" class="icon-button">
                                <i class="fas fa-home" style="font-size: 30px"></i> <!-- Home icon -->
                            </a>
                        </div>

                        <table id="example" class="display table table-striped table-bordered" >
                            <thead>
                            <tr>
                                <th data-priority="1">User ID</th>
                                <th data-priority="2">Full Name</th>
                                <th data-priority="3">NIC</th>
                                <th data-priority="4">Address</th>
                                <th data-priority="5">Phone Number</th>
                                <th data-priority="6">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%for (User user : userList) { %>
                            <tr>
                                <td><%= user.getUserId()%></td>
                                <td><%= user.getFullName() %></td>
                                <td><%= user.getNic() %></td>
                                <td><%= user.getAddress() %></td>
                                <td><%= user.getPhoneNumber() %></td>


                                <td style="white-space: nowrap;">
                                    <div style="display: inline-block;">
                                        <input type="button" value="Update" data-toggle="modal" data-target="#exampleModal" onclick="fillModal('<%= user.getUserId() %>', '<%= user.getFullName() %>', '<%= user.getAddress() %>', '<%= user.getPhoneNumber() %>', '<%= user.getNic() %>', '<%= user.getBirthday() %>', '<%= user.getAge() %>', '<%= user.getGender() %>')" style="background-color: blue; color: white; border-width: 5px; border-color: blue; border-radius: 2px">
                                    </div>
                                    <div style="display: inline-block;">
                                        <input type='button' value='Delete' onclick="redirectToDeletePage(<%= user.getUserId() %>)" style="background-color:darkred; color: white; border-width: 5px; border-color:darkred; border-radius: 2px">
                                    </div>
                                </td>


                            </tr>
                            <%
                                }

                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>

    </div>


</div>


<!--/container-->


<%--modal--%>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Update Registration</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form" method="POST" action="update.jsp">

                    <input type="hidden" id="userIdI" name="userIdI" value="">


                    <label for="nameI" class="form-label12 animation a3" >Full Name:</label>
                    <input type="text" class="form-field animation a3" placeholder="Full Name" name="nameI" id="nameI" required>

                    <label for="addressI" class="form-label12 animation a3">Address:</label>
                    <input type="text" class="form-field animation a3" placeholder="Address" name="addressI" id="addressI" required>

                    <label for="phoneI" class="form-label12 animation a3">Phone Number:</label>
                    <input type="text" class="form-field animation a3" placeholder="Phone Number" name="phoneI" id="phoneI" required pattern="^(07\d{8}|7\d{8}|\+947\d{8}|947\d{8})$">

                    <label for="nicI" class="form-label12 animation a4">NIC:</label>
                    <input type="text" class="form-field animation a4" placeholder="NIC" name="nicI" id="nicI" required pattern="[0-9]{9}|[0-9]{12}|[0-9]{9}[vV]|([0-9]{12})" title="Invalid NIC">

                    <label for="birthdayI" class="form-label12 animation a4">Birthday:</label>
                    <input type="text" class="form-field animation a4" placeholder="Birthday" name="birthdayI" id="birthdayI">

                    <label for="ageI" class="form-label12 animation a4">Age:</label>
                    <input type="text" class="form-field animation a4" placeholder="Age" name="ageI" id="ageI">

                    <label for="genderI" class="form-label12 animation a5">Gender:</label>
                    <input type="text" class="form-field animation a5" placeholder="Gender" name="genderI" id="genderI">



                    <button class="animation a6" id="submitBtn">Update</button>

            </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<%--modal--%>


<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/datatables.min.js"></script>
<script src="js/datatables.script.min.js"></script>


<script>
    $(document).ready(function() {

        var table = $('#example').DataTable({
            responsive: true
        })
            .columns.adjust()
            .responsive.recalc();
    });
</script>
<script>
    function calculateInfo() {
        var gender = "";
        var year = "";
        var month = "";
        var day = "";

        var nicValue = document.getElementById("nicI").value;

        if (nicValue === "") {
            document.getElementById("ageI").value = "";
            document.getElementById("genderI").value = "";
            document.getElementById("birthdayI").value = "";
        } else {
            var oldPatternNIC = /[0-9]{9}[V|X|v|x]/;
            var newPatternNIC = /^[0-9]{12}$/;

            if (oldPatternNIC.test(nicValue) || newPatternNIC.test(nicValue)) {
                if (nicValue.length == 12) {
                    year = parseInt(nicValue.substr(0, 4));
                    console.log(year);

                    var midnumber = nicValue.substr(4, 3);
                    console.log(midnumber);
                } else {
                    year = parseInt(nicValue.substr(0, 2));
                    year = 1900 + year;
                    console.log(year);

                    var midnumber = nicValue.substring(2, 5);
                    console.log(midnumber);
                }

                var intMidValue = parseInt(midnumber);

                if (intMidValue > 500) {
                    gender = "Female";
                    intMidValue = intMidValue - 500;
                } else {
                    gender = "Male";
                }
                document.getElementById("genderI").value = gender;

                if (intMidValue < 1 || intMidValue > 366) {
                    // Invalid NIC number, do nothing
                } else {
                    if (intMidValue > 335) {
                        day = intMidValue - 335;
                        month = "12";
                    } else if (intMidValue > 305) {
                        day = intMidValue - 305;
                        month = "11";
                    } else if (intMidValue > 274) {
                        day = intMidValue - 274;
                        month = "10";
                    } else if (intMidValue > 244) {
                        day = intMidValue - 244;
                        month = "09";
                    } else if (intMidValue > 213) {
                        day = intMidValue - 213;
                        month = "08";
                    } else if (intMidValue > 182) {
                        day = intMidValue - 182;
                        month = "07";
                    } else if (intMidValue > 152) {
                        day = intMidValue - 152;
                        month = "06";
                    } else if (intMidValue > 121) {
                        day = intMidValue - 121;
                        month = "05";
                    } else if (intMidValue > 91) {
                        day = intMidValue - 91;
                        month = "04";
                    } else if (intMidValue > 60) {
                        day = intMidValue - 60;
                        month = "03";
                    } else if (intMidValue > 31) {
                        day = intMidValue - 31;
                        month = "02";
                    } else if (intMidValue <= 31) {
                        day = intMidValue;
                        month = "01";
                    }

                    document.getElementById("birthdayI").value = year + "-" + month + "-" + day;
                    var currentDate = new Date();
                    var currentYear = currentDate.getFullYear();
                    document.getElementById("ageI").value = currentYear - year;
                }
            }
        }
    }

    // Attach the calculateInfo function to the NIC field's onblur event
    document.getElementById("nicI").addEventListener("blur", calculateInfo);
</script>
<script>
function setUserId(userId) {
document.getElementById("userIdI").value = userId;
}
</script>

<script>
    function redirectToDeletePage(userID) {
        window.location.href = "delete.jsp?userId=" + encodeURIComponent(userID);

    }

//Csv,pdf
    $(document).ready(function () {
        loadTable();
    });

    function loadTable() {
        $('#example').DataTable({
            "paging": true,
            "dom": 'Bfrtip',
            "buttons": [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "responsive": true,
            "bDestroy": true
        });
    }
</script>

<script>
    function setUserId(userId) {
        document.getElementById('userIdI').value = userId;
    }
</script>

<script>
//auto fill data
    function fillModal(userId, fullName, address, phoneNumber, nic, birthday, age, gender) {
        var modal = $('#exampleModal');
        modal.find('#userIdI').val(userId);
        modal.find('#nameI').val(fullName);
        modal.find('#addressI').val(address);
        modal.find('#phoneI').val(phoneNumber);
        modal.find('#nicI').val(nic);

        modal.find('#birthdayI').val(birthday);
        modal.find('#ageI').val(age);

        // Convert gender value to "Male" or "Female"
        var genderValue = (gender === 'M') ? 'Male' : 'Female';
        modal.find('#genderI').val(genderValue);
    }
</script>

</body>

</html>