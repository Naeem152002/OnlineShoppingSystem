
<%
User user=(User)session.getAttribute("current-user");
if(user==null){
	session.setAttribute("message","You are not logged in !! Login First to acess checkout page");
	response.sendRedirect("login.jsp");
	return;
}else{
	if(user.getUserType().equals("normal")){
		session.setAttribute("message","You are not admin !! Do not access this page");
		response.sendRedirect("login.jsp");
		return;	
	}
}

%>







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<h1>hello</h1>
<%@include file="components/common_modal.jsp" %>
<div class="container">

<div class="row">

<div class="col-md-6">
<!-- card -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-3">Your selected items</h3>
<div class="cart-body">

</div>


</div>

</div>

</div>
<div class="col-md-6">

<!-- form details -->
<!-- card -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-2">Your details for order</h3>

<form action="#!">

 <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
<div class="form-group">
    <label for="name">Your Name</label>
    <input  value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
  </div>
  <div class="form-group">
    <label for="name">Your phone</label>
    <input  value="<%= user.getUserPhone()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter phone">
  </div>
  <div class="form-group">
    <label for="phone">Your shipping Address</label>
    <textarea  value="<%= user.getUserAddress()%>"  class="form-control" id="example" placeholder="Enter your address"></textarea>
    </div>
    <div class="container text-center">
  <button class="btn btn-outline-success">Order Now</button>
  <button class="btn btn-outline-primary">Continue Shopping</button>
  </div>
</form>
</div>

</div>
</div>


</div>


</div>
</body>
</html>