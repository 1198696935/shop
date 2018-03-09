package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import pojo.Address;

public interface AddressDao {

	@Select(" select * from address where uid = #{uid} ")
	ArrayList<Address> findAll(Integer uid);

	@Delete("delete from address where aid=#{aid} and uid=#{uid}")
	int delAid(int aid, int uid);
}
