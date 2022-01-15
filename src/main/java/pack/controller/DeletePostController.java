package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.BoardDaoInter;
import pack.model.CommDaoInter;
import pack.model.CommentDto;

@Controller
public class DeletePostController {

	@Autowired
	private BoardDaoInter inter;
	
	@Autowired
	private CommDaoInter cdinter;
	
	@RequestMapping("deletePost")
	public String deletePost(@RequestParam("postNo") int postNo,
			@RequestParam("userNo") String userNo,
			@RequestParam("studyNo") int studyNo) {
		
		
		CommentDto cdto=new CommentDto();
		cdto.setStudyNo(studyNo);
		cdto.setPostNo(postNo);
		cdinter.deletepostCom(cdto);
		
		if(inter.deletePost(postNo)) {
			return "redirect:/studyboard?userNo=" + userNo + "&studyNo=" + studyNo + "&page=1";
		}
		else return "redirect:/error2";

	}
	
	
}
