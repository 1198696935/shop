package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import pojo.Order;

public interface OrderDao {

	@Insert("insert into user_order(oid,payment,create_time,status,uid,username,phone,address,other) values(#{oid},#{payment},#{createTime},#{status},#{uid},#{username},#{phone},#{address},#{other})")
	void add(Order order);

	@Select(" select * from user_order where uid=#{uid}")
	ArrayList<Order> selectUid(Integer uid);
}
