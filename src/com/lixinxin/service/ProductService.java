package com.lixinxin.service;

import java.sql.SQLException;
import java.util.List;

import com.lixinxin.dao.ProductDao;
import com.lixinxin.domain.Product;
import com.lixinxin.domain.vo.Condition;
import com.lixinxin.domain.vo.PageBean;

public class ProductService {

	public List<Product> findAllProducts() {
		ProductDao dao = new ProductDao();
		List<Product> productList = null;
		try {
			productList = dao.findAllProducts();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}

	public void addProduct(Product product) throws SQLException {
		ProductDao dao = new ProductDao();
		dao.addProduct(product);
	}

	public Product findProductById(String pid) throws SQLException {
		ProductDao dao = new ProductDao();
		Product product = dao.findProductById(pid);
		return product;
	}

	public void editProduct(Product product) throws SQLException {
		ProductDao dao = new ProductDao();
		dao.editProduct(product);
	}

	public void deleteAllProduct(String[] deleteBoxes) throws SQLException {
		ProductDao dao = new ProductDao();
		for (String pid : deleteBoxes) {
			dao.deleteProduct(pid);
		}
	}

	public void deleteProductById(String pid) throws SQLException {
		ProductDao dao = new ProductDao();
		dao.deleteProduct(pid);
	}

	public List<Product> findProductBySearch(Condition condition) throws SQLException {
		ProductDao dao = new ProductDao();
		List<Product> productList = dao.findProductBySearch(condition);
		return productList;
	}

	public PageBean<Product> findAllProductsByPageBean(int currentPageInt, int currentCount) throws SQLException {
		ProductDao dao = new ProductDao();
		Object totalCountObj = dao.getTotalCount();
		Long totalCountLong = (Long) totalCountObj;
		int totalCount = totalCountLong.intValue();
		double totalPageDouble = Math.ceil(totalCount * 1.0 / currentCount);
		int totalPage = (int) totalPageDouble;
		int pageIndex = (currentPageInt - 1) * currentCount;
		List<Product> pageData = null;
		pageData = dao.findProductByLimit(pageIndex, currentCount);
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setPageData(pageData);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	public List<Product> findProductByWord(String word) throws SQLException {
		ProductDao dao=new ProductDao ();
		List<Product> productList=dao.findProductByWord(word);
		return productList;
	}

//	public PageBean<Product> getPageBeanBySerach(int currentPageInt, int currentCount, List<Product> productList) {
//		PageBean<Product> pageBean = new PageBean<>();
//		int totalCount = productList.size();// 总记录数
//		int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);// 总页数
//		List<Product> pageData = new ArrayList<>();
//		if (currentPageInt == totalPage) {
//			for (int i = (currentPageInt - 1) * currentCount; i < totalCount
//					- (currentPageInt - 1) * currentCount; i++) {
//				pageData.add(productList.get(i));
//			}
//
//		} else {
//			for (int i = (currentPageInt - 1) * currentCount; i < currentPageInt * currentCount; i++) {
//				pageData.add(productList.get(i));
//
//			}
//		}
//		pageBean.setCurrentCount(currentCount);
//		pageBean.setCurrentPage(currentPageInt);
//		pageBean.setPageData(pageData);
//		pageBean.setTotalCount(totalCount);
//		pageBean.setTotalPage(totalPage);
////		System.out.println(currentCount);
////		System.out.println(currentPageInt);
////		System.out.println(totalCount);
////		System.out.println(totalPage);
//		return pageBean;
//	}

}
