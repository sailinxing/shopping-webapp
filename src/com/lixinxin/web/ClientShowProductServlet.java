package com.lixinxin.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lixinxin.domain.Product;
import com.lixinxin.service.ProductService;

public class ClientShowProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");
		ProductService service=new ProductService();
		Product product = null;
		try {
			product = service.findProductById(pid);
		} catch (SQLException e) {
					e.printStackTrace();
		}
		request.setAttribute("product", product);
		request.getRequestDispatcher("/showProductDetail.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}