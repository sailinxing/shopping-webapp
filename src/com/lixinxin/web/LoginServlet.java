package com.lixinxin.web;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lixinxin.domain.User;
import com.lixinxin.service.UserService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// ��ʼ���������¼����
		private int loginCount = 0;
	@Override
	public void init() throws ServletException {
		super.init();
		ServletContext context = getServletContext();
		context.setAttribute("Count", loginCount);
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String autologin = request.getParameter("autologin");
		UserService service = new UserService();
		User user = service.login(username, password);
		HttpSession session = request.getSession();
		String word = (String) session.getAttribute("words");
		String checkcode = request.getParameter("checkcode");
		if (checkcode != null & !"".equals(checkcode)) {
			// �û����������ж�
			if (checkcode.equals(word)) {
				if (user != null) {
					if(autologin!=null&&!"".equals(autologin)){
					    username= user.getUsername();
					    password=user.getPassword();
					    String usernameEn=URLEncoder.encode(username, "utf-8");
						Cookie cookieUn=new Cookie("username",usernameEn);
						Cookie cookiePw=new Cookie("password",password);
						cookieUn.setMaxAge(60*60*24*7);
						cookiePw.setMaxAge(60*60*24*7);
						response.addCookie(cookieUn);
						response.addCookie(cookiePw);
					}
					// ��¼��¼������
					loginCount = (int) this.getServletContext().getAttribute("Count");
					loginCount++;
					this.getServletContext().setAttribute("Count", loginCount);					
					//�ض���
					session.setAttribute("user", user);
					response.sendRedirect(request.getContextPath()+"/index.jsp");
					} else {
					request.setAttribute("message", "�û��������������");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			} else {
				// ��֤��������
				request.setAttribute("message", "��֤���������");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			// δ����֤��������
			request.setAttribute("message", "��������֤�룡");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}