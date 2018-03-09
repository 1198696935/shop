package controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Address;
import service.AddressService;

@Controller
@RequestMapping("/address")
public class AddressController {
	@Autowired
	private AddressService addressService;

	@RequestMapping("/selectAll")
	@ResponseBody
	public void selectAll(ModelMap map, int uid) throws Exception {
		ArrayList<Address> addressList = addressService.selectAll(uid);
		for (Address i : addressList) {
			System.out.println("地址" + i.getArea());
		}
		map.addAttribute("addressList", addressList);
	}

	@RequestMapping("/delAid")
	@ResponseBody
	public void delAid(ModelMap map, int aid,int uid) throws Exception {
		if (addressService.delAid(aid,uid)) {

		} else {
		}
	}
}
