package service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import dao.AddressDao;
import pojo.Address;
import pojo.User;
import service.AddressService;
@Service
public class AddressServiceImpl implements AddressService  {
           @Autowired 
           private AddressDao addressDao;
	public ArrayList<Address> selectAll(int uid) {
		// TODO Auto-generated method stub
		return addressDao.findAll(uid);
	}
	public boolean delAid(int aid,int uid) {
		// TODO Auto-generated method stub
		int flag;
		flag=addressDao.delAid(aid,uid);
		if(flag>0)
		{
			return true;
		}
		else 
			return false;
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

}
