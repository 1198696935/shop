package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;
import pojo.Order;
import pojo.Pager;
import pojo.User;
import service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;

	@RequestMapping("/order")
	public String order() throws Exception {
		{
			return "order";
		}
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public int addOrder(String orderData) throws Exception {
		JSONObject jsonObject = JSONObject.fromObject(orderData);
		Order order = (Order) JSONObject.toBean(jsonObject, Order.class);
		int oid = UUID.randomUUID().toString().hashCode();
		if (oid < 0) {// 有可能是负数
			oid = -oid;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createTime = df.format(new Date());
		order.setCreateTime(createTime);
		System.out.println(order.getCreateTime());
		order.setOid(oid);
		order.setStatus(0);
		orderService.add(order);
		return 1;
	}
	
	@RequestMapping("/selectUid")
	public Pager<Order> selectUid(Model model, int page, int limit, String keyword,HttpSession session) throws Exception {
		Integer uid=0;
		if (session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			 uid = user.getUid();
		}
		ArrayList<Order> orderList = orderService.selectUid(uid,page, limit, keyword);
		PageInfo<Order> pageInfo = new PageInfo<Order>(orderList);
		// 计算总行数
		int count = (int) pageInfo.getTotal();
		Pager<Order> pager = new Pager<Order>();
		pager.setData(orderList);
		pager.setCount(count);
		return pager;
		}
}
