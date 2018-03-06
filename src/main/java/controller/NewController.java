package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pojo.Item;
import pojo.News;
import service.AdminService;
import service.NewsService;

@Controller
@RequestMapping("/news")
public class NewController {
	
	 @Autowired
	 private NewsService newsService;
	
	@RequestMapping("/newsAdd")
	public String newsAdd() {
		System.out.println("新增");
		return "newsAdd";
	}
	
	
	@RequestMapping("/add")
	@ResponseBody
	public int add(HttpSession session, String title,  String description)
			throws Exception {
             System.out.println("title:/news/add"+title);
             System.out.println("description"+description);
		if (session.getAttribute("news") != null) {
			News news = (News) session.getAttribute("news");
			news.setTitle(title);
			news.setDescription(description);
            
			if (newsService.add(news))
				return 1;
			   else return 0;
		}
		else
		return 0;	
	}
	
	@RequestMapping("/newsShow")
	public String userHome(Integer nid,ModelMap map) throws Exception  {
		System.out.println("nid: "+nid);
		if(newsService.selectNid(nid)==null)
		{
			return "error";
		}
		else
		{
		News news=newsService.selectNid(nid);
		 map.addAttribute("news",news);
		return "newsShow";
		}	
	}
	
	
	@RequestMapping("/pictureUpload")
	@ResponseBody
	public int pictureUpload(HttpSession session,@RequestParam(value = "file") MultipartFile  file) throws IllegalStateException, IOException {	
		String sqlPath = null;   
	      //定义文件保存的本地路径  
	      String localPath="C:\\ShopFile\\news\\";  
	      //定义 文件名  
	      String filename=null;  
	      if(!file.isEmpty()){    
	          //生成uuid作为文件名称    
	          String uuid = UUID.randomUUID().toString().replaceAll("-","");    
	          //获得文件类型（可以判断如果不是图片，禁止上传）    
	         
	          String contentType=file.getContentType();    
	          //获得文件后缀名   
	          String suffixName=contentType.substring(contentType.indexOf("/")+1);  
	          //得到 文件名  
	          filename=uuid+"."+suffixName;   
	       
	          //文件保存路径  
	          file.transferTo(new File(localPath+filename));  
	          sqlPath = "/newsimg/"+filename;  
	        
	          News news =new News();
	          news.setPicture(sqlPath);  
	          System.out.println("news.getPicture()"+news.getPicture());  
	          session.setAttribute("news", news);
	        
	      }  
		return 1;
	}
}
