package pack.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.PostingInter;
import pack.model.StudyDaoInter;
import pack.model.StudyDto;
import pack.model.StudyMemberDto;
import pack.model.StudyMemberInter;

@Controller
public class NewStudyController {
	@Autowired
	private StudyDaoInter inter;
	
	@Autowired
	private StudyMemberInter studyMemberInter;
	
	@RequestMapping(value = "newStudyForm", method = RequestMethod.GET)
	public ModelAndView write(@RequestParam("userNo") int manager_userNo) {
		ModelAndView andView = new ModelAndView("newStudyForm");
		andView.addObject("manager_userNo", manager_userNo);
		return andView;
	}
	
	@RequestMapping(value = "newStudyForm", method = RequestMethod.POST)
	public String process(StudyDto studyDto,
			StudyMemberDto studyMemberDto,
			@RequestParam("languageChk") List<String> languageChk) {
		String str="/";
		str += String.join("/",languageChk);
		str+="/";
		studyDto.setLanguage(str);
		
		
		if(!inter.createStudy(studyDto)) return "redirect:/error2";
		studyMemberDto.setUserNo(studyDto.getManager_userNo());
		studyMemberDto.setStudyNo(inter.getStudyNo(studyDto.getManager_userNo()));
		if(!studyMemberInter.insertStudyMember(studyMemberDto)) return "redirect:/error2";
		return "redirect:/home";
	}
	
	
	
}
	

