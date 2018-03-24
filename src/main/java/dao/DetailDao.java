package dao;

import java.util.ArrayList;
import java.util.Map;

import pojo.Detail;

public interface DetailDao {

	int add(Map<String, Object> map);
	/*public int delSome(int[] ids);*/
	ArrayList<Detail> selectUid(int uid);

	

}
