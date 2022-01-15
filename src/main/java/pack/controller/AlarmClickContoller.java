package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.AlarmDaoInter;
import pack.model.FormDto;
import pack.model.StudyDaoInter;
import pack.model.StudyMemberDto;
import pack.model.StudyMemberInter;

@Controller
public class AlarmClickContoller {

	@Autowired
	private AlarmDaoInter inter;
	
	@Autowired
	private StudyMemberInter studyMemberInter;
	
	@Autowired
	private StudyDaoInter studyDaoInter;
	
	@RequestMapping(value = "alarmform", method = RequestMethod.GET)
	public ModelAndView alarm(@RequestParam("formNo") int formNo) {
		
		
		
		if(inter.updateAlarm(formNo)) {
			ModelAndView andView = new ModelAndView("alarmform");
			FormDetailBean dto = inter.getFormInfo(formNo);
			andView.addObject("dto", dto);
			return andView;
		}
		else {
			return new ModelAndView("error2");
		}
		
		
	}
	
	@RequestMapping("approval")
	public String alarm2(StudyMemberDto dto,@RequestParam("formNo") int formNo,@RequestParam("manager_userNo") int manager_userNo) {
		
		ModelAndView andView = new ModelAndView("alarmList");
		if(!studyMemberInter.insertStudyMember(dto)) return "redirect:/error2";
		if(!inter.updateApprovalState(formNo)) return "redirect:/error2";
		//추가하기
		studyDaoInter.updateNowPeople(dto.getStudyNo());
		
		return "redirect:/alarmList?userNo="+manager_userNo;
	}
	
	@RequestMapping("refusal")
	public String alarm3(@RequestParam("formNo") int formNo,@RequestParam("manager_userNo") int manager_userNo) {
		
		ModelAndView andView = new ModelAndView("alarmList");
		if(!inter.updateRefusalState(formNo)) return "redirect:/error2";
		return "redirect:/alarmList?userNo="+manager_userNo;
	}
}
