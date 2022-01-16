package pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	
	@RequestMapping(value="board")
	public ModelAndView board(@RequestParam("userNo") String userNo) {
		
		ModelAndView andView= new ModelAndView();
		
		andView.addObject("userNo",userNo);
		return andView;
	}
	
		
		
}
