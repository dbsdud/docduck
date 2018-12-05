package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dto.NoticeDTO;
import poly.service.INoticeService;
import poly.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	public String stringToHtmlSign(String str) {
		return str.replaceAll("&amp;", "&")
				.replaceAll("&lt;", "<")
	            .replaceAll("&gt;", ">")
	            .replaceAll("&quot;", "[\"]")
	            .replaceAll("&#39;", "[\\]")
	            .replaceAll("&#40;", "(")
	            .replaceAll("&#41;", ")")
	            .replaceAll("& amp;", "&")
	            .replaceAll("& lt;", "<")
	            .replaceAll("& gt;", ">")
	            .replaceAll("& quot;", "[\"]")
	            .replaceAll("& #39;", "[\\]")
				.replaceAll("& #40;", "(")
				.replaceAll("& #41;", ")");
	}
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 * */
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	
	/*@RequestMapping(value="notice/noticeList")
	public String noticeList(@ModelAttribute("NoticeDTO") NoticeDTO nDTO, HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session, @RequestParam(defaultValue="1") int curPage) throws Exception{
		log.info("noticeList Start!!!");
		// 전체 리스트 개수
		int listCnt = noticeService.getNoticeListCnt();
		
		Pagination pagination = new Pagination(listCnt, curPage);
		nDTO.setStartIndex(pagination.getStartIndex());
		nDTO.setCntPerPage(pagination.getPageSize());
		
		// 전체 리스트 출력
		List<NoticeDTO> nList = noticeService.getNoticeList();
		if(nList==null) {
			nList = new ArrayList<NoticeDTO>();
		}
		model.addAttribute("nList",nList);
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagination);
		log.info("noticeList End!!!");
		return "/notice/noticeList";
	}*/
	
	@RequestMapping(value="notice/noticeList")
	public String noticeList(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		log.info("noticeList Start!!!");
		List<NoticeDTO> nList = noticeService.getNoticeList();
		if(nList==null) {
			nList = new ArrayList<NoticeDTO>();
		}
		model.addAttribute("nList",nList);
		log.info("noticeList End!!!");
		return "/notice/noticeList";
	}
	
	@RequestMapping(value="notice/noticeReg")
	public String noticeReg(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + " noticeReg Start!!!");
	
		log.info(this.getClass() + " noticeReg End!!!");
		return "/notice/noticeReg";
	}
	@RequestMapping(value="notice/noticeRegProc", method=RequestMethod.POST)
	public String insertNotice(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + " noticeRegProc Start!!!");
		String noticeTitle = stringToHtmlSign(req.getParameter("noticeTitle"));
		log.info(this.getClass() + " noticeTitle : " + noticeTitle);
		String noticeContent = stringToHtmlSign(req.getParameter("noticeContent"));
		log.info(this.getClass() + " noticeContent : " + noticeContent);
		String noticeWriter = req.getParameter("noticeWriter");
		log.info(this.getClass() + " noticeWriter : " + noticeWriter);
		String regNo = req.getParameter("regNo");
		log.info(this.getClass() + " regNo : " + regNo);
		
		
		String msg="";
		String url="";
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeTitle(noticeTitle);
		nDTO.setNoticeContent(noticeContent);
		nDTO.setNoticeWriter(noticeWriter);
		nDTO.setRegNo(regNo);
		
		int result=noticeService.insertNotice(nDTO);
		
		if(result != 0) {
			msg="공지사항을 등록했습니다.";
			url="/notice/noticeList.do";
		} else {
			msg="공지사항 등록에 실패했습니다.";
			url="/notice/noticeReg.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		log.info(this.getClass() + " noticeRegProc End!!!");
		return "/alert";
	}
	@RequestMapping(value="notice/noticeDetail",method=RequestMethod.GET)
	public String noticeDetail(HttpServletRequest req, HttpSession session, Model model) throws Exception {
		log.info(this.getClass() + " noticeDetail Start!!!");
		String noticeNo = CmmUtil.nvl(req.getParameter("noticeNo"));
		log.info(this.getClass() + " noticeNo : " + noticeNo);
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo(noticeNo);
		
		log.info(this.getClass() + " noticeNo : " + noticeNo);
		
		NoticeDTO nDTO2 = noticeService.getNoticeDetail(nDTO);
		
		int updateCount=noticeService.updateNoticeCount(noticeNo);
		
		model.addAttribute("nDTO2",nDTO2);
		log.info(this.getClass() + " noticeDetail End!!!");
		return "/notice/noticeDetail";
	}
	@RequestMapping(value="notice/noticeDelete", method=RequestMethod.GET)
	public String noticeDelete(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + " noticeDelete Start!!!");
		String noticeNo = req.getParameter("noticeNo");
		log.info(this.getClass() + " noticeNo : " + noticeNo);
		int result = noticeService.deleteNotice(noticeNo);
		
		String msg="";
		String url="";
		if(result!=0) {
			msg="삭제하였습니다.";
			url="/notice/noticeList.do";
		} else {
			msg="삭제에 실패하였습니다.";
			url="/notice/noticeList.do?noticeNo="+noticeNo;
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		log.info(this.getClass() + " noticeDelete End!!!");
		
		return "/alert";
	}
	@RequestMapping(value="notice/noticeUpdate",method=RequestMethod.GET)
	public String noticeUpdate(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + " noticeUpdate Start!!!");
		String noticeNo = req.getParameter("noticeNo");
		log.info(this.getClass() + " noticeNo : " + noticeNo);
		
		NoticeDTO nDTO1 = new NoticeDTO();
		nDTO1.setNoticeNo(noticeNo);
		log.info(this.getClass() + " nDTO1.getNoticeNo : " + nDTO1.getNoticeNo());
		
		NoticeDTO nDTO = noticeService.getNoticeDetail(nDTO1);
		log.info(this.getClass() + " noticeNo : " + nDTO.getNoticeNo());
		
		model.addAttribute("nDTO",nDTO);
		log.info(this.getClass() + " noticeUpdate End!!!");
		return "/notice/noticeUpdate";
	}
	@RequestMapping(value="notice/noticeUpdateProc",method=RequestMethod.POST)
	public String noticeUpdateProc(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + " noticeUpdateProc Start!!!");
		String noticeNo = req.getParameter("noticeNo");
		log.info(this.getClass() + " noticeNo : " + noticeNo);
		String noticeTitle = stringToHtmlSign(req.getParameter("noticeTitle"));
		log.info(this.getClass() + " noticeTitle : " + noticeTitle);
		String noticeContent = stringToHtmlSign(req.getParameter("noticeContent"));
		String noticeWriter = req.getParameter("noticeWriter");
		log.info(this.getClass() + " noticeWriter : " + noticeWriter);
		String regNo = req.getParameter("regNo");
		log.info(this.getClass() + " regNo : " + regNo);
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo(noticeNo);
		nDTO.setNoticeTitle(noticeTitle);
		nDTO.setNoticeContent(noticeContent);
		nDTO.setNoticeWriter(noticeWriter);
		nDTO.setRegNo(regNo);
		
		int result = noticeService.updateNotice(nDTO);
		log.info(this.getClass() + " result : " + result);
		String msg="";
		String url="";
		if(result != 0) {
			msg="공지사항을 수정하였습니다.";
			url="/notice/noticeList.do";
		} else {
			msg="수정에 실패하였습니다.";
			url="/notice/noticeUpdate.do?noticeNo="+noticeNo;
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		log.info(this.getClass() + " noticeUpdateProc End!!!");
		return "/alert";
	}
	/*
	 * 함수명 위의 value="notice/NoticeList" => /notice/NoticeList.do로 호출되는 url은 무조건 이 함수가 실행된다.
	 * method=RequestMethod.GET => 폼 전송방법을 지정하는 것으로 get방식은 GET, post방식은 POST이다.
	 * method => 기입안하면 GET, POST 모두 가능하나, 가급적 적어주는 것이 좋다.
	 * */
	
	/*@RequestMapping(value="main")
	public String main(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		System.out.println("main");
		return "/index";
	}*/
	
	/**
	 * 게시판 리스트 보여주기
	 * */
	/*@RequestMapping(value="notice/NoticeList", method=RequestMethod.GET)
	public String NoticeList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".NoticeList start!");
		
		//공지사항 리스트 가져오기
		List<NoticeDTO> rList = noticeService.getNoticeList();
		
		if (rList==null){
			rList = new ArrayList<NoticeDTO>();
			
		}
		
		//조회된 리스트 결과값 넣어주기
		model.addAttribute("rList", rList);
		
		//변수 초기화(메모리 효율화 시키기 위해 사용함)
		rList = null;
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		//함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/notice/NoticeList.jsp) 
		return "/notice/NoticeList";
	}*/
}
