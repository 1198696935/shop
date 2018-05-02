package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.github.pagehelper.PageInfo;

import pojo.Detail;
import pojo.Item;
import pojo.Pager;
import service.DetailService;
import service.ItemService;

@Controller
@RequestMapping("/item")

public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private DetailService detailService;

	@RequestMapping("/itemList")
	public String admin() {

		return "itemList";
	}

	@RequestMapping("/itemAdd")
	public String userAdd() {

		return "itemAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public int add(HttpSession session, String title, Integer num, Double price, String description, Integer tid)
			throws Exception {
		if (session.getAttribute("item") != null) {
			Item item = (Item) session.getAttribute("item");
			item.setTitle(title);
			item.setNum(num);
			item.setPrice(price);
			item.setDescription(description);
			item.setTid(tid);
			if (itemService.add(item))
				return 1;
			   else return 0;
		}
		else
		return 0;	
	}
	
	
	@RequestMapping("/delIid")
	@ResponseBody
	public int delAid(ModelMap map, int iid) throws Exception {
		itemService.delIid(iid);
		return 1;
	}
	
	@RequestMapping("/selectSome")
	@ResponseBody
	public Pager<Item> selectSome(HttpSession session,Model model,int page, int limit, String keyword) throws Exception {
		
		ArrayList<Item> itemList = itemService.selectSome(page,limit, keyword);
		PageInfo<Item> pageInfo = new PageInfo<Item>(itemList);
		// 计算总行数
		int count = (int) pageInfo.getTotal();
		Pager<Item> pager = new Pager<Item>();
		pager.setData(itemList);
		pager.setCount(count);
		return pager;
		
	}
	
	@RequestMapping("/selectTitle")
	public String selectTitle(String title,ModelMap map) throws Exception {
		System.out.println("title"+title);
		ArrayList<Item>   itemList = itemService.selectTitle(title);
		map.addAttribute("itemList", itemList);
		for(Item i:itemList)
		{
			System.out.println(i.getDescription());
		}
		return "itemSelect";
	}
	
	@RequestMapping("/selectIid")
	/*根据商品Iid查询*/
	public String selectIid(String iid,ModelMap map)
			throws Exception {
		Item   item=itemService.selectIid(iid);
		 map.addAttribute("item", item);
		  ArrayList<Detail> detailList=detailService.selectHot();
          map.addAttribute("detailList",detailList);
			return "itemShow";
	}

	@RequestMapping("/tid")
	/*根据种类查询*/
	public String Tid(Integer tid,ModelMap map)
			throws Exception {
		 ArrayList<Item>   itemList=itemService.selectTid(tid);
		 map.addAttribute("itemList", itemList);
			return "itemSelect";
	}
	
	@RequestMapping("/pictureUpload")
	@ResponseBody
	public int pictureUpload(HttpSession session, @RequestParam(value = "file") MultipartFile file)
			throws IllegalStateException, IOException {
		String sqlPath = null;
		// 定义文件保存的本地路径
		String localPath = "C:\\ShopFile\\items\\";
		// 定义 文件名
		String filename = null;
		if (!file.isEmpty()) {
			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = file.getContentType();
			// 获得文件后缀名
			String suffixName = contentType.substring(contentType.indexOf("/") + 1);
			// 得到 文件名
			filename = uuid + "." + suffixName;
			// 文件保存路径
			file.transferTo(new File(localPath + filename));
			sqlPath = "/items/" + filename;
			System.out.println(sqlPath);
			Item item = new Item();
			item.setPicture(sqlPath);
			session.setAttribute("item", item);
		}
		return 1;
	}
}