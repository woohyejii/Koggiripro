package pack.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.model.UserDaoInter;

@Controller
public class FindController {
	
	@Autowired
	private UserDaoInter udinter;

	@RequestMapping(value="find_id", method=RequestMethod.GET)
	public String find_id() {
		return "find_id";
	}
	
	@RequestMapping(value="find_id", method=RequestMethod.POST)
	public ModelAndView find_id2(UserBean bean) {
		String name=bean.getName();
		
		String id=udinter.selectNameUser(name).getId();
		
		if(id!=null) {

			ModelAndView andView=new ModelAndView("find_id_success");
			andView.addObject("name", name);
			andView.addObject("id", id);
			return andView;
		}else {
			
			ModelAndView andView=new ModelAndView("error2");
			return andView;
		}
		
		
		
	}
	
	@RequestMapping(value="nameOk", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> nameOk(@RequestParam("nameOk")String nameOk){
		
		
		boolean b=udinter.selectNameUser2(nameOk);
		Map<String, String> map=new HashMap<String, String>();
		
		if(b) {
			System.out.println("존재하는 닉네임");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("없는 닉네임");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
		
	}
}
