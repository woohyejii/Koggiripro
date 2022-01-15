package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;


@Controller
public class WriteController {
	
	
	@Autowired
	private BoardDaoInter inter;
	
	
	@RequestMapping(value="write",method=RequestMethod.GET)
	public ModelAndView write(
			@RequestParam("userNo") int userNo, 
			@RequestParam("studyNo") int studyNo) {
		
		ModelAndView andView = new ModelAndView();
		andView.addObject("userNo",userNo);
		andView.addObject("studyNo",studyNo);
		
		String name =inter.selectName(userNo);
		//System.out.println(name);
		andView.addObject("name",name);
		return andView;
	}
	
	
	@RequestMapping(value="write",method=RequestMethod.POST)
	public String writeSubmit(
			StudyBoardBean bean,
			@RequestParam("userNo") int userNo, 
			@RequestParam("studyNo") int studyNo) {
		//System.out.println(bean.getStudyNo());
		int postNo = inter.currentMaxnum(bean.getStudyNo())+1;
		bean.setPostNo(postNo);
		int studyMemberNo = inter.selectStudymemberno(bean);
		
		
		bean.setStudyMemberNo(studyMemberNo);
		boolean b = inter.insert(bean);
		
		if(b)
			return "redirect:studyboard?userNo="+userNo+"&studyNo="+studyNo+"&page=1";
		else
			return "err";
	}
	
}
