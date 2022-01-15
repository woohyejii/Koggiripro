package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.model.StudyDaoInter;
import pack.model.StudyDto;

@Controller
public class HomeController {

	@Autowired
	private StudyDaoInter inter;

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public ModelAndView studyinfo(HttpSession session) {

		String name = (String) session.getAttribute("namekey");
		ArrayList<StudyDto> study = null;

//		if (name == null) {	//리스트에서 유저가 가입되어있는 리스트 빼고 보여주기
		study = inter.getStudyList();
//		} else {
//			int userNo = (Integer) session.getAttribute("userNo");
//			study = inter.getStudyListLogin(userNo);
//		}

		ModelAndView andView = new ModelAndView("home");

		for (StudyDto dto : study) {
			dto.setLanguage(dto.getLanguage().replaceAll("/", " #"));
			dto.setLanguage(dto.getLanguage().substring(0, dto.getLanguage().length()-1));
			System.out.println("dto : " + dto.getLanguage());
		}
		andView.addObject("size", study.size());
		andView.addObject("study", study);
		return andView;
	}

	@RequestMapping(value = "searchStudy", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> searchStudy(HttpSession session, StudySearchBean bean) {

		List<Map<String, Object>> studyList = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = null;

		ArrayList<StudyDto> study = null;

		List<StudyDto> tmpList = null;
		if (bean.getSearchOption().equals("language")) {
			tmpList = inter.getSelectSearchLanguageStudyList(bean);
		} else if (bean.getSearchOption().equals("studyName")) {
			tmpList = inter.getSelectSearchTitleStudyList(bean);
		}

		/*
		 * int studyNo, manager_userNo; String studyName, content, maxPeopleNum,
		 * NowPeopleNum, language;
		 */
		for (StudyDto tmp : tmpList) {
			data = new HashMap<String, Object>();
			data.put("studyNo", tmp.getStudyNo());
			data.put("content", tmp.getContent());
			data.put("manager_userNo", tmp.getManager_userNo());
			data.put("studyName", tmp.getStudyName());
			data.put("content", tmp.getContent());
			data.put("maxPeopleNum", tmp.getMaxPeopleNum());
			data.put("nowPeopleNum", tmp.getNowPeopleNum());
			tmp.setLanguage(tmp.getLanguage().replaceAll("/", "#"));
			data.put("language", tmp.getLanguage());
			studyList.add(data);
		}

		Map<String, Object> studyLists = new HashMap<String, Object>();
		studyLists.put("datas", studyList);
		System.out.println(studyLists);
		return studyLists;
	}

	@RequestMapping(value = "imgBtnClick", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ImgBtnClickStudy(@RequestParam(value = "langList[]") List<String> langList) {

		List<Map<String, Object>> studyList = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = null;
		List<StudyDto> tmpList = null;

		tmpList = inter.getSelectImgBtnStudyList(langList);
		/*
		 * int studyNo, manager_userNo; String studyName, content, maxPeopleNum,
		 * NowPeopleNum, language;
		 */
		for (StudyDto tmp : tmpList) {
			data = new HashMap<String, Object>();
			data.put("studyNo", tmp.getStudyNo());
			data.put("content", tmp.getContent());
			data.put("manager_userNo", tmp.getManager_userNo());
			data.put("studyName", tmp.getStudyName());
			data.put("content", tmp.getContent());
			data.put("maxPeopleNum", tmp.getMaxPeopleNum());
			data.put("nowPeopleNum", tmp.getNowPeopleNum());
			tmp.setLanguage(tmp.getLanguage().replaceAll("/", "#"));
			data.put("language", tmp.getLanguage());
			studyList.add(data);
		}

		Map<String, Object> studyLists = new HashMap<String, Object>();
		studyLists.put("datas", studyList);
		System.out.println(studyLists);
		return studyLists;
	}

	@RequestMapping(value = "imgBtnClick", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> ImgBtnClickStudy_total(HttpSession session) {

		int userNo = (Integer) session.getAttribute("userNo");

		List<Map<String, Object>> studyList = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = null;
		List<StudyDto> tmpList = null;

		tmpList = inter.getStudyList();

		/*
		 * int studyNo, manager_userNo; String studyName, content, maxPeopleNum,
		 * NowPeopleNum, language;
		 */
		for (StudyDto tmp : tmpList) {
			data = new HashMap<String, Object>();
			data.put("studyNo", tmp.getStudyNo());
			data.put("content", tmp.getContent());
			data.put("manager_userNo", tmp.getManager_userNo());
			data.put("studyName", tmp.getStudyName());
			data.put("content", tmp.getContent());
			data.put("maxPeopleNum", tmp.getMaxPeopleNum());
			data.put("nowPeopleNum", tmp.getNowPeopleNum());
			tmp.setLanguage(tmp.getLanguage().replaceAll("/", "#"));
			data.put("language", tmp.getLanguage());
			studyList.add(data);
		}

		Map<String, Object> studyLists = new HashMap<String, Object>();
		studyLists.put("datas", studyList);
		System.out.println(studyLists);
		return studyLists;
	}

}
