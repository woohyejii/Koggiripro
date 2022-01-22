package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.CommDaoInter;
import pack.model.CommentDto;

@Controller
public class CommentController {
	@Autowired
	private CommDaoInter daoInter;
	
	//댓글 추가기능
	@RequestMapping(value="insertcom", method=RequestMethod.POST)
	public String insertComm(CommentDto dto,
			@RequestParam("postNo")int postNo,
			@RequestParam("studyNo")int studyNo,
			@RequestParam("userNo")int userNo,
			HttpSession session) {
		
		
		int num=daoInter.selectMaxCom(dto)+1;
		dto.setCommentNo(num);
		
		String name=(String)session.getAttribute("namekey");
		System.out.println("네임 값 결과 : "+name);
		dto.setUserName(name);
		dto.setTime();
		boolean b=daoInter.insert(dto);
		
		
		if(b) {
			
			return "redirect:/postDetail?postNo="+postNo+"&cpage=1&studyNo="+studyNo;
		}
		else {
			return "error2";
		}
		
	}
	
	//댓글 삭제기능
	@RequestMapping("deletecom")
	public String deletecom(
			@RequestParam("commentNo")int commentNo,
			@RequestParam("postNo")int postNo,
			@RequestParam("studyNo")int studyNo) {
		CommentDto dto=new CommentDto();
		dto.setCommentNo(commentNo);
		dto.setPostNo(postNo);
		dto.setStudyNo(studyNo);
		
		boolean b=daoInter.delete(dto);
		
		if(b) {
			
			return "redirect:/postDetail?postNo="+postNo+"&cpage=1&studyNo="+studyNo;
		}
		else {
			return "error2";
		}
		
	}
}
