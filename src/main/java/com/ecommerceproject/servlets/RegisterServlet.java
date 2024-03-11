package com.ecommerceproject.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.ecommerceproject.entites.User;
import com.ecommerceproject.factoryprovider.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		try {
		String userName=request.getParameter("userName");	
		String userEmail=request.getParameter("userEmail");	
		String userPassword=request.getParameter("userPassword");	
		String userPhone=request.getParameter("userPhone");	
		String userAddress=request.getParameter("userAddress");
		
		User user=new User(userName,userEmail,userPassword,userPhone,"default.jpg",userAddress,"normal");
		
		SessionFactory sessionFactory=FactoryProvider.getFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
	   int  userId=(int)session.save(user);
		session.getTransaction().commit();
		session.close();
		
		
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("message", "Registration Succesfull !! User id is"+userId);
		response.sendRedirect("register.jsp");
return;
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
	}

}
