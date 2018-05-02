package service;

import java.util.ArrayList;

import pojo.Item;

public interface ItemService {
	public boolean add(Item item);

	public  ArrayList<Item> selectTid(Integer tid);

	public Item selectIid(String iid);

	public ArrayList<Item> selectSome(int page, int limit, String keyword);

	public void delIid(int iid);

	public ArrayList<Item> selectTitle(String title);
    
}
