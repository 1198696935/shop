package service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import pojo.Detail;

public interface DetailService {
	boolean add(Map<String, Object> map);
	
	ArrayList<Detail> selectOid(Integer oid);

}
