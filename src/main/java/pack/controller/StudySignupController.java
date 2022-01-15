package pack.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.model.AlarmDaoInter;
import pack.model.AlarmDto;
import pack.model.FormDaoInter;
import pack.model.FormDto;
import pack.model.StudyDaoInter;
import pack.model.StudyDto;
import pack.model.UserDaoInter;

@Controller
public class StudySignupController {
	
	@Autowired
	private FormDaoInter daoInter;
	@Autowired
	private UserDaoInter udaoInter;
	@Autowired
	private AlarmDaoInter adaoInter;
	@Autowired
	private StudyDaoInter sdaoInter;
	
	@RequestMapping(value="studysignup", method=RequestMethod.GET)
	public ModelAndView signup(
			HttpSession session,
			@RequestParam("studyNo") int studyNo) {
		String namekey=(String)session.getAttribute("namekey");
		
		
		ModelAndView andView=new ModelAndView("studysignup");
		andView.addObject("studyNo",studyNo);
		andView.addObject("namekey",namekey);
		return andView;
	}
	
	@RequestMapping(value="studysignup", method=RequestMethod.POST)
	public String signupsubmit(
			@RequestParam("studyNo") int studyNo,
			@RequestParam("namekey") String namekey,
			FormDto dto,
			Model model) {
		//dto에는 content만 들어있다.
		dto.setStudyNo(studyNo);
		System.out.println("namekey 값 : "+namekey);
		
		//닉네임으로 유저 정보 찾아서 applicant에 userNo 값 넣어주기
		UserBean ubean=udaoInter.selectNameUser(namekey);
		int applicant=ubean.getUserNo();
		
		dto.setApplicant(applicant);
		
		boolean b=daoInter.insert(dto);
				
		if(b) {
			
			model.addAttribute("dto", dto);
			
			return "studysignsuccess";
		}else {
			return "error2";
		}
	}
	
	
	
	@RequestMapping(value="usestudyName", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> useName(@RequestParam("studyName")String studyName){
		StudyDto sdto=new StudyDto();
		sdto.setStudyName(studyName);
		
		boolean b=sdaoInter.selectstudyName(sdto);
		Map<String, String> map=new HashMap<String, String>();

		if(b) {
			System.out.println("사용할 수 있는 스터디명입니다.");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("사용 불가합니다.");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
	}
}
