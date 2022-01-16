package pack.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.model.UserDaoInter;

@Controller
public class modifyController {
	
	@Autowired
	private UserDaoInter daoInter;

	
	@RequestMapping(value="checkPwd5", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> checkPwd(
			@RequestParam("checkPwd")String checkPwd,
			@RequestParam("userNo")int userNo){
		
		String pwd=daoInter.selectNoPwd(userNo);
		System.out.println("modify 결과값 : "+checkPwd+" "+userNo+" "+pwd);
		Map<String, String> map=new HashMap<String, String>();
		
		
		
		boolean b=checkPwd.equals(pwd);
		System.out.println(b);
		if(b) {
			System.out.println("비밀번호가 일치합니다.");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("비밀번호가 일치하지 않습니다.");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
		
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public ModelAndView modify(
			@RequestParam("userNo")int userNo){
		
		UserBean ubean=daoInter.selectunoUser(userNo);
		
		ModelAndView andView=new ModelAndView();
		andView.addObject("ubean", ubean);
		return andView;
	}
	
	@RequestMapping(value="modify2", method=RequestMethod.POST)
	public ModelAndView modify2(
			@RequestParam("userNo")int userNo,
			@RequestParam("nName")String nName){
		
		UserBean ubean=daoInter.selectunoUser(userNo);
		ubean.setName(nName);
		
		ModelAndView andView=new ModelAndView("modify");
		andView.addObject("ubean", ubean);
		return andView;
	}
	
	@RequestMapping(value="modifySuccess", method=RequestMethod.POST)
	public String modifySuccess(
			UserBean bean,
			HttpSession session) {
		
		
		boolean b=daoInter.updateUinfo(bean);
		session.setAttribute("namekey",bean.getName());
		if(b) {
			return "modifySuccess";
		}else {
			return "err";
		}
	}
}
