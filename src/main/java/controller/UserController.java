package controller;

import java.util.ArrayList;


import javax.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import net.sf.json.JSONObject;
import com.github.pagehelper.PageInfo;

import pojo.Cell;
import pojo.Detail;
import pojo.News;
import pojo.Pager;
import pojo.User;
import service.DetailService;
import service.NewsService;
import service.UserService;
import util.sendsms;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
    private NewsService newsService;
	@Autowired
	private DetailService detailService;
	@RequestMapping("/home")
	public String userHome(ModelMap map) throws Exception  {
		 ArrayList<News>  newsList=newsService.selectAll();
          map.addAttribute("newsList",newsList);
          ArrayList<Detail> detailList=detailService.selectHot();
          map.addAttribute("detailList",detailList);
		return "home";
		}
	

	@RequestMapping("/personInformation")
	public String personInformation(HttpSession session,ModelMap map) {
		Integer uid=0;
		if (session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			 uid = user.getUid();
		}
		User personal=userService.selectUid(uid);
	System.out.println(personal.getUsername());
        map.addAttribute("personal",personal);
		return "personInformation";
	}
	
	@RequestMapping("/userLogin")
	public String userLogin() {

		return "login";
	}
	

	@RequestMapping("/userList")
	public String userlist() {

		return "userList";
	}

	@RequestMapping("/register")
	public String userRegister() {

		return "register";
	}

	@RequestMapping("/userAdd")
	public String userAdd() {

		return "userAdd";
	}

	@RequestMapping("/userEdit")
	public String useEdit() {

		return "userEdit";
	}

	
	@RequestMapping("/personal")
	public String personal() {
		
		return "personal";
	}

	
	@RequestMapping("/add")
	@ResponseBody
	public int add(HttpSession session, String username, String pwd, String sex, String phone) throws Exception {
		User user = new User();
		user.setUsername(username);
		user.setPwd(pwd);
		user.setSex(sex);
		user.setAddress("");
		user.setMoney(0.0);
		user.setPhone(phone);
		if (userService.add(user))
			return 1;
		else
			return 0;
	}

	@RequestMapping("/del")
	@ResponseBody
	public JSONObject del(Model model, int uid) throws Exception {
		JSONObject json = new JSONObject();
		if (userService.del(uid)) {
			json.put("state", "1");
		} else
			json.put("state", "0");
		return json;
	}

	@RequestMapping("/delSome")
	@ResponseBody
	public int delAll(@RequestParam(value = "ids[]") int[] ids) throws Exception {
		userService.delSome(ids);
		return 1;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public int edit(@Param("uid") int uid, @Param("username") String username, @Param("pwd") String pwd,
			@Param("sex") String sex, @Param("phone") String phone) throws Exception {
		User user = new User();
		user.setUid(uid);
		user.setUsername(username);
		user.setPwd(pwd);
		user.setSex(sex);
		user.setPhone(phone);
		if (userService.edit(user)) {
			return 1;

		} else {
			return 0;
		}
	}

	@RequestMapping("/selectSome")
	@ResponseBody
	public Pager<User> findAll(Model model, int page, int limit, String keyword) throws Exception {
		ArrayList<User> userList = userService.selectSome(page, limit, keyword);
		PageInfo<User> pageInfo = new PageInfo<User>(userList);
		// 计算总行数
		int count = (int) pageInfo.getTotal();
		Pager<User> pager = new Pager<User>();
		pager.setData(userList);
		pager.setCount(count);
		return pager;
	}

	@RequestMapping("/findPhone")
	@ResponseBody
	public int findPhone(String phone) throws Exception {
		if (userService.findPhone(phone)!=null)
			return 0;
		else
			return 1;
	}

	@RequestMapping("/findUserName")
	@ResponseBody
	public int findUserName(String username) throws Exception {
		if (userService.findUserName(username))
		{
			return 0;
		}
		else
		{
			return 1;
		}
	}

	@RequestMapping("/login")
	@ResponseBody
	public int login(String userName, String pwd, HttpSession session) throws Exception {
		User user = userService.login(userName, pwd);
		if (user == null) {
			return 1;
		} else
		{
			session.setAttribute("user", user);
			return 0;
		}

	}

	@RequestMapping("/phoneLogin")
	@ResponseBody
	public int phoneLogin(HttpSession session, String phone, Integer code) throws Exception {
		if (session.getAttribute("cell") != null) {
			Cell cell = (Cell) session.getAttribute("cell");
			if (code.equals(cell.getCode()) && phone.equals(cell.getPhone())) {
				User user=userService.findPhone(phone);
				session.setAttribute("user", user);
				return 1;
				
			} else
				return 2;
		}
		return 0;
	}
    //获取验证码
	@RequestMapping("/getCode")
	@ResponseBody
	public int getCode(HttpSession session, String phone) throws Exception {
		sendsms sms = new sendsms();
		int sms_code = (int) ((Math.random() * 9 + 1) * 100000); // 生成手机验证码
		sms.getSMS(sms_code, phone);
		Cell cell = new Cell();
		cell.setPhone(phone);
		cell.setCode(sms_code);
		session.setAttribute("cell", cell);
		return 1;
	}
    
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		 session.removeAttribute("user");  
		return "login";
	}
	
	@RequestMapping("/lun")
	public String lun(HttpSession session) {	
		return "lun";
	}
	
}
