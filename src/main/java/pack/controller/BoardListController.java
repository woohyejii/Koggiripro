package pack.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;
import pack.model.BoardDto;

@Controller
public class BoardListController {
	@Autowired
	private BoardDaoInter inter;
	
	private int totalRecord; 	
	private int numInOnePage=5;
	private int totalPageNum;
	
	
	@RequestMapping(value = "studyboard", method = RequestMethod.GET)
	public ModelAndView process(@RequestParam("userNo") int userNo, @RequestParam("studyNo") String studyNo, @RequestParam("page") String page) { 
		ModelAndView andView = new ModelAndView();
		andView.addObject("studyNo",studyNo);
		andView.addObject("userNo",userNo);
		int p = 0;
		try {
			p = Integer.parseInt(page);
		} catch (Exception e) {
			p = 1;
		}
		if(p<=0) {
			p=1;
		}
		totalRecord = inter.totalBoardRecord(studyNo);
		
		
		ArrayList<BoardDto> list = inter.getList(studyNo);
		ArrayList<BoardDto> result = getListData(list,p);
		
		andView.addObject("data",result);	
		andView.addObject("totalPageNum",getTotalPageNum());
		andView.addObject("page",p);
		
		String manager = inter.getManager(studyNo);
		andView.setViewName("memberStudyBoard");
		
		String user=""+userNo+"";
		System.out.println(user);
		
		if(user.equals(manager)) {
			andView.addObject("manager", true);
		}
		else {
			
			andView.addObject("manager", false);
		}
		
		System.out.println("M결과값 : "+manager+" "+user+" "+user.equals(manager));
		
		//System.out.println("���� ���� : " +list.get(0).getUserNo());
		
		return andView;
	}
	
	
	public ArrayList<BoardDto> getListData(ArrayList<BoardDto> list, int page){
		ArrayList<BoardDto> result = new ArrayList<BoardDto>();
		
		int start = (page-1)*numInOnePage; //0,2,4 ...
		
		int size=numInOnePage<=list.size()-start?numInOnePage:list.size()-start;
		
		for(int i=0;i<size;i++) {
			result.add(i,list.get(start+i));
		}
		return result;
	}
	
	public int getTotalPageNum() {

		
		totalPageNum = totalRecord/numInOnePage; 

		if(totalRecord%numInOnePage>0) totalPageNum+=1;	
		return totalPageNum;
	}
	
	
	
}
