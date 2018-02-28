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
import com.lixinxin.domain.vo.PageBean;
import com.lixinxin.service.CategoryService;
import com.lixinxin.service.ProductService;


public class AdminShowProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService service = new ProductService();
		List<Product> productList = service.findAllProducts();
		CategoryService service1=new CategoryService();
		List<Category> categoryList =null;
		try {
			categoryList = service1.findAllCategorys();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PageBean<Product> pageBean=new PageBean<>();
		pageBean.setPageData(productList);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("categoryList", categoryList);		
		request.getRequestDispatcher("/admin/showProducts.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}