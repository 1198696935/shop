package service;

import java.util.ArrayList;

import pojo.Cart;

public interface CartService {
	boolean add(Cart cart);

	ArrayList<Cart> selectUid(int uid);

}
