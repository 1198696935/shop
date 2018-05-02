package service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import dao.UserDao;
import pojo.User;
import service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	public boolean add(User user) {
		// TODO Auto-generated method stub
		int flag = userDao.add(user);
		if (flag == 1) {
			return true;
		} else
			return false;
	}

	public boolean del(int uid) {
		// TODO Auto-generated method stub
		int flag = userDao.del(uid);
		if (flag == 1) {
			return true;
		} else
			return false;
	}

	public boolean delSome(int[] ids) {
		int flag = userDao.delSome(ids);
		for (int i : ids) {
			System.out.println(i);
		}
		return true;
	}

	public boolean edit(User user) {
		int flag = userDao.editUid(user);
		if (flag == 1) {
			return true;
		} else
			return false;
	}

	public User login(String userName, String pwd) {
		// TODO Auto-generated method stub
		return  userDao.login(userName, pwd);

	}

	public boolean findUserName(String userName) {
		// TODO Auto-generated method stub
		if(userDao.findUserName(userName)==null)	
			return false;
		 else 
			return true;
	}

	public User findPhone(String phone) {
		// TODO Auto-generated method stub
		return userDao.findPhone(phone);
	}

	public User selectUid(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.selectUid(uid);
	}


	public ArrayList<User> selectSome(int page, int limit, String keyword) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, limit);
		return userDao.selectSome(keyword);
	}
}
