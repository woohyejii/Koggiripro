package pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;
import pack.model.CommDaoInter;
import pack.model.CommentDto;
import pack.model.PostDto;
import pack.model.PostingInter;
import pack.model.StudyDaoInter;
import pack.model.UserDaoInter;

@Controller
public class CommentsController {

	@Autowired
	private BoardDaoInter bdinter;
	
	@Autowired
	private CommDaoInter cdinter;
	
	@Autowired
	private StudyDaoInter sdinter;
	
	@Autowired
	private PostingInter pinter;
	
	@RequestMapping(value="comments")
	public ModelAndView board(@RequestParam("userNo") int userNo) {
		ModelAndView andView=new ModelAndView();
		String name=bdinter.selectName(userNo);
		System.out.println("닉네임 : "+name);
		ArrayList<CommentDto> clist=cdinter.selectUsercom(name);
		
		ArrayList<String> slist=new ArrayList<String>();
		 
		//스터디이름 찾기
		 for(int i=0; i<clist.size(); i++) {
			 slist.add(sdinter.selectSnoName(clist.get(i).getStudyNo()));
		 }
		 
		 
		 ArrayList<String> tlist=new ArrayList<String>();
		 ArrayList<Integer> ulist=new ArrayList<Integer>();
		 
		 //타이틀 리스트
		 for(int i=0; i<clist.size(); i++) {
			 PostDto pdto=new PostDto();
			 pdto.setPostNo(clist.get(i).getPostNo());
			 pdto.setsNo(clist.get(i).getStudyNo());
			 
			 tlist.add(pinter.selectNosTitle(pdto));
			 ulist.add(pinter.selectNosUno(pdto));
		 }
		 
		 
		 
		 
		
		 
		
		andView.addObject("clist",clist);
		andView.addObject("slist",slist);
		andView.addObject("tlist",tlist);
		andView.addObject("ulist",ulist);
		return andView;
	}
}
