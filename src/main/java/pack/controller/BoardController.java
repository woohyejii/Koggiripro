package pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;
import pack.model.PostDto;
import pack.model.PostingInter;
import pack.model.StudyDaoInter;

@Controller
public class BoardController {

	@Autowired
	private PostingInter pinter;
	
	@Autowired
	private BoardDaoInter bdinter;
	
	@Autowired
	private StudyDaoInter sdinter;
	
	
	
	@RequestMapping(value="board")
	public ModelAndView board(@RequestParam("userNo") int userNo) {
		
		 ArrayList<PostDto> plist= pinter.selectNopost(userNo);
		 
		 ArrayList<String> slist=new ArrayList<String>();
				 
		 for(int i=0; i<plist.size(); i++) {
			 slist.add(sdinter.selectSnoName(plist.get(i).getsNo()));
		 }
		
		 
		String name=bdinter.selectName(userNo);
		
		ModelAndView andView= new ModelAndView();
		
		andView.addObject("plist",plist);
		andView.addObject("name",name);
		andView.addObject("slist",slist);
		return andView;
	}
	
		
		
}
