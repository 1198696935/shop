package service;

import java.util.ArrayList;

import pojo.Order;

public interface OrderService {

	boolean add(Order order);
	ArrayList<Order> selectUid(Integer uid, int page, int limit, String keyword);

}
