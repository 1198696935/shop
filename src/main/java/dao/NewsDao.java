package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import pojo.News;

public interface NewsDao {
	@Insert("insert into news(title,description,picture) values(#{title},#{description},#{picture})")
	public int add(News news);
	
	  @Select("select * from news")
	public ArrayList<News> findAll();
   
	  @Select("select * from news where nid=#{nid}")
	public News selectNid(Integer nid);
}
