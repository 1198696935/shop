package service;

import java.util.ArrayList;

import pojo.User;

public interface UserService {
	public boolean add(User user);
	public boolean del(int uid);
	public boolean delSome(int ids[]);
	public boolean edit(User user);
	public User login(String userName, String pwd);
	public boolean findUserName(String userName);
	public User findPhone(String phone);
	public User selectUid(Integer uid);
	public ArrayList<User> selectSome(int page, int limit, String keyword);

}
