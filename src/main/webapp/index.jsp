<%@page import="com.ecommerceproject.dao.*"%>
<%@page import="com.ecommerceproject.factoryprovider.FactoryProvider"%>
<%@page import="com.ecommerceproject.entites.*"%>
<%@page import="com.ecommerceproject.helper.Helper" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp" %>
<%@include file="components/navbar.jsp" %>
</head>
<body>
<div class="row mt-3 mx-2">
<%
  String cat=request.getParameter("category");
ProductDao dao=new ProductDao(FactoryProvider.getFactory());
List<Product>list=null;
if(cat==null||cat.trim().equals("all")){
    list=dao.getAllProducts();
}else{
	int cid=Integer.parseInt(cat.trim());
	list=dao.getAllProductsById(cid);
	
}
CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
List<Category>clist=cdao.getCategories();
%>
<!-- show categories -->
<div class="col-md-2">
<div class="list-group mt-4">
  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
    All Products
  </a>
  <%
for(Category c:clist){
	%>
	<a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle() %></a>	

<% 
}

%>
</div>

</div>
<!-- show products -->
<div class="col-md-10">
<!-- row -->
<div class="row mt-4">
<!-- col:12 -->
<div class="col-md-12">
<div class="card-columns">
<!--traversing product-->
<%
for(Product p:list){
	
%>
<div class="card product-card">
<div class="container text-center">
<img src="img/products/<%=p.getPPhoto() %>" style="max-height:200px;max-width:100%;width:auto;" class ="card-img-top" alt="">
 
</div>
<div class="card-body">

<h5 class="card-title"><%=p.getPName() %></h5>
<p class="card-text">
<%= Helper.get10Words(p.getPDesc()) %>
</p>
</div>
<div class="card-footer text-center">
<button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getPId()%>, '<%=p.getPName() %>', <%= p.getPriceAfterApplyDiscount()%>)" > Add to Cart</button>
<button class="btn btn-outline-success">&#8377; <%=p.getPriceAfterApplyDiscount() %>/- <span class="text-secondary discount-label">&#8377; <%=p.getPPrice() %>,<%=p.getPDiscount() %>% off</span></button>

</div>

</div>

<%
}
if(list.size()==0){
	out.println("<h1>No item in this category</h1>");
}
%>


</div>

</div>
</div>
</div>

</div>
<%@include file="components/common_modal.jsp" %>
</body>
</html>