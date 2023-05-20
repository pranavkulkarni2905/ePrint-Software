<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OTP Verification</title>
  <link rel="stylesheet" href="../assets/css/otp-page.css">
</head>
<body>
  <div class="container">
    <header></header>
    <h4>Enter OTP</h4>
    <p>We have sent you access code via SMS for mobile number verification</p>
    <form action="#">
      <div class="input-field">
        <input type="number" />
        <input type="number" disabled />
        <input type="number" disabled />
        <input type="number" disabled />
      </div>
      <button>Verify</button>
    </form>
    <p>Didn't receive the code <br> <a href="#" style="text-decoration: none;">Resend code</a></p>
  </div>

  <script src="../assets/js/otp-script.js"></script>

</body>
</html>