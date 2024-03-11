package com.ecommerceproject.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerceproject.dao.UserDao;
import com.ecommerceproject.entites.User;
import com.ecommerceproject.factoryprovider.FactoryProvider;

public class LoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        UserDao userDao=new UserDao(FactoryProvider.getFactory());
		 User user = userDao.getUserByEmailAndPassword(userEmail,userPassword);
        HttpSession httpSession=request.getSession();
    if(user==null) {
    	out.println("<h1>invalid details<h1>");
		httpSession.setAttribute("message", "Invalid Details !! Try with another one");
		response.sendRedirect("login.jsp");
       return;
    }else {
   	httpSession.setAttribute("current-user", user);
   	
	if(user.getUserType().equals("admin")) {
	response.sendRedirect("admin.jsp");
	}
	else if(user.getUserType().equals("normal")) {
 		response.sendRedirect("normal.jsp");
 	}
   	else {
    		out.println("We have not identified user type");
   	}
   }
   }}

