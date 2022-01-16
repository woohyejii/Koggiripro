package pack.controller;

import java.io.InputStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.PostDto;
import pack.model.PostingInter;
import pack.model.StudyMemberDto;
import pack.model.StudyMemberInter;

@Controller
public class UpdatePostController {
	@Autowired
	private PostingInter inter;
	
	@Autowired
	private StudyMemberInter sminter;

	@RequestMapping(value = "updatePost", method = RequestMethod.GET)
	public ModelAndView updatePost(
			@RequestParam("postNo") int postNo, 
			@RequestParam("studyNo") int studyNo,
			HttpSession session) {
		
		StudyMemberDto smdto=new StudyMemberDto();
		int userNo=(Integer)session.getAttribute("userNo");
		smdto.setStudyNo(studyNo);
		smdto.setUserNo(userNo);
		int smno=sminter.selectStudymemberno(smdto);
		
		PostDto pdto=new PostDto();
		pdto.setPostNo(postNo);
		pdto.setStudyMemberNo(smno);
		
		PostDto dto = inter.getDetail(pdto);
		ModelAndView andView = new ModelAndView();
		andView.addObject("data", dto);
		andView.addObject("userNo", userNo);
		andView.addObject("studyNo", studyNo);

		return andView;

	}

	@RequestMapping(value = "updatePost", method = RequestMethod.POST)
	public String doSqlUpdate(
			@RequestParam("userNo") String userNo,
			@RequestParam("studyNo") int studyNo,
			PostDto dto) {

		dto.setsNo(studyNo);
		
		if (inter.updatePost(dto))
			return "redirect:/studyboard?userNo="+userNo+"&studyNo="+studyNo +"&page=1";
		else
			return "redirect:/error2";
	}

}
