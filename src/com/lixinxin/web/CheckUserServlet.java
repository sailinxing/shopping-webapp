package com.lixinxin.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lixinxin.domain.User;
import com.lixinxin.service.UserService;

public class CheckUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		UserService service=new UserService();
		User user=null;
		try {
			user=service.findUser(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Gson gson=new Gson();
		String json = gson.toJson(user);
		if(json!=null){
			response.getWriter().write(json);
		}		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}