package service;

import java.util.ArrayList;

import pojo.News;

public interface NewsService {
 public boolean add(News news);
public ArrayList<News> selectAll();
public News selectNid(Integer nid);
}
