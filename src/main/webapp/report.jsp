<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.controller.RetrieveData" %>
<%@ page import="com.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Reports</title>
    <link rel="stylesheet" href="css/report.css">
</head>

<body>
<jsp:include page="navBar.jsp" />
<%
    // Retrieve gender counts using scriptlets
    RetrieveData retrieveData = new RetrieveData();
    ArrayList<User> userList = null;
    int inactiveUserCount = 0;
    try {
        userList = retrieveData.getAllUsers();
        inactiveUserCount = retrieveData.getInactiveUserCount(); // Add this line
    } catch (SQLException e) {
        e.printStackTrace();
    }


    int femaleCount = 0;
    int maleCount = 0;

    for (User user : userList) {
        if (user.getGender().equalsIgnoreCase("F")) {
            femaleCount++;
        } else if (user.getGender().equalsIgnoreCase("M")) {
            maleCount++;
        }
    }

    // Retrieve service provider counts using scriptlets
    int[] serviceProviderCounts = RetrieveData.countServiceProviders();
    int hutchCount = serviceProviderCounts[0];
    int mobitelCount = serviceProviderCounts[1];
    int dialogCount = serviceProviderCounts[2];
    int airtelCount = serviceProviderCounts[3];
%>


<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script>
    function app() {
        return {
            barChartData: [<%= hutchCount %>, <%= mobitelCount %>, <%= dialogCount %>, <%= airtelCount %>],
            barChartLabels: ['Hutch', 'Mobitel', 'Dialog', 'Airtel'],

            pieChartData: [<%= femaleCount %>, <%= maleCount %>],
            pieChartLabels: ['Female', 'Male'],

            initBarChart() {
                var ctx = document.getElementById("chart-bar");
                var myBarChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: this.barChartLabels,
                        datasets: [{
                            label: 'Service Providers',
                            data: this.barChartData,
                            backgroundColor: 'rgba(54, 162, 235, 0.5)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        },
                        responsive: true,
                        plugins: {
                            legend: {
                                display: false
                            },
                            title: {
                                display: true,
                                text: 'Service Provider Counts'
                            }
                        }
                    }
                });
            },

            initPieChart() {
                var ctx = document.getElementById("chart-pie");
                var myPieChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: this.pieChartLabels,
                        datasets: [{
                            data: this.pieChartData,
                            backgroundColor: ["rgba(255, 0, 0, 0.5)", "rgba(100, 255, 0, 0.5)"]
                        }]
                    },
                    options: {
                        title: {
                            display: true,
                            text: 'Gender Distribution'
                        }
                    }
                });
            }
        }
    }

    // Initialize the bar chart and pie chart when the page loads
    window.onload = function() {
        var appInstance = app();
        appInstance.initBarChart();
        appInstance.initPieChart();
    }

</script>


<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">

<div class="container mx-auto py-10">

    <section class="page-contain flex justify-center">
        <div class="w-full max-w-xl">
            <div class="flex justify-center">
                <a href="#" class="data-card">
                    <h3><%= femaleCount + maleCount %></h3>
                    <h4>Total</h4>
                </a>
                <a href="#" class="data-card">
                    <h3><%= maleCount %></h3>
                    <h4>Male</h4>
                </a>
                <a href="#" class="data-card">
                    <h3><%= femaleCount %></h3>
                    <h4>Female</h4>
                </a>
                <a href="#" class="data-card">
                    <h3><%= inactiveUserCount %></h3>
                    <h4>Delete Users</h4>
                </a>
            </div>
        </div>
    </section>

    <h1 class="text-3xl font-semibold text-gray-800 mb-6">Reports</h1>

    <div class="chart-container">
        <div class="chart-item col-lg-6">
<%--            <div class="shadow p-4 bg-white rounded" style="margin-left:60px; padding-bottom:50px">--%>
                <div class="shadow p-4 bg-white rounded" style="height:338px; margin-left:65px;">
                <div class="flex items-center justify-between mb-4">
                    <h2 class="text-lg font-semibold text-gray-800">Bar Chart</h2>
                </div>
                <canvas id="chart-bar" style="margin-top: 47px"></canvas>
            </div>
        </div>

        <div class="chart-item col-lg-6">
            <div class="shadow p-4 bg-white rounded">
                <div class="flex items-center justify-between mb-4">
                    <h2 class="text-lg font-semibold text-gray-800">Pie Chart</h2>
                </div>
                <canvas id="chart-pie" ></canvas>
            </div>
        </div>
    </div>

</div>



</body>
</html>

