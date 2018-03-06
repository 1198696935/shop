package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;

import pojo.Cart;

public interface CartDao {
	
	/*@Insert("insert into cart(iid,uid,count) values(#{iid},#{uid},#{count})")
	int add(Cart cart);*/

	ArrayList<Cart> selectUid(int uid);
	int  add(Cart cart);

}
