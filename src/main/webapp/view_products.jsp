<%@page import="com.ecommerceproject.entites.*"%>
<%@include file="components/navbar.jsp" %>
<%@include file="components/common_modal.jsp" %>
<% 
User user=(User)session.getAttribute("current-user");
if(user==null){
	session.setAttribute("message","You are not logged in !! Login First");
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
<title>view all products </title>
</head>
<body>
<h1>hello</h1>
</body>
</html>