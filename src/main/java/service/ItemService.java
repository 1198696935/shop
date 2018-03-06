package service;

import java.util.ArrayList;

import pojo.Item;

public interface ItemService {
	public boolean add(Item item);

	public  ArrayList<Item> selectTid(Integer tid);

	public ArrayList<Item> selectTitle(int page, int limit, String title);

	public Item selectIid(String iid);
    
}
