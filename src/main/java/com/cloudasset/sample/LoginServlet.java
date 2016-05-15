package com.cloudasset.sample;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cloudasset.model.User;
import com.cloudasset.model.UserHelper;


@WebServlet("/LoginServlet.do")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		String responseJson = null;
		
		if(UserHelper.contains(user) && ((User)UserHelper.userMap.get(user)).password.equals(pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(30*60);
			responseJson ="{\"status\":\"success\"}";
		}else{
			responseJson ="{\"status\":\"Invalid username or password.\"}";
		}
		response.setContentType("application/json");
		response.getWriter().write(responseJson);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
