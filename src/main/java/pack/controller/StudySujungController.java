package pack.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.StudyDaoInter;
import pack.model.StudyDto;

@Controller
public class StudySujungController {
	
	@Autowired
	private StudyDaoInter sdinter;

	@RequestMapping(value="sujungStudy", method=RequestMethod.GET)
	public ModelAndView sujungStudy(
			@RequestParam("studyNo")int studyNo) {
		ModelAndView andView=new ModelAndView("sujungStudy");
		
		StudyDto sdto=sdinter.selectNoStudyInfo(studyNo);
		
		andView.addObject("studyNo", studyNo);
		andView.addObject("sdto", sdto);
		/*
		andView.addObject("studyName", sdto.getStudyName());
		andView.addObject("content", sdto.getContent());
		andView.addObject("maxPeopleNum", sdto.getMaxPeopleNum());
		andView.addObject("language", sdto.getLanguage());
		*/
		
		return andView;
	}
	@RequestMapping(value="sujungStudy", method=RequestMethod.POST)
	public String sujungStudy2(
			@RequestParam("studyNo")int studyNo,
			@RequestParam("languageChk") List<String> languageChk,
			StudyDto sdto) {
		
		String str="/";
		str += String.join("/",languageChk);
		str+="/";
		sdto.setLanguage(str);
		boolean b=sdinter.updateStudyinfo(sdto);
		if(b) {
			return "redirect:/studyDetail?studyNo="+studyNo;
		}else {
			return "error.jsp";
		}
	}
	
}
