package pack.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;
import pack.model.CommDaoInter;
import pack.model.CommentDto;
import pack.model.StudyDaoInter;
import pack.model.StudyDto;
import pack.model.StudyMemberDto;
import pack.model.StudyMemberInter;
import pack.model.UserDaoInter;
import pack.model.UserDto;

@Controller
public class WithdrawalController {
	@Autowired
	private BoardDaoInter inter;
	
	@Autowired
	private StudyDaoInter sdinter;
	
	@Autowired
	private UserDaoInter uinter;
	
	@Autowired
	private StudyMemberInter sminter;
	
	@Autowired
	private CommDaoInter cdinter;
	
	//스터디 회원 탈퇴
	@RequestMapping(value ="withdraw",method=RequestMethod.POST)
	public String doWithdrawal(
			StudyBoardBean bean,
			@RequestParam("studyNo") int studyNo,
			@RequestParam("name") String name) {
		
		boolean result = inter.withdraw(bean);
		boolean result2=sdinter.downNowpnum(studyNo);
		
		System.out.println("name 값:"+name);
		CommentDto cdto=new CommentDto();
		cdto.setUserName(name);
		cdto.setStudyNo(studyNo);
		
		boolean result3=cdinter.deleteMemCom(cdto);
		
		
		if(result && result2) { 
			System.out.println("체크");
			return "redirect:/mypage?userNo="+bean.getUserNo();
			//return "home";
		}
		else {
			System.out.println("에러");
			return "error2";
		}
	}
	
	@RequestMapping(value="removeStudy",method=RequestMethod.POST)
	public String removeStudy(StudyBoardBean bean) {
		int studyNo = bean.getStudyNo();
		int nowP=sdinter.selectNowPeople(studyNo);
		//System.out.println("nowP결과 값 : "+nowP+" "+studyNo);
		
		
		if(nowP==1) {
			//스터디 삭제하기
			
			boolean result = inter.removeStudy(studyNo);
			if(result) { 
				System.out.println("체크");
				return "redirect:/mypage?userNo="+bean.getUserNo();
				//return "home";
			}
			else {
				System.out.println("에러");
				return "err";
			}
			
		}else {
			return "redirect:/removeStudy2?studyNo="+studyNo;
			
		}
	}
	
	@RequestMapping(value="removeStudy2",method=RequestMethod.GET)
	public ModelAndView removeStudy2(
			@RequestParam("studyNo") int studyNo) {
		
		ModelAndView andView=new ModelAndView("removeStudy2");
		andView.addObject("studyNo", studyNo);
		
		return andView;
	}
	
	@RequestMapping(value="changeStudyM",method=RequestMethod.GET)
	public ModelAndView changeStudyM(
			@RequestParam("studyNo") int studyNo) {
	
		ModelAndView andView=new ModelAndView("changeStudyM");
		andView.addObject("studyNo", studyNo);
		
		return andView;
	}
	
	@RequestMapping(value="useChangeName",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> useName(
			@RequestParam("useName")String useName,
			@RequestParam("studyNo")int studyNo){
		
		System.out.println("useName "+useName+"studyNo "+studyNo);
		
		Map<String, String> map=new HashMap<String, String>();
		
		Integer uno=uinter.selectNameUserno(useName);
		
		
		if(uno==0) {
			System.out.println("1존재하지 않습니다.");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
		
		StudyMemberDto smdto=new StudyMemberDto();
		smdto.setStudyNo(studyNo);
		smdto.setUserNo(uno);
		
		boolean b=sminter.selectNoUser(smdto);
		
		if(b) {
			System.out.println("존재합니다.");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("존재하지 않습니다.");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
	}
	
	
	@RequestMapping(value="checkPwd",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> checkPwd(
			@RequestParam("pwd")String pwd,
			@RequestParam("studyNo")int studyNo){
		
		
		
		int mno=sdinter.selectManagerno(studyNo);
		String pwd2=uinter.selectNoPwd(mno);
		
		Map<String, String> map=new HashMap<String, String>();
		
		//System.out.println("pwd : "+pwd+"pwd2 : "+pwd2+" ");
		
		if(pwd.equals(pwd2)) {
			System.out.println("비밀번호가 정확합니다.");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("비밀번호가 틀렸습니다.");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
		
		
	}
	
	@RequestMapping(value="changeStudyM",method=RequestMethod.POST)
	public ModelAndView changeStudyM2(
			@RequestParam("studyNo") int studyNo,
			UserDto udto) {
		String name=udto.getName();
		Integer uno=uinter.selectNameUserno(name);
		
		StudyDto sdto=new StudyDto();
		sdto.setManager_userNo(uno);
		sdto.setStudyNo(studyNo);
		
		boolean b=sdinter.upStudyManage(sdto);
		
		if (b) {
			ModelAndView andView=new ModelAndView("changeSuccess");
			return andView;
		}else {
			ModelAndView andView=new ModelAndView("error");
			return andView;
		}
		
		
	}
	
	
}
