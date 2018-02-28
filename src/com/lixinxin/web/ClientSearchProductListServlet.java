package com.lixinxin.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.lixinxin.domain.Category;
import com.lixinxin.domain.Product;
import com.lixinxin.domain.vo.Condition;
import com.lixinxin.domain.vo.PageBean;
import com.lixinxin.service.CategoryService;
import com.lixinxin.service.ProductService;

public class ClientSearchProductListServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Condition condition=new Condition();
		Map<String, String[]> map = request.getParameterMap();
		try {
			BeanUtils.populate(condition, map);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		ProductService service=new ProductService();
		List<Product> productList=null;
		try {
			productList=service.findProductBySearch(condition);
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
		request.setAttribute("condition", condition);
		request.getRequestDispatcher("/home.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}