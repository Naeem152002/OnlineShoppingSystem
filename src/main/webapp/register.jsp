<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="components/common_css_js.jsp" %>
<%@include file="components/navbar.jsp" %>
</head>
<body>
<div class="container-fluid">
<div class="row mt-5">
<div class="col-md-4 offset-md-4">
<div class="card">
<%@include file="components/message.jsp" %>
<div class="card-body px-4">

<h3 class="text-center my-3">
<i class="fa fa-shopping-cart " style="font-size:36px"></i>

Sign up here !!</h3>

<form action="RegisterServlet" method="post">
  <div class="form-group">
    <label for="name">User Name</label>
    <input name="userName" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
  </div>
  <div class="form-group">
    <label for="email">User Email</label>
    <input name="userEmail"type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
  </div>
  <div class="form-group">
    <label for="password">User Password</label>
    <input name="userPassword" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">
  </div>
  <div class="form-group">
    <label for="phone">User Phone</label>
    <input name="userPhone"type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Phone">
  </div>
  <div class="form-group">
    <label for="phone">User Address</label>
    <textarea name="userAddress"  style="height:100px;" class="form-control" placeholder="Enter your address"></textarea>
    </div>
  <div class="container text-center">
  <button class="btn btn-outline-success">Register</button>
  <button class="btn btn-outline-warning">Reset</button>
  </div>
</form>
</div>
</div>
</div>

</div>
</div>

</body>
</html>