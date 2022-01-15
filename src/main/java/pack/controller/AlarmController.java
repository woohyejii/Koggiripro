package pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.AlarmDaoInter;

@Controller
public class AlarmController {

	@Autowired
	private AlarmDaoInter inter;
	
	@RequestMapping("alarmList")
	public ModelAndView alarmList(@RequestParam("userNo") int userNo) {
		
		ModelAndView andView = new ModelAndView("alarmList");
		
		ArrayList<AlarmBean> dto = inter.getAlarmList(userNo);
		andView.addObject("dto",dto);
		andView.addObject("managerNo",userNo);
		return andView;
		
	}
	
}
