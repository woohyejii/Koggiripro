package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.model.BoardDaoInter;
import pack.model.BoardDto;

@Controller
public class PostSearchController {
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping(value="searchPost",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> searchPost(StudyBoardBean bean){
		List<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
		Map<String, String> data = null;
		List<BoardDto> result = null;
		
		if(bean.getSearchPostValue()!=null && !bean.getSearchPostValue().equals("")) {
			
		
			if(bean.getSearchPostOption().equals("title")) {
				
				 result = inter.selectSearchTitle(bean);
				 
						 
			}else if(bean.getSearchPostOption().equals("name")) {
				
				result = inter.selectSearchName(bean);
			}
			
			for(BoardDto tmp:result) {
				System.out.println(tmp.getTitle());
				data = new HashMap<String, String>();
				data.put("title", tmp.getTitle());
				data.put("name",tmp.getName());
				data.put("postNo",Integer.toString(tmp.getPostNo()));
				data.put("views",Integer.toString(tmp.getViews()));
				data.put("postTime",tmp.getPostTime());
				datalist.add(data);
				
			}
			
			Map<String,Object> resultSearchBoard = new HashMap<String, Object>();
			resultSearchBoard.put("datalist",datalist);
			System.out.println(datalist);
			return resultSearchBoard;
		}
		else {
			return null;
		}
		
	}
}
