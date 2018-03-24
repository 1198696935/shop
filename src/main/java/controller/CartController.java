package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Cart;
import service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartService cartService;

	@RequestMapping("/add")
	@ResponseBody
	public int addCart(HttpSession session, Integer iid, Integer count, Integer uid) throws Exception {
		Cart cart = new Cart();
		cart.setIid(iid);
		cart.setCount(count);
		cart.setUid(uid);
		if (cartService.add(cart)) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@RequestMapping("/delCid")
	@ResponseBody
	public int delCid(Integer cid) throws Exception {	
		cartService.delCid(cid);	
		return 0;
	}
	
	@RequestMapping("/cart")
	public String cart(Integer uid,ModelMap map)throws Exception{
	{
			 ArrayList<Cart>   cartList=cartService.selectUid(uid);
			 map.addAttribute("cartList", cartList);
				return "cart";
	}	
	}
}
