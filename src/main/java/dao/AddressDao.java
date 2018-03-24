package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import pojo.Address;
import pojo.User;

public interface AddressDao {

	
	@Insert("insert into address(user,phone,name,other) values(#{user},#{phone},#{name},#{other})")
	public int add(User user);
	
	@Select(" select * from address where uid = #{uid} ")
	ArrayList<Address> findAll(Integer uid);

	@Delete("delete from address where aid=#{aid} and uid=#{uid}")
	int delAid(int aid, int uid);
}
