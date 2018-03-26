package dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import pojo.Detail;

public interface DetailDao {

	int add(Map<String, Object> map);
	

	@Select(" select * from detail where oid = #{oid} ")
	ArrayList<Detail> selectOid(Integer oid);
}
