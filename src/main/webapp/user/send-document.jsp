<%@page import="java.sql.ResultSet"%>
<%@page import="com.print.DAO.UserDAO"%>
<%@page import="java.util.Date"%>


<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<title>Send Documents</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<link
	href="../assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle" href="../assets/css/argon-dashboard.css?v=2.0.4"
	rel="stylesheet" />
<link rel="stylesheet" href="../assets/css/send-doc.css">

<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<%@ include file="../all-components/cdn-links.jsp"%>
<%
ServletContext sc1 = request.getServletContext();
User u = (User) sc1.getAttribute("user");
if (u == null) {
	//session.setAttribute("user-login", 404);
	//response.sendRedirect("404.jsp");
}
%>


<body class="g-sidenav-show   bg-gray-100">
	<%
	try {
		boolean msg = (boolean) session.getAttribute("upload-success");
		if (msg == true) {
	%>
	<script type="text/javascript">
		Swal.fire('Congratulations!',
				'Documents Uploaded Successfuly.. Secure Pin Generated',
				'success')
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		Swal.fire('Oops!', 'Something went wrong..', 'warning')
	</script>
	<%
	}
	} catch (Exception e) {

	}
	session.removeAttribute("upload-success");
	%>

	<%
	try {
		boolean msg1 = (boolean) session.getAttribute("upload-fail");
		if (msg1 == false) {
	%>
	<script type="text/javascript">
		Swal.fire('Ooops!', 'Failed to upload douments.', 'warning')
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		Swal.fire('Oops!', 'Something went wrong..', 'warning')
	</script>
	<%
	}
	} catch (Exception e) {

	}
	session.removeAttribute("upload-fail");
	%>
	<%@ include file="../all-components/user-sidebar.jsp"%>


	<div class="min-height-300 bg-primary position-absolute w-100"></div>


	<div class="container-fluid py-4">

		<div class="row mt-4">
			<div
				class="col-lg-12 d-flex justify-content-center align-items-center mb-lg-0 mb-4">

				<div class="card z-index-2 h-100">

					<div class="card-header pb-0 pt-3 bg-transparent">
						<h6 class="text-capitalize">Upload files</h6>

					</div>
					<%
					Timestamp date = new Timestamp(new Date().getTime());
					%>
					<div class="card-body p-3">
						<form action="../FileUploadController" method="post"
							enctype='multipart/form-data'>
							<div class="wrapper">
								<header>Upload Files</header>

								<input class="file-input" type="file" name="files"
									multiple="multiple" hidden> <input
									value="<%=u.getId()%>" name="userId" hidden="hidden">
								<i class="fas fa-cloud-upload-alt"></i>
								<p>Browse File to Upload</p>

								<section class="progress-area"></section>
								<section class="uploaded-area"></section>
								<div class="mb-3">
									<input type="text" name="setName" class="form-control"
										value="<%=date%>" aria-label="Name" readonly="readonly">
								</div>


							</div>
					</div>

					<button class="btn btn-primary mb-0 w-70"
						style="align-self: center;" type="submit">Send Files</button>
					<br>
				</div>
				<br>

			</div>


			</form>
		</div>

		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-12">
					<div class="card mb-4">
						<div class="card-header pb-0">
							<h6>Documents table</h6>
						</div>
						<div class="card-body px-0 pt-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">SetName</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Token</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">DocName</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Pages</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Cost</th>
										</tr>
									</thead>
									<tbody>
										<%
										try {
											UserDAO ud = new UserDAO();
											ResultSet rs = ud.findDocumentByUserId(u.getId());

											String temp = "";
											int flag=0;
											int k=0;
											int cnt = 0;
											
											System.out.println("outside loop");
											while (rs.next()) {
												System.out.println("while loop");
												if(temp.compareTo(rs.getString(3))==0){
													
												}else{
													temp = rs.getString(3);
													flag=0;
													cnt=ud.getCountBySetName(rs.getString(3));
													
													System.out.println("in the if"+temp);
													
												}
										%>
										


											<%
											if (temp.equals(rs.getString(3)) && flag==0) {
												flag=1;
												System.out.println("in the second if"+rs.getString(3));

											%>
											<tr>
											<td rowspan='<%=cnt%>' >
												<div class="d-flex px-2 py-1">
													<div>
														<img src="../assets/img/pdf.png"
															class="avatar avatar-sm me-3" alt="user1">
													</div>
													<div class="d-flex flex-column justify-content-center">
														<h6 class="mb-0 text-sm"><%=rs.getString(3)%></h6>
													</div>
												</div>
											</td>
											
											<td rowspan='<%=cnt%>'>
												<p class="text-xs font-weight-bold mb-0"><%=rs.getString(7)%></p>
											</td>
												
												<td  class="align-middle text-center text-sm"><span
												class="badge badge-sm bg-gradient-success"><%=rs.getString(4)%></span></td>
											<td class="align-middle text-center"><span
												class="text-secondary text-xs font-weight-bold">-</span></td>
											<td class="align-middle text-center"><span
												class="text-secondary text-xs font-weight-bold">-</span></td>
																
											<%
											System.out.println(cnt);
											} else {
											%>
											
										<td  class="align-middle text-center text-sm"><span
												class="badge badge-sm bg-gradient-success"><%=rs.getString(4)%></span></td>
											<td class="align-middle text-center"><span
												class="text-secondary text-xs font-weight-bold">-</span></td>
											<td class="align-middle text-center"><span
												class="text-secondary text-xs font-weight-bold">-</span></td>
											<%
											
											
											}
											temp = rs.getString(3);
											k=1;
											%>



											
										
</tr>
										<%
										}

										} catch (Exception e) {

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
		<footer class="footer pt-3  ">
			<div class="container-fluid">
				<div class="row align-items-center justify-content-lg-between">
					<div class="col-lg-6 mb-lg-0 mb-4">
						<div
							class="copyright text-center text-sm text-muted text-lg-start">
							©
							<script>
								document.write(new Date().getFullYear())
							</script>
							, made with <i class="fa fa-heart"></i> by <a
								href="https://www.creative-tim.com" class="font-weight-bold"
								target="_blank">Creative Tim</a> for a better web.
						</div>
					</div>
					<div class="col-lg-6">
						<ul
							class="nav nav-footer justify-content-center justify-content-lg-end">
							<li class="nav-item"><a href="https://www.creative-tim.com"
								class="nav-link text-muted" target="_blank">Creative Tim</a></li>
							<li class="nav-item"><a
								href="https://www.creative-tim.com/presentation"
								class="nav-link text-muted" target="_blank">About Us</a></li>
							<li class="nav-item"><a
								href="https://www.creative-tim.com/blog"
								class="nav-link text-muted" target="_blank">Blog</a></li>
							<li class="nav-item"><a
								href="https://www.creative-tim.com/license"
								class="nav-link pe-0 text-muted" target="_blank">License</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</div>

	</main>


	<!--   Core JS Files   -->
	<script src="./assets/js/core/popper.min.js"></script>
	<script src="./assets/js/core/bootstrap.min.js"></script>
	<script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script src="./assets/js/plugins/chartjs.min.js"></script>
	<script>
		var ctx1 = document.getElementById("chart-line").getContext("2d");

		var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

		gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
		gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
		gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
		new Chart(ctx1, {
			type : "line",
			data : {
				labels : [ "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
						"Nov", "Dec" ],
				datasets : [ {
					label : "Mobile apps",
					tension : 0.4,
					borderWidth : 0,
					pointRadius : 0,
					borderColor : "#5e72e4",
					backgroundColor : gradientStroke1,
					borderWidth : 3,
					fill : true,
					data : [ 50, 40, 300, 220, 500, 250, 400, 230, 500 ],
					maxBarThickness : 6

				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							padding : 10,
							color : '#fbfbfb',
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
					x : {
						grid : {
							drawBorder : false,
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							color : '#ccc',
							padding : 20,
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
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
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}
	</script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="../assets/js/argon-dashboard.min.js?v=2.0.4"></script>
	<script src="../assets/js/send-doc.js"></script>
</body>

</html>