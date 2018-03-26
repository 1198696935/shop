package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import pojo.Detail;
import service.DetailService;

@Controller
@RequestMapping("/detail")
public class DetailController {

	@Autowired
	private DetailService detailService;

	@RequestMapping("/add")
	@ResponseBody
	public int addDetail(String itemList,HttpSession session) throws Exception {
		
		// 先把字符串转成JSONArray
		JSONArray jsonArray = JSONArray.fromObject(itemList);
		// 再把jsonArray转成对象集合
		@SuppressWarnings("unchecked")
		ArrayList<Detail> detailList = (ArrayList<Detail>) JSONArray.toCollection(jsonArray, Detail.class);
		 int oid=(Integer) session.getAttribute("oid");
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("detailList", detailList); 
		 map.put("oid",oid);//订单编号
		 detailService.add(map);
		return 1;
	}

	@RequestMapping("/selectOid")
	public String selectOid(Integer oid, ModelMap map) throws Exception {
		{
			ArrayList<Detail> detailList = detailService.selectOid(oid);
			System.out.println("dddddf");
			for(Detail i:detailList)
			{
				System.out.println("ddd"+i.getPicture());
			}
			map.addAttribute("detailList", detailList);
			return "detail";
		}
	}
}
