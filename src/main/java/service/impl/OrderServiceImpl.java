package service.impl;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import dao.OrderDao;

import pojo.Order;
import service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	 private OrderDao orderDao;
	public boolean add(Order order) {
		// TODO Auto-generated method stub
		 orderDao.add(order);
		return true;
	}


	public ArrayList<Order> selectUid(Integer uid, int page, int limit, String keyword) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, limit);
		 ArrayList<Order> orderList = orderDao.selectUid(uid);
			return  orderList;
	}

}
