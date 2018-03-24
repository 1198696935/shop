package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	public int add(HttpSession session,int uid, String user, String phone, String name, String other) throws Exception {
		Address address = new Address();
		address.setName(name);
		address.setPhone(phone);
		address.setUser(user);
		address.setOther(other);
		address.setUid(uid);
		if (addressService.add(address))
			return 1;
		else
			return 0;
	}
	@RequestMapping("/findAll")
	@ResponseBody
	public Pager<Address> findAll(Model model,int page, int limit, String keyword) throws Exception {
		Integer uid;
		uid=83;
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
	public void delAid(ModelMap map, int aid,int uid) throws Exception {
		if (addressService.delAid(aid,uid)) {

		} else {
		}
	}
}
