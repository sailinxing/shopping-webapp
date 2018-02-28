package com.lixinxin.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lixinxin.domain.Car;
import com.lixinxin.service.CarService;
public class ShowCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String oid = request.getParameter("oid");
			CarService service = new CarService();
			List<Car> carList=null;
			try {
				carList = service.findCarByOid(oid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("carList", carList);
			request.getRequestDispatcher("/carlist.jsp").forward(request,response);
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}