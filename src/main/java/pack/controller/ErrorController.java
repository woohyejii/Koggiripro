package pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	//로그인 아이디 혹은 비밀번호가 틀렸을 때
	@RequestMapping("error")
	public String err() {
		
		return "error";
	}
}
