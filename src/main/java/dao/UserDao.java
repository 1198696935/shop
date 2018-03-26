package dao;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.User;

public interface UserDao {

	@Insert("insert into user(username,pwd,sex,phone,address,money) values(#{username},#{pwd},#{sex},#{phone},#{address},#{money})")
	public int add(User user);

	@Delete("delete from user where uid=#{uid}")
	public int del(int uid);

	public int delSome(int[] ids);



	@Select(" select * from user ")
	public ArrayList<User> findAll();

	@Select(" select * from user where username like '%${keyword}%'")
	public ArrayList<User> findUsername(@Param(value = "keyword") String keyword);
	
	@Select(" select * from user where username = #{userName} and pwd = #{pwd}")
	public User login(@Param("userName") String userName, @Param("pwd") String pwd);
	
	@Select(" select * from user where username = #{userName} ")
	public User findUserName(@Param("userName") String userName);
   
	@Select(" select * from user where phone = #{phone} ")
	public User findPhone(@Param("phone") String phone);

	@Select(" select * from user where uid = #{uid} ")
	public User selectUid(Integer uid);
	
	@Update("update user set username = #{username}, pwd = #{pwd},sex=#{sex},phone=#{phone} where uid = #{uid}")
	public int editUid(User user);
}
