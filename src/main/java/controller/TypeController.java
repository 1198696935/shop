package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import service.TypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
	
	@Autowired
	private TypeService typeService;
	
	@RequestMapping("/typeSelect")
	public String admin() {
		return "typeSelect";
	}

	@RequestMapping("/selectAll")
	@ResponseBody
	public List<Map<String, Object>> selectAll(HttpServletRequest request, HttpServletResponse response, int pid) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			list = typeService.selectAll(pid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
