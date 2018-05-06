package service;

import pojo.Admin;
import java.util.ArrayList;

public interface AdminService {
	public Admin login(String adminName, String pwd);
  
	public ArrayList<Admin> findAll();
}
