package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import pojo.Order;

public interface OrderDao {

	@Insert("insert into user_order(oid,payment,createTime,state,uid,username,phone,area,site) values(#{oid},#{payment},#{createTime},#{state},#{uid},#{username},#{phone},#{area},#{site})")
	void add(Order order);

	@Delete("delete from user_order where oid=#{oid}")
	void delOid(int oid);

	ArrayList<Order> select(@Param("uid")int uid,@Param("keyword")String keyword);

}
