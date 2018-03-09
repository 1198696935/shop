package controller;

import service.AdminService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import net.sf.json.JSONObject;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("/login")
	@ResponseBody
	public JSONObject login(String adminName, String pwd, HttpSession session) throws Exception {
		JSONObject json = new JSONObject();
		if (adminService.login(adminName, pwd)) {
			session.setAttribute("adminName", adminName);

			json.put("msg", "1");
		} else
			json.put("msg", "0");
		return json;
	}

	@RequestMapping("/NewFile")
	public String NewFile() {
		return "NewFile";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		return "main";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}

	@RequestMapping("/welcome")
	public String welcome() {
		return "welcome";
	}
}