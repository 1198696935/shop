package dao;

import pojo.Admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
	@Select(" select * from admin ")
	public ArrayList<Admin> findAll();

	@Select(" select * from admin where name = #{adminName} and pwd = #{pwd}")
	public Admin login(@Param("adminName") String adminName, @Param("pwd") String pwd);
}
