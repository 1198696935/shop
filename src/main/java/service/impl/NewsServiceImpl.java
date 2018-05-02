package service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NewsDao;
import pojo.News;
import service.NewsService;
@Service
public class NewsServiceImpl implements NewsService {
       @Autowired
       private NewsDao newsDao;
	public boolean add(News news) {
		// TODO Auto-generated method stub
	   System.out.println("new.picture"+news.getPicture());
	   newsDao.add(news);
		return true;
	}
	public ArrayList<News> selectAll() {
		// TODO Auto-generated method stub	
			return newsDao.findAll();
	}
	public News selectNid(Integer nid) {
		// TODO Auto-generated method stub
		return newsDao.selectNid(nid);
	
	}
	public ArrayList<News> selectSome(int page, int limit, String keyword) {
		// TODO Auto-generated method stub
		return newsDao.selectSome(keyword);
	}
	public void delNid(int nid) {
		// TODO Auto-generated method stub
		newsDao.delNid(nid);		
	}
}
