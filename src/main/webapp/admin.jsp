<%@page import="com.ecommerceproject.entites.*"%>
<%@page import="com.ecommerceproject.dao.CategoryDao"%>
<%@page import="com.ecommerceproject.factoryprovider.FactoryProvider"%>
<%@page import="java.util.*"%>
<%@page import="com.ecommerceproject.helper.Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
 <%
        CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
        List<Category>list=cdao.getCategories();
        
        
        //getting count
      Map<String,Long>m=Helper.getCounts(FactoryProvider.getFactory());
        %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container admin">
<div class="container-fluid">
<%@include file="components/message.jsp" %>
</div>
<div class="row mt-3">
<!-- first col -->
<div class="col-md-4">

<div class="card"  data-toggle="tooltip" data-placement="bottom" title="Number of users in this website">
<div class="card-body text-center">
<div class="container">
<img style="max-width:150px;"class="img-fluid rounded-circle" src="img/users.png" alt="user_icon">
</div>
<h1><%=m.get("userCount") %></h1>
<h1 class="text-uppercase text-muted">Users</h1>
</div>
</div>
</div>

<!-- second col -->
<div class="col-md-4">
<div class="card" data-toggle="tooltip" data-placement="top" title="Number of categories in this website">
<div class="card-body text-center">
<div class="container">
<img style="max-width:150px;"class="img-fluid rounded-circle" src="img/category.png" alt="category_icon">
</div>
<h1><%=list.size() %></h1>
<h1 class="text-uppercase text-muted">Categories</h1>
</div>
</div>
</div>

<!-- third col -->
<div class="col-md-4">

<div class="card" data-toggle="tooltip" data-placement="bottom" title="Number of Products in this website">>
<div class="card-body text-center">
<div class="container">
<img style="max-width:150px;"class="img-fluid rounded-circle" src="img/product.png" alt="product_icon">
</div>
<h1><%=m.get("productCount") %></h1>
<h1 class="text-uppercase text-muted">Products</h1>



</div>
</div>
</div>
</div>
<!-- second row -->
<!-- first col -->
<div class="row mt-3">

<div class="col-md-6">
<div class="card" data-toggle="modal" data-target="#add-category-model">
<div class="card-body text-center">
<div class="container">
<img style="max-width:150px;"class="img-fluid rounded-circle" src="img/add category.png" alt="addcategory_icon">
</div>
<p class="mt-2">Click here to add new Category</p>
<h1 class="text-uppercase text-muted">Add Category</h1>
</div>
</div>
</div>

<!-- second col -->
<div class="col-md-6">
<div class="card"  data-toggle="modal" data-target="#add-product-model">
<div class="card-body text-center">
<div class="container">
<img style="max-width:150px;"class="img-fluid rounded-circle" src="img/add-to-cart.png" alt="cart_icon">
</div>
<p class="mt-2">Click here to add new Product</p>
<h1 class="text-uppercase text-muted">Add Product</h1>
</div>
</div>
</div>
</div>
<!-- view products row  -->
<div class="row mt-2">
<div class="col-md-12">
<div onclick="window.location='view_products.jsp'"class="card"  data-toggle="modal" data-target="click here all the products">
<div class="card-body text-center">
<div class="container">
<img style="max-width:150px;"class="img-fluid rounded-circle" src="img/seo.png" alt="cart_icon">
</div>
<p class="mt-2">Click here to view all the  Products</p>
<h1 class="text-uppercase text-muted">View Product</h1>
</div>
</div>
</div>
</div>

<!-- view products end -->



</div>
<!-- Add category model start -->

<!-- Modal -->
<div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="P" method="post">
       <input type="hidden" name="operation" value="addcategory"/>
        <div class="form-group">
        <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
        </div>
        <div class="form-group">
        <textarea style="height:350px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
        </div>
        <div class="container text-center">
        <input type="submit" class="btn btn-primary" value="Add Category" >
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
      
    </div>
  </div>
</div>
<!-- Add category model end -->
<!-- ************************************************************************************* -->
<!-- Add Product model start -->

<!-- Modal -->
<div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- form ********* -->
        <form action="P" method="post" enctype="multipart/form-data">
        <input type="hidden" name="operation" value="addproduct"/>
        <div class="form-group">
        <input type="text" class="form-control"  placeholder="Enter title of product" name="pName" required/>
        </div>
        <div class="form-group">
        <textarea style="height:150px;" class="form-control" placeholder="Enter category description"  name="pDesc" required></textarea>
        </div>
        <div class="form-group">
        <input type="number" class="form-control"  placeholder="Enter price of product" name="pPrice" required/>
        </div>
        <div class="form-group">
        <input type="number" class="form-control"  placeholder="Enter product discount" name="pDiscount" required/>
        </div>
        <div class="form-group">
        <input type="number" class="form-control"  placeholder="Enter product Quantity" name="pQuantity" required/>
        </div>
        <!-- product category -->
       
        
        <div class="form-group">
      <select name="catId" class="form-control" id="">
       <% for(Category c:list){
        %>
        <option value="<%=c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
       <%
       }
        %>
     </select>
        </div>
      <div class="form-group">
        <label for="pPic">Select Picture of Product</label>
        <br>
        <input type="file" id="pPic" name="pPic" required/>
        </div>
        <div class="container text-center">
        <input type="submit" class="btn btn-primary" value="Add Product" >
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        </form>
     </div>
      
    </div>
  </div>
</div>
<!-- Add Product model end -->
<%@include file="components/common_modal.jsp" %>
<script>
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})

</script>
</body>
</html>