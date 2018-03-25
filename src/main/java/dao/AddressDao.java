package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.Address;
public interface AddressDao {

	
	@Insert("insert into address(username,phone,area,site,uid) values(#{username},#{phone},#{area},#{site},#{uid})")
	public int add(Address address);
	
	@Select(" select * from address where uid = #{uid} ")
	ArrayList<Address> findAll(Integer uid);

	@Delete("delete from address where aid=#{aid}")
	int delAid(int aid);

	@Update("update address set username= #{username},phone=#{phone},area=#{area},site=#{site}")
	public void edit(Address address);
}
