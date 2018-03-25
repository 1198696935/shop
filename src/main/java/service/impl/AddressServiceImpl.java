package service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import dao.AddressDao;
import pojo.Address;
import service.AddressService;
@Service
public class AddressServiceImpl implements AddressService  {
           @Autowired 
           private AddressDao addressDao;
	public ArrayList<Address> selectAll(int uid) {
		// TODO Auto-generated method stub
		return addressDao.findAll(uid);
	}
	
	public ArrayList<Address> findAll(int uid,int page, int limit, String keyword) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, limit);
		if (keyword == null || keyword.isEmpty()) {
			return addressDao.findAll(uid);
		} 
		else
              return null;
			/*return addressDao.findUsername(keyword);*/
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
	public boolean delAid(int aid) {
		// TODO Auto-generated method stub
		addressDao.delAid(aid);
		return false;
	}

}
