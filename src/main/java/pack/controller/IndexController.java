package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.AlarmDaoInter;
import pack.model.AlarmDto;
import pack.model.FormDaoInter;
import pack.model.FormDto;
import pack.model.StudyDaoInter;
import pack.model.StudyDto;

@Controller
public class IndexController {
	
	@Autowired
	private FormDaoInter daoInter;
	@Autowired
	private StudyDaoInter sdaoInter;
	@Autowired
	private AlarmDaoInter adaoInter;

	@RequestMapping(value="ssindex", method=RequestMethod.GET)
	public String ssindex(
			@RequestParam("state")int state,
			@RequestParam("studyNo")int studyNo,
			@RequestParam("applicant")int applicant,
			@RequestParam("content")String content) {
		
		//스터디장에게 가입신청했다고 알림 보내기
		AlarmDto adto=new AlarmDto();
		
		FormDto fdto=new FormDto();
		fdto.setState(state);
		fdto.setStudyNo(studyNo);
		fdto.setApplicant(applicant);
		fdto.setContent(content);
		
		int formNo=daoInter.selectInfoNo(fdto);
		adto.setFormNo(formNo);
	
		System.out.println("formNo의 값은 : "+formNo);
		
		StudyDto sdto=sdaoInter.selectNoStudyInfo(studyNo);
		//StudyDto를 통해서 스터디장의 번호를 얻어오고, AlarmDto에 값 넣어주기
		int suserNo=sdto.getManager_userNo();
		adto.setUserNo(suserNo);
		//알람 추가하기!
		adaoInter.insertAlarm(adto);
		
		
		return "../../index";
		
		
		
		
		
		
		/*
		 * //스터디장에게 가입신청했다고 알림 보내기
		AlarmDto adto=new AlarmDto();
		
		FormDto fdto=new FormDto();
		fdto.setStudyNo(studyNo);
		fdto.setApplicant(applicant);
		
		int formNo=daoInter.selectInfoNo(fdto);
		adto.setFormNo(formNo);
		
		System.out.println(formNo);
		
		StudyDto sdto=sdaoInter.selectNoStudyInfo(studyNo);
		//StudyDto를 통해서 스터디장의 번호를 얻어오고, AlarmDto에 값 넣어주기
		int suserNo=sdto.getManager_userNo();
		adto.setUserNo(suserNo);
		//알람 추가하기!
		adaoInter.insertAlarm(adto);
		 * */
	}
}
