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

import pack.model.CommDaoInter;
import pack.model.CommentDto;
import pack.model.UserDaoInter;

@Controller
public class modifyController {
	
	@Autowired
	private UserDaoInter daoInter;
	
	@Autowired
	private CommDaoInter cdinter;

	
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
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public ModelAndView modify(
			@RequestParam("userNo")int userNo){
		
		UserBean ubean=daoInter.selectunoUser(userNo);
		
		ModelAndView andView=new ModelAndView("modify");
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
		
		String name = daoInter.selectUsernoName(bean.getUserNo());
		System.out.println("name 값 : "+name+ "bean.name 값 : "+bean.name);
		
		CommentDto cdto=new CommentDto();
		cdto.setContent(bean.name);
		cdto.setUserName(name);
		int b1=cdinter.selectNamecom(name);
		System.out.println("b1 결과값 : "+b1);
		
		if(b1>0) {
			cdinter.updateNamecom(cdto);
		}else {
			
		}
		
		boolean b=daoInter.updateUinfo(bean);
		session.setAttribute("namekey",bean.getName());
		if(b) {
			return "modifySuccess";
		}else {
			return "err";
		}
	}
	
	@RequestMapping(value="deleteUser", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> deleteUser(@RequestParam("userNo")int userNo){
		boolean b=daoInter.deleteUser(userNo);
		
		
		Map<String, String> map=new HashMap<String, String>();
		
		if(b) {
			System.out.println("탈퇴가 정상처리되었습니다.");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("에러!! 탈퇴 실패");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
		
	}
}
