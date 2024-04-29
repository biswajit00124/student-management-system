package com.org.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String pwd = req.getParameter("password");

		UserDao dao = new UserDao();
		User user = dao.fetchUserfetchUserByEmailAndPassword(email, pwd); 
		HttpSession session2 = req.getSession();
		if (user != null) {
			session2.setAttribute("userobj", user);
			resp.sendRedirect("home.jsp");
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("fail", "Invalid Credentials");
			resp.sendRedirect("login.jsp");
		}

	}
}
