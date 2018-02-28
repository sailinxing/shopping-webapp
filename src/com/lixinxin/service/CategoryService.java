package com.lixinxin.service;

import java.sql.SQLException;
import java.util.List;

import com.lixinxin.dao.CategoryDao;
import com.lixinxin.domain.Category;

public class CategoryService {

	public List<Category> findAllCategorys() throws SQLException {
		CategoryDao dao=new CategoryDao();
		List<Category> categoryList=dao.findAllCategorys();
		return categoryList;
	}

}
