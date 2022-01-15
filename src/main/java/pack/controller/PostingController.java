package pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostingController {
	@RequestMapping(value = "posting",method = RequestMethod.GET)
	public void moveToPostingPage(@RequestParam("studyNo") String studyNo) {
		
		System.out.println(studyNo);
		return ;
	}
	@RequestMapping(value="")
	public void postFormInfo() {
		
	}
	
}
