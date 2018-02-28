package com.lixinxin.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lixinxin.domain.Category;
import com.lixinxin.domain.Product;
import com.lixinxin.service.CategoryService;
import com.lixinxin.service.ProductService;

public class AdminShowEditProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");
		ProductService service=new ProductService();
		Product product=null;
		try {
		product=service.findProductById(pid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		CategoryService service1=new CategoryService();
		List<Category> categoryList=null;
		try {
			categoryList  = service1.findAllCategorys();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("product", product);
		request.getRequestDispatcher("/admin/editProduct.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}