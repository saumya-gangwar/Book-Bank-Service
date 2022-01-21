package com.cloudproject.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.cloudproject.beans.UserBean;
import com.cloudproject.db.LoginValidateDb;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(LoginServlet.class.getName());
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		log.info("Calling from Login Servlet");
		PrintWriter out = response.getWriter();
		UserBean user = new UserBean();
		user.setUserId(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		if(LoginValidateDb.validate(user)) {
			HttpSession session = request.getSession(true);
			session.setAttribute("userId", user.getUserId());
			response.sendRedirect("WelcomeHomePage.jsp");
		} else {
			out.println("<p><center>Sorry, you are not a registered user</center<</p>");
			request.getRequestDispatcher("UserLogin.jsp").include(request, response);
			out.close();
		}	
	}
}
