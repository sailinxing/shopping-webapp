package com.lixinxin.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lixinxin.domain.Product;

public class ClientDeleteCarServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// ³Ö¾Ã»¯
		String jid = session.getId();
		Cookie cookie = new Cookie("JSESSIONID", jid);
		cookie.setMaxAge(3600 * 24);
		response.addCookie(cookie);
		String pid = request.getParameter("pid");
		Object objCar = session.getAttribute("car");
		ArrayList<Product> productList = new ArrayList<>();
		if (objCar != null) {
			if (objCar instanceof ArrayList<?>) {
				ArrayList<?> list = (ArrayList<?>) objCar;
				boolean flag = true;
				for (Object object : list) {
					if (object instanceof Product) {
						Product pro = (Product) object;						
						if (flag) {
							if (pid.equals(pro.getPid())) {
								flag=false;
								continue;
							}
						}
						productList.add(pro);
					}
				}
			}
		}
		session.setAttribute("car", productList);
		request.getRequestDispatcher("/shoppingcar.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}