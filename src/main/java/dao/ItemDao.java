package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import pojo.Cart;
import pojo.Item;

public interface ItemDao {
	@Insert("insert into item(title,num,price,description,tid,picture) values(#{title},#{num},#{price},#{description},#{tid},#{picture})")
	public int add(Item item);
	
	 
    @Select(" select * from item where tid = #{tid} ")
	public ArrayList<Item> selectTid(Integer tid);

   /* @Select(" select * from item where title like concat('%',#{title},'%')")*/
	public ArrayList<Item> selectTitle(@Param("title")String title);

    @Select(" select * from item where iid = #{iid} ")
	public Item selectIid(String iid);
    
    public int  updateNum(Cart cart);

	public ArrayList<Item> selectSome(@Param("keyword")String keyword);

	@Delete("delete from item where iid=#{iid}")
	public void delIid(int iid);

}
