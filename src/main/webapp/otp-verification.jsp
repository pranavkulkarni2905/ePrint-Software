<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OTP Verification</title>
  <link rel="stylesheet" href="assets/css/otp-page.css">
 
 <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
String otp=(String)session.getAttribute("otp");
String email=(String)session.getAttribute("email");
boolean msg = (boolean) session.getAttribute("register-success");
if (msg==true) {
	%>
	<script type="text/javascript">
		Swal.fire('Congratulations!', 'Registration successfully.We have sent otp for verification to your email -id.')
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		Swal.fire('Oops!', 'Something went wrong..')
	</script>
	<% 
}
%>

  <div class="container">
    <header><img src="otp.webp" width="240px" height="240px"></header>
    <h4>Enter OTP</h4>
    <p>We have sent you access code via email for Email  Id verification</p>
    <form action="OtpVerificationController" method="post">
      <div class="input-field">
      <input type="hidden" name="otp" value="<%=otp %>">
      <input type="hidden" name="email" value="<%=email %>">
        <input type="number" name="1" />
        <input type="number" name="2" disabled />
        <input type="number" name="3" disabled />
        <input type="number" name="3" disabled />
      </div>
      <button type="submit">Verify</button>
    </form>
    <p>Didn't receive the code <br> <a href="#" style="text-decoration: none;">Resend code</a></p>
  </div>

  <script src="assets/js/otp-script.js"></script>

</body>
</html>