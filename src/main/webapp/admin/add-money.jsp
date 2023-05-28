<%@page import="com.print.DAO.AdminDao"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    Add Money
  </title>
  <!--     Fonts and icons     -->
  <link href="/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
  
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <!-- <link href="/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet"> -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
  <link rel="stylesheet" href="../assets/css/add-money.css">
  
  
 <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body class="g-sidenav-show   bg-gray-100">

<%
ResultSet rs=null;
	try {
		boolean msg = (boolean) session.getAttribute("add-money-success");
		if (msg == true) {
	%>
	<script type="text/javascript">
		Swal.fire('Congratulations!',
				'Money Added to Users account',
				'success')
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		Swal.fire('Oops!', 'Enter Correct Phone number..', 'warning')
	</script>
	<%
	}
	} catch (Exception e) {

	}
	session.removeAttribute("add-money-success");
	%>

<%
try{
boolean msg1 = (boolean) session.getAttribute("add-money-fail");
if (msg1==false) {
	%>
	<script type="text/javascript">
		Swal.fire('Oops!', 'Invalid Phone Number','warning')
	</script>
	<%
}
}catch(Exception e){
	
}
session.removeAttribute("add-money-fail");
%>


<%@ include file="../all-components/admin-sidebar.jsp"%>

  <div class="min-height-300 bg-primary position-absolute w-100"></div>


    <div class="container-fluid py-4">

        <div class="row mt-4">
          <div class="col-lg-12 d-flex justify-content-center align-items-center mb-lg-0 mb-4">

            <div class="card z-index-2 h-100">
                
              <div class="card-header pb-0 pt-3 bg-transparent">
                <h6 class="text-capitalize">Add Money To Wallet</h6>
               
              </div>
              <div class="card-body p-3">
             
                <div class="wrapper">                
                    <form action="../AddMoneyController" method="post">
                        <div class="form-group">
                            <label for="example-number-input" class="form-control-label">Amount</label>
                            <input class="form-control" type="number"  name="amount" value="0" id="example-number-input">
                        </div>
                        <div class="row mt-2">
                        <div class="add_amount col-lg-12 mb-lg-0 mb-3">
                        <a class="btn btn-primary mb-2 w-50" href="#" type="button" onclick="updateAmount(20)">+20</a>
                        <a class="btn btn-primary mb-2 w-50" href="#" type="button" onclick="updateAmount(50)">+50</a>
                        <a class="btn btn-primary mb-2 w-50" href="#" type="button" onclick="updateAmount(100)">+100</a>
    
                        </div>
                        </div>
                        <div class="form-group p-0">
                            <label for="example-tel-input" class="form-control-label">Phone</label>
                            <input class="form-control" name="phone" type="text" value="" id="example-tel-input">
                        </div>
                         <button class="btn btn-primary mb-0 w-100"  >Add Money</button>
                        
                    </form>

                    <script>
                        function updateAmount(value) {
                            var amountField = document.getElementById("example-number-input");
                            var currentValue = parseFloat(amountField.value);
                            amountField.value = currentValue + value;
                        }
                    </script>
                    
                    <section class="progress-area"></section>
                    <section class="uploaded-area"></section>
                   
                  </div>
              </div>


            </div>
          </div>
          
          
        </div>

        <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12">
              <div class="card mb-4">
                <div class="card-header pb-0 d-flex justify-content-lg-between">
                    <div>
                        <h6>Recent Transactions</h6>
                    </div>
                   
                </div>
                <div class="card-body px-0 pt-0 pb-2">
                  <div class="table-responsive p-0">
                    <table class="table align-items-center mb-0">
                      <thead>
                        <tr>
                            
                            <th class="text-uppercase text-secondary text-xxs  text-center font-weight-bolder">Phone</th>
                            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder">Amount</th>
                            
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder text-center ">date/time</th>
                           <th class="text-uppercase text-secondary text-xxs font-weight-bolder text-center ">Type</th>
                          
                        </tr>
                      </thead>
                      <tbody>
<%

AdminDao aDao=new AdminDao();
try{
		

		rs=aDao.getAdminTransectionInfo();
		
		if(rs!=null){
			
		while(rs.next()){
		
%>
                        <tr>
                            <td class="align-middle text-center text-sm" id="phone_number">
                            <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(1) %></span>
                            </td>
                          <td class="align-middle text-center text-sm">
                            <span class="badge badge-sm bg-gradient-success"><%=rs.getInt(2) %></span>
                          </td>
                          
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(3) %></span>
                          </td>
                        
                           <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(4) %></span>
                          </td>
                        </tr>

                       
<%
		}
		}
		}catch(Exception e){
			
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


        
      </div>

    
  </main>


  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <script>
    var ctx1 = document.getElementById("chart-line").getContext("2d");

    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

    gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
    gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
    new Chart(ctx1, {
      type: "line",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
          label: "Mobile apps",
          tension: 0.4,
          borderWidth: 0,
          pointRadius: 0,
          borderColor: "#5e72e4",
          backgroundColor: gradientStroke1,
          borderWidth: 3,
          fill: true,
          data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
          maxBarThickness: 6

        }],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              padding: 10,
              color: '#fbfbfb',
              font: {
                size: 11,
                family: "Open Sans",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#ccc',
              padding: 20,
              font: {
                size: 11,
                family: "Open Sans",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    });
  </script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/argon-dashboard.min.js?v=2.0.4"></script>

  <script src="../assets/js/file-upload.js"></script>
</body>

</html>