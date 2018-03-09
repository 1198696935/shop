package service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
