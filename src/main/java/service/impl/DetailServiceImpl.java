package service.impl;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.DetailDao;
import pojo.Detail;
import service.DetailService;

@Service
public class DetailServiceImpl implements DetailService {
	@Autowired
	private DetailDao detailDao;
	
	public boolean add(Map<String, Object> map) {
		// TODO Auto-generated method stub
		detailDao.add(map);
		return true;
	}

	public ArrayList<Detail> selectOid(Integer oid) {
		// TODO Auto-generated method stub
		 ArrayList<Detail> detailList = detailDao.selectOid(oid);
			return  detailList;
	}

}