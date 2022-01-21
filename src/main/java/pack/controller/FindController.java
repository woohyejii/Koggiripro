package pack.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

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
	
	@RequestMapping(value="find_pwd", method=RequestMethod.GET)
	public String find_pwd() {
		return "find_pwd";
	}
	
	@RequestMapping(value="find_pwd", method=RequestMethod.POST)
	public ModelAndView find_pwd2(UserBean ubean) {
		Random random=new Random();
		int i=random.nextInt(1000000000);
		i+=100000;
		String pwd=i+"2";
		UserBean bean=udinter.selectidUser(ubean.getId());
		bean.setPassword(pwd);
		udinter.updateUinfo(bean);
		
		ModelAndView andView=new ModelAndView("find_pwd_success");
		andView.addObject("pwd",pwd);
		andView.addObject("name", bean.getName());
		
		return andView;
	}
	
	
	@RequestMapping(value="chkAnswer", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> chkAnswer(
			@RequestParam("hint")String hint,
			@RequestParam("answer")String answer,
			@RequestParam("id")String id){
		
		//System.out.println("Find 결과 : "+hint +" "+answer+" "+id);
		UserBean ubean=new UserBean();
		ubean.setId(id);
		boolean b=udinter.useId(ubean);
		System.out.println("Find 결과2 : "+b);
		
		Map<String, String> map=new HashMap<String, String>();
		
		if(!b) {
			System.out.println("찍혀라");
			String uhint=udinter.selectidhint(id);
			String uanswer=udinter.selectidanswer(id);
			
			if(uhint.equals(hint)) {
				if(uanswer.equals(answer)) {
					map.put("result", "y");
					return map;
				}else {
					map.put("result", "n");
				}
			}else {
				map.put("result", "n");
			}
		}else {
			//System.out.println("여기가 찍히려나??");
			map.put("result", "n");
		}
		return map;
	}
}
