package dao;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.Address;

public interface AddressDao {

	
	@Insert("insert into address(username,phone,area,site,uid) values(#{username},#{phone},#{area},#{site},#{uid})")
	public int add(Address address);

	@Delete("delete from address where aid=#{aid}")
	int delAid(int aid);

	@Update("update address set username= #{username},phone=#{phone},area=#{area},site=#{site} where aid=#{aid}")
	public void edit(Address address);

	public ArrayList<Address> find(@Param("uid")Integer uid,@Param("keyword")String keyword);

	@Select(" select * from address where uid = #{uid} ")
	public ArrayList<Address> findUid(int uid);
}
