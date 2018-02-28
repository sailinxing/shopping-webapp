package com.lixinxin.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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

public class ShowOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			int uid = user.getUid();
			OrderService service = new OrderService();
			Map<Order, List<Product>> ordermap = new TreeMap<>();
			List<Order> orderList = null;
			try {
				orderList = service.findOrder(uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			OrderItemService service1 = new OrderItemService();
			for (Order order : orderList) {
				String oid = order.getOid();
				List<OrderItem> orderItemList = null;
				try {
					orderItemList = service1.findOrderItem(oid);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				List<Product> productList = new ArrayList<>();
				ProductService service2 = new ProductService();
				for (OrderItem orderItem : orderItemList) {
					String pid = orderItem.getPno();
					Product product = null;
					try {
						product = service2.findProductById(pid);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					productList.add(product);
				}
				ordermap.put(order, productList);
			}
			request.setAttribute("ordermap", ordermap);
			try {
				request.getRequestDispatcher("/orderlist.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("message", "Äú»¹Î´µÇÂ¼£¬ÇëµÇÂ¼£¡");
			try {
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}