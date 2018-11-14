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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.NoticeDTO;
import poly.dto.ReviewDTO;
import poly.dto.UserDTO;
import poly.service.INoticeService;
import poly.service.IReviewService;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class AdminController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	@Resource(name = "UserService")
	private IUserService userService;
	@Resource(name = "ReviewService")
	private IReviewService reviewService;
	
	@RequestMapping(value="admin/adminHome")
	public String adminHome(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception {
		log.info(this.getClass() + " adminHome Start!!!");
		List<UserDTO> uList = userService.getUserList();
		if(uList == null) {
			uList = new ArrayList<UserDTO>();
		}
		List<NoticeDTO> nList = noticeService.getNoticeList();
		if(nList == null) {
			nList = new ArrayList<NoticeDTO>();
		}
		List<ReviewDTO> rList = reviewService.getReviewList();
		if(rList == null) {
			rList = new ArrayList<ReviewDTO>();
		}
		model.addAttribute("uList", uList);
		model.addAttribute("nList", nList);
		model.addAttribute("rList", rList);
		log.info(this.getClass() + " adminHome End!!!");
		return "/admin/adminHome";
	}
	@RequestMapping(value="admin/adminUserDetail",method=RequestMethod.GET)
	public String adminUserDetail(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + " adminUserDetail Start!!!");
		String userNo = CmmUtil.nvl(req.getParameter("userNo"));
		log.info(this.getClass() + " userNo : " + userNo);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUserNo(userNo);
		
		UserDTO uDTO2 = userService.getAdminUserDetail(uDTO);
		model.addAttribute("uDTO2", uDTO2);
		
		log.info(this.getClass() + " adminUserDetail End!!!");
		return "/admin/adminUserDetail";
	}
	@RequestMapping(value="admin/userKick",method=RequestMethod.GET)
	public String userKick(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + " userKick Start!!!");
		String userNo = req.getParameter("userNo");
		log.info(this.getClass() + " userNo : " + userNo);
		int result = userService.userKick(userNo);
		
		String msg="";
		String url="";
		if(result!=0) {
			msg="회원을 탈퇴시켰습니다.";
			url="/admin/adminHome.do";
		} else {
			msg="탈퇴에 실패하였습니다.";
			url="/admin/adminUserDetail.do?userNo="+userNo;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		log.info(this.getClass() + " userKick End!!!");
		return "/alert";
	}
}
