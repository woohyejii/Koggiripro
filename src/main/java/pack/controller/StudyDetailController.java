package pack.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.FormDaoInter;
import pack.model.FormDto;
import pack.model.StudyDaoInter;
import pack.model.StudyDto;
import pack.model.StudyMemberDto;
import pack.model.StudyMemberInter;

@Controller
public class StudyDetailController {


	@Autowired
	private StudyDaoInter inter;
	@Autowired
	private StudyMemberInter sminter;
	@Autowired
	private FormDaoInter finter;
	
	@RequestMapping("studyDetail")
	public ModelAndView detail(
			@RequestParam("studyNo") int studyNo,
			HttpSession session) {
		
		ModelAndView andView = new ModelAndView("studyDetail");

		System.out.println(studyNo);
		StudyDetailBean dto = inter.getStudyDetail(studyNo);
		

		String str = dto.getLanguage().replaceAll("/", "#");
		str = str.substring(0,str.length()-1);
		dto.setLanguage(str);
		System.out.println("dto : " + dto.getLanguage());

		String time=dto.getAddTime();
		//System.out.println(time);
		time=time.substring(0,4)+"년 "+time.substring(5,7)+"월";
		
		//사용언어의 #의 위치를 찾고, String.subString을 이용해서 만들기..는 다음에 시간 남으면 하기
		
		StudyMemberDto smdto=new StudyMemberDto();
		int no=0;
		String result="";
		//가입되어있는 스터디인지 여부
		if(session.getAttribute("userNo")!=null) {
			no=(Integer)session.getAttribute("userNo");

			smdto.setUserNo(no);
			smdto.setStudyNo(studyNo);
			boolean b=sminter.selectalMember(smdto);
			
			
			if(b) {
				result="";
			}else {
				result="가입가능";
			}
			andView.addObject("result",result);
		}else {
			result="가입가능";
			andView.addObject("result",result);
		}
		
		
		String result2="";
		//가입신청을 한 스터디인지 여부
		FormDto fdto=new FormDto();
		fdto.setStudyNo(studyNo);
		if(no==0) {
			result2="가입가능";
		}else {
			fdto.setApplicant(no);
			boolean b2=finter.selectalSub(fdto);
			
			System.out.println("결과값 : "+fdto.getStudyNo());
			if(b2) {
				result2="";
			}else {
				result2="가입가능";
			}
		}
		andView.addObject("result2",result2);
		//모집인원이 다 찼을 경우
		String result3="";
		System.out.println("결과값 : "+dto.getNowPeopleNum());
		System.out.println("결과값 : "+dto.getMaxPeopleNum());
		System.out.println(dto.getNowPeopleNum()==dto.getMaxPeopleNum());
		if(dto.getNowPeopleNum()==dto.getMaxPeopleNum()) {
			result3="";
		}else {
			result3="1";
		}
		andView.addObject("result3",result3);
		
		
		andView.addObject("studyNo",studyNo);
		andView.addObject("dto",dto);
		andView.addObject("time",time);
		return andView;
		
	}
	
}
