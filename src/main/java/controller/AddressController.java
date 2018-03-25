package controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageInfo;
import pojo.Address;
import pojo.Pager;
import pojo.User;
import service.AddressService;

@Controller
@RequestMapping("/address")
public class AddressController {
	@Autowired
	private AddressService addressService;
	
	@RequestMapping("/addressList")
	public String addressList() {

		return "addressList";
	}
	
     /*购物车页面显示*/
	@RequestMapping("/selectAll")
	@ResponseBody
	public ArrayList<Address>  selectAll(int uid) throws Exception {
		ArrayList<Address> addressList = addressService.selectAll(uid);
		for (Address i : addressList) {
			System.out.println(i.toString());
		}
		return addressList;
	}
	
	
	@RequestMapping("/add")
	@ResponseBody
	public int add(HttpSession session,int uid, String username, String phone, String area, String site) throws Exception {
		Address address = new Address();
		System.out.println("地址");
		address.setUsername(username);
		address.setPhone(phone);
		address.setArea(area);
		address.setSite(site);
		address.setUid(uid);
		if (addressService.add(address))
			return 1;
		else
			return 0;
	}
	@RequestMapping("/findAll")
	@ResponseBody
	public Pager<Address> findAll(HttpSession session,Model model,int page, int limit, String keyword) throws Exception {
		Integer uid;
		if (session.getAttribute("user") != null) {
			User user= (User) session.getAttribute("user");
			uid=user.getUid();
		}
		ArrayList<Address> addressList = addressService.findAll(uid,page, limit, keyword);
		PageInfo<Address> pageInfo = new PageInfo<Address>(addressList);
		// 计算总行数
		int count = (int) pageInfo.getTotal();
		Pager<Address> pager = new Pager<Address>();
		pager.setData(addressList);
		pager.setCount(count);
		return pager;
	}
	

	@RequestMapping("/delAid")
	@ResponseBody
	public int  delAid(ModelMap map, int aid) throws Exception {
		addressService.delAid(aid);	
		 return 1;
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public int edit(int aid,String username,String phone,String area,String site) throws Exception {
		Address address=new Address();
		address.setUsername(username);
		address.setPhone(phone);
		address.setArea(area);
		address.setSite(site);
		if (addressService.edit(address)) {
			return 1;

		} else {
			return 0;
		}
	}
}
