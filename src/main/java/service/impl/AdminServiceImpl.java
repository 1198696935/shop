package service.impl;

import pojo.Admin;
import service.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdminDao;

import java.util.ArrayList;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	public boolean login(String adminName, String pwd) {
		// TODO Auto-generated method stub

		Admin admin = adminDao.login(adminName, pwd);
		if (admin != null)
			return true;
		else
			return false;
	}

	public ArrayList<Admin> findAll() {
		// TODO Auto-generated method stub
		return adminDao.findAll();
	}

}
