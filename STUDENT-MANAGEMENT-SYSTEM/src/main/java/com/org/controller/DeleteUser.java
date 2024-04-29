package com.org.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
//		String name = req.getParameter("name");
//		int age = Integer.parseInt(req.getParameter("age"));
//		long mobile = Long.parseLong(req.getParameter("mobile"));
//		String email = req.getParameter("email");
//		String password = req.getParameter("password");
//		
		UserDao dao = new UserDao();
		User user = new User();
		user.setId(id);
//		user.setName(name);
//		user.setAge(age);
//		user.setMobile(mobile);
//		user.setEmail(email);
//		user.setPassword(password);
//		
		dao.deleteUserById(id);
		HttpSession session = req.getSession();
		session.setAttribute("deleted", "user deleted successfully");
		resp.sendRedirect("all-users-list.jsp");
		
	}
}
