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
import pack.model.UserDto;

@Controller
public class SignupController {

	@Autowired
	private UserDaoInter daoInter;
	
	@RequestMapping(value="signup", method=RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public ModelAndView signupSubmit(UserBean bean) {
		//signup.jsp 페이지에서 값을 받아옴..
		int num=daoInter.currentMaxnum()+1; 
		bean.setUserNo(num);
		boolean b=daoInter.insert(bean);
		
		String name=bean.getName();
		String id=bean.getId();
		ModelAndView andView=new ModelAndView("signsuccess");
		andView.addObject("name", name);
		andView.addObject("id", id);
		
		return andView;
	}
	
	@RequestMapping(value="useId", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> useId(@RequestParam("useId")String useId){
		UserBean bean=new UserBean();
		bean.setId(useId);
		
		boolean b=daoInter.useId(bean);
		Map<String, String> map=new HashMap<String, String>();

		if(b) {
			System.out.println("사용할 수 있는 아이디입니다.");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("사용 불가합니다.");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
	}
	
	@RequestMapping(value="useName", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> useName(@RequestParam("useName")String useName){
		UserBean bean=new UserBean();
		bean.setName(useName);
		
		boolean b=daoInter.useName(bean);
		Map<String, String> map=new HashMap<String, String>();

		if(b) {
			System.out.println("사용할 수 있는 닉네임입니다.");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("사용 불가합니다.");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
	}
	
}
