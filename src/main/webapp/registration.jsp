<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<jsp:include page="navBar.jsp" />
<div class="container">

    <div class="left">
        <div class="header">
            <h2 class="animation a1">Registration Form</h2>
            <h4 class="animation a2">Fill this form</h4>
        </div>

        <form class="form" method="POST" action="SR.jsp">
            <input type="text" class="form-field animation a3" placeholder="Full Name" name="nameI" id="nameI" required>
            <input type="text" class="form-field animation a3" placeholder="Address" name="addressI" id="addressI" required>
            <input type="text" class="form-field animation a3" placeholder="Phone Number" name="phoneI" id="phoneI" required pattern="^(07\d{8}|7\d{8}|\+947\d{8}|947\d{8})$">
            <input type="text" class="form-field animation a4" placeholder="NIC" name="nicI" id="nicI" required pattern="[0-9]{9}|[0-9]{12}|[0-9]{9}[vV]|([0-9]{12})" title="Invalid NIC">
            <input type="text" class="form-field animation a4" placeholder="Birthday" name="birthdayI" id="birthdayI">
            <input type="text" class="form-field animation a4" placeholder="Age" name="ageI" id="ageI">
            <input type="text" class="form-field animation a5" placeholder="Gender" name="genderI" id="genderI">
            <input type="hidden" id="userId" name="userId" value="">
            <button class="animation a6" id="submitBtn">Submit</button>
            <form class="form">
                <button class="animation a6" type="button" id="show-view">View</button>
            </form>
        </form>
    </div>
    <div class="right">

    </div>
</div>
</div>

<script>
//NIC validation
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


    // Get the "View" button element
    var viewButton = document.getElementById("show-view");

    // Add a click event listener to the button
    viewButton.addEventListener("click", function() {
        // Redirect to view.jsp page
        window.location.href = "view.jsp";
    });
</script>
</body>
</html>

