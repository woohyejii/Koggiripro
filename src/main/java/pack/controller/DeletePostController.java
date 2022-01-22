package pack.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pack.model.BoardDaoInter;
import pack.model.CommDaoInter;
import pack.model.CommentDto;
import pack.model.PostDto;

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
		
		PostDto pdto=new PostDto();
		pdto.setPostNo(postNo);
		pdto.setsNo(studyNo);
		
		if(inter.deletePost(pdto)) {
			return "redirect:/studyboard?&studyNo=" + studyNo + "&page=1";
		}
		else return "redirect:/error2";

	}
	
	@RequestMapping("deletePost2")
	public String deletePost2(@RequestParam("postNo") int postNo,
			@RequestParam("userNo") String userNo,
			@RequestParam("studyNo") int studyNo,
			RedirectAttributes redirectAttributes){
		
		
		CommentDto cdto=new CommentDto();
		cdto.setStudyNo(studyNo);
		cdto.setPostNo(postNo);
		cdinter.deletepostCom(cdto);
		
		PostDto pdto=new PostDto();
		pdto.setPostNo(postNo);
		pdto.setsNo(studyNo);
		
		Map<String, Object> map = new HashMap<String,Object>();
	    map.put("userNo", userNo);
	    map.put("key2", "value2");
	    redirectAttributes.addFlashAttribute("vo", map);

		
		
		if(inter.deletePost(pdto)) {
			return "redirect:/board?&userNo=" + userNo + "&cpage=0";
		}
		else return "redirect:/error2";

	}
	
	
}
