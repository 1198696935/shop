package service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import dao.ItemDao;
import pojo.Item;
import service.ItemService;

@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemDao itemDao;
	public boolean add(Item item) {
		// TODO Auto-generated method stub
		int flag = itemDao.add(item);
		if (flag == 1) {
			return true;
		} else
			return false;
	}
	public  ArrayList<Item> selectTid(Integer tid) {
		 ArrayList<Item> itemList = itemDao.selectTid(tid);
		
			return itemList;		
	}
	
	public Item selectIid(String iid) {
		// TODO Auto-generated method stub
		Item item=itemDao.selectIid(iid);
		return item;
	}
	
	public ArrayList<Item> selectSome(int page, int limit, String keyword) {
		// TODO Auto-generated method stub
		return itemDao.selectSome(keyword);
	}
	public void delIid(int iid) {
		// TODO Auto-generated method stub
		
	 itemDao.delIid(iid);
		
		
	}
	public ArrayList<Item> selectTitle(String title) {
		// TODO Auto-generated method stub
		return itemDao.selectTitle(title);
	}
}
