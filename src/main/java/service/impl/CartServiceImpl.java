package service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.CartDao;
import dao.ItemDao;
import pojo.Cart;
import pojo.Item;
import service.CartService;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;
    private ItemDao itemDao;
	public boolean add(Cart cart) {
		// TODO Auto-generated method stub
		int flag=cartDao.add(cart);
		
		if(flag>0)
		{   
			return true;
		}
		else
		{
			return false;
		}
	}

	public ArrayList<Cart> selectUid(int uid) {
		// TODO Auto-generated method stub
		 ArrayList<Cart> cartList = cartDao.selectUid(uid);
		return  cartList;
	}

}
