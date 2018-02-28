package com.lixinxin.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lixinxin.domain.Product;
import com.lixinxin.service.ProductService;

public class ClientBuyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//³Ö¾Ã»¯
		String jid = session.getId();
		Cookie cookie=new Cookie("JSESSIONID", jid);
		cookie.setMaxAge(3600*24);
		response.addCookie(cookie);
		String pid = request.getParameter("pid");		
		ProductService service=new ProductService();
		Product product = null;
		try {
			product = service.findProductById(pid);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		Object objCar = session.getAttribute("car");
		ArrayList<Product> productList = new ArrayList<>();
		if (objCar== null) {			
			productList.add(product);			
		}else{				
			if(objCar instanceof ArrayList<?>){
				ArrayList<?> list=(ArrayList<?>)objCar;
				for (Object object : list) {
					if(object instanceof Product){
						Product pro=(Product)object;
						productList.add(pro);
					}
				}
				productList.add(product);				
			}					
		}
		session.setAttribute("car",productList);
		request.setAttribute("product", product);
		request.getRequestDispatcher("/shoppingcar.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
