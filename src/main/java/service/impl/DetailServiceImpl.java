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
	

	public ArrayList<Detail> selectUid(int uid) {
		// TODO Auto-generated method stub
		 ArrayList<Detail> detailList = detailDao.selectUid(uid);
		return  detailList;
	}

	public boolean add(Map<String, Object> map) {
		// TODO Auto-generated method stub
		detailDao.add(map);
		return true;
	}

}