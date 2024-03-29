package com.ecommerceproject.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ecommerceproject.dao.CategoryDao;
import com.ecommerceproject.dao.ProductDao;
import com.ecommerceproject.entites.Category;
import com.ecommerceproject.entites.Product;
import com.ecommerceproject.factoryprovider.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String op=request.getParameter("operation");
		if(op.trim().equals("addcategory")) {
			//fatching category data
			
			String title=request.getParameter("catTitle");
			String description=request.getParameter("catDescription");
			
			Category category=new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			
			//category database save:
			
			CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
			int catId=categoryDao.saveCategory(category);
			
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message", "Category added successfully:"+catId);
			response.sendRedirect("admin.jsp");
			return ;
			
		}
		else if(op.trim().equals("addproduct"));
	String pName=request.getParameter("pName");
	String pDesc=request.getParameter("pDesc");
	int  pPrice=Integer.parseInt(request.getParameter("pPrice"));
	int  pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
	int  pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
	int  catId=Integer.parseInt(request.getParameter("catId"));
	Part part=request.getPart("pPic");
	
	Product p=new Product();
	p.setPName(pName);
	p.setPDesc(pDesc);
	p.setPPrice(pPrice);
	p.setPDiscount(pDiscount);
	p.setPQuantity(pQuantity);
	p.setPPhoto(part.getSubmittedFileName());

	//get category id
	CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
	Category category=cdao.getCategoryById(catId);
	
	p.setCategory(category);
	
	//product save....
	ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
	pdao.saveProduct(p);
	
//	find out the path to upload photo
	
	String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
	System.out.println(path);
	
	//uploading 
	try {
	FileOutputStream fos=new FileOutputStream(path);
	
	InputStream is=part.getInputStream();

	
	//reading data
	byte[]data=new byte[is.available()];
	is.read(data);
	
	//writing the data
	fos.write(data);
	fos.close();
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	HttpSession httpSession=request.getSession();
	httpSession.setAttribute("message", "Product added successfully");
	response.sendRedirect("admin.jsp");
	return ;
	
	
	
	}



	

	
}