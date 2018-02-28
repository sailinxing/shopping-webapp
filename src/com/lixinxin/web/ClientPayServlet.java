package com.lixinxin.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lixinxin.domain.Order;
import com.lixinxin.domain.OrderItem;
import com.lixinxin.domain.Product;
import com.lixinxin.domain.User;
import com.lixinxin.service.OrderItemService;
import com.lixinxin.service.OrderService;
import com.lixinxin.service.ProductService;

public class ClientPayServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			String[] pids = request.getParameterValues("selectBox");
			Order order = new Order();
			order.setUno(user.getUid());
			// simpleDateFormate sdf=new SimpleDateFormate();
			// String date=sdf.formate(new Date());
			order.setOrdertime(new Date());
			String oid = UUID.randomUUID().toString();
			order.setOid(oid);
			order.setState("paied");
			ProductService service = new ProductService();
			OrderItemService service1 = new OrderItemService();
			Double totalPrice = 0.0;
			if (pids != null) {
				for (String pid : pids) {
					Product product = null;
					try {
						product = service.findProductById(pid);
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
					double orderPrice = product.getShop_price();
					totalPrice += orderPrice;
					OrderItem orderItem = new OrderItem();
					orderItem.setPno(pid);
					orderItem.setOno(oid);
					try {
						service1.addOrderitem(orderItem);
					} catch (SQLException e) {
						e.printStackTrace();
					}

				}
				order.setTotalprice(totalPrice);
				OrderService service2 = new OrderService();
				try {
					service2.addOrder(order);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.removeAttribute("car");
				request.setAttribute("notice", "您已支付成功！");
				request.setAttribute("order",order);
				request.getRequestDispatcher("/shoppingcar.jsp").forward(request, response);
			}
			else{
				request.setAttribute("notice", "您未选择任何商品，支付失败！");
				request.getRequestDispatcher("/shoppingcar.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "您还未登录，请登录！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}