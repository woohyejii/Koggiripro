package pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.CommDaoInter;
import pack.model.CommentDto;
import pack.model.PostDto;
import pack.model.PostingInter;
import pack.model.StudyMemberDto;
import pack.model.StudyMemberInter;
import pack.model.UserDaoInter;

@Controller
public class PostDetailController {
	@Autowired
	private PostingInter postingInter;
	
	@Autowired
	private CommDaoInter daoInter;
	
	@Autowired
	private StudyMemberInter smInter;
	
	@Autowired
	private UserDaoInter udinter;
	
	//댓글 페이징 처리 준비
	private int tot;		//전체 레코드 수
	private int plist=5;	//한 페이지 당 출력 행 수
	private int cpageSu;		//전체 페이지 수
	
	public ArrayList<CommentDto> getcListData(ArrayList<CommentDto> clist, int cpage){
		ArrayList<CommentDto> result=new ArrayList<CommentDto>();
		
		int start=(cpage-1)*plist;	//0, 10, 20 ...
		//clist.size()에서 start를 뺐을때 plist가 작거나 같은가? 참이면 :의 왼쪽값, 거짓이면 :의 오른쪽값 
		int size=plist<=clist.size()-start?plist:clist.size()-start;
		
		for(int i=0; i<size; i++) {
			result.add(i, clist.get(start+i));
		}
		
		return result;
	}
	public int getCpageSu() {
		cpageSu=tot/plist;
		if(tot%plist>0)cpageSu+=1;
		return cpageSu;
	}
	
	
	
	@RequestMapping("postDetail")
	public ModelAndView postdetailProcess(
			@RequestParam("postNo")int postNo,
			@RequestParam("cpage")int cpage,
			@RequestParam("studyNo")int studyNo) {
		
		PostDto pdto1=new PostDto();
		
		pdto1.setsNo(studyNo);
		pdto1.setPostNo(postNo);
		int userNo=postingInter.selectNosUno(pdto1);
		
		StudyMemberDto smdto=new StudyMemberDto();
		smdto.setStudyNo(studyNo);
		smdto.setUserNo(userNo);

		
		int studyMemberNo=smInter.selectStudymemberno(smdto);
		
		System.out.println("studyMemberNo 결과값:"+studyMemberNo);
		
		PostDto pdto=new PostDto();
		pdto.setPostNo(postNo);
		pdto.setStudyMemberNo(studyMemberNo);
		
		if(cpage<=0) {
		//조회수 증가
		postingInter.updatePostcnt(pdto);
		}
		
		
		CommentDto dto=new CommentDto();
		dto.setPostNo(postNo);
		dto.setStudyNo(studyNo);
		
		//댓글 불러오기(postDetail.jsp에서 댓글 출력하기 위함)
		ArrayList<CommentDto> clist=daoInter.getList(dto);
		
		//댓글 페이징 처리
		tot=daoInter.selectComcount(dto);
		//페이지 값 넘겨주기
		
		if(cpage<=0) cpage=1;
		
		ArrayList<CommentDto> result=getcListData(clist, cpage);
		
		String name=udinter.selectUsernoName(userNo);
		
		
		ModelAndView view = new ModelAndView("postDetail");
		view.addObject("pdata", postingInter.getDetail(pdto));
		view.addObject("cdata", result);
		view.addObject("cpage", cpage);
		view.addObject("cpageSu",getCpageSu());
		view.addObject("postNo",postNo);
		view.addObject("studyNo", studyNo);
		view.addObject("name", name);
		//view.addObject("userNo", userNo);
		return view;
		
	}
}
