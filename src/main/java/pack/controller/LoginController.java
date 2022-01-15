package pack.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xpath.internal.axes.HasPositionalPredChecker;

import pack.model.UserDaoInter;
import pack.model.UserDto;

@Controller
public class LoginController {

	@Autowired
	private UserDaoInter daoInter;
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "loginform";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String loginsubmit(HttpSession session,
		@RequestParam("id")String id,
		@RequestParam("password")String password) {
		
		UserBean bean=new UserBean();
		bean.setId(id);
		bean.setPassword(password);
		
		boolean b=daoInter.login(bean);
		if(b) {
			UserBean bean2=daoInter.selectidUser(id);
			System.out.println(bean2);
			String name=daoInter.selectName(bean2);
			System.out.println(name);
			//id로 userNo 찾기 
			int userNo=bean2.getUserNo();
			
			
			session.setAttribute("namekey",name);
			session.setAttribute("userNo",userNo);
			return "../../index";
		}
		else {
			
			return "error";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("namekey");
		return "../../index";
	}
	
}
