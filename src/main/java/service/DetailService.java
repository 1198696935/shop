package service;

import java.util.ArrayList;
import java.util.Map;

import pojo.Detail;

public interface DetailService {
	boolean add(Map<String, Object> map);
	
	ArrayList<Detail> selectOid(Integer oid);

	ArrayList<Detail> selectHot();

	ArrayList<Detail> selectSale();

}
