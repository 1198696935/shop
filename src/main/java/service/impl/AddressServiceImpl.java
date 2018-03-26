package service.impl;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import dao.AddressDao;
import pojo.Address;
import service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {
	@Autowired
	private AddressDao addressDao;

	public ArrayList<Address> selectAll(int uid) {
		// TODO Auto-generated method stub
		return addressDao.findUid(uid);
	}

	public boolean delAid(int aid) {
		// TODO Auto-generated method stub
		int flag;
		flag = addressDao.delAid(aid);
		if (flag > 0) {
			return true;
		} else
			return false;
	}

	public boolean add(Address address) {
		// TODO Auto-generated method stub
		addressDao.add(address);
		return true;
	}

	public boolean edit(Address address) {
		// TODO Auto-generated method stub
		addressDao.edit(address);
		return true;
	}

	public ArrayList<Address> find(Integer uid, int page, int limit, String keyword) {
		PageHelper.startPage(page, limit);
		// TODO Auto-generated method stub
		return addressDao.find(uid, keyword);
	}

}
