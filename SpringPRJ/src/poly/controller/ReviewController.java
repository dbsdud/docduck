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

import poly.dto.ApiDTO;
import poly.dto.ReviewDTO;
import poly.dto.UserDTO;
import poly.service.IApiService;
import poly.service.IReviewService;
import poly.service.impl.ReviewService;
import poly.util.CmmUtil;

@Controller
public class ReviewController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ApiService")
	private IApiService apiService;
	@Resource(name="ReviewService")
	private IReviewService reviewService;
	
	@RequestMapping(value="review/reviewListHosp")
	public String reviewList(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + " reviewListHosp Start!!!");
		String hospNo = CmmUtil.nvl(req.getParameter("hosp_no"));
		log.info(this.getClass() + " hospNo : " + hospNo);
		
		ReviewDTO rDTO = new ReviewDTO();
		rDTO.setHospNo(hospNo);
		
		List<ReviewDTO> rList = reviewService.getReviewListHosp(rDTO);
		/*if(rList==null) {
			rList = new ArrayList<ReviewDTO>();
		}*/
		log.info(rList);
		model.addAttribute("rDTO",rDTO);
		model.addAttribute("rList",rList);
		
		log.info(this.getClass() + " reviewListHosp End!!!");
		return "/review/reviewListHosp";
	}
	
	@RequestMapping(value="review/reviewReg")
	public String reviewReg(HttpServletRequest req, HttpSession session,Model model) throws Exception{
		String hospNo=CmmUtil.nvl(req.getParameter("hosp_no"));
		log.info(this.getClass() + " hospNo : " + hospNo);
		ReviewDTO rDTO = new ReviewDTO();
		rDTO.setHospNo(hospNo);
		model.addAttribute("rDTO",rDTO);
		return "/review/reviewReg";
	}
	
	@RequestMapping(value="review/reviewRegProc", method=RequestMethod.POST)
	public String insertReview(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + " reviewRegProc Start!!!");
		String hospNo=CmmUtil.nvl(req.getParameter("hosp_no"));
		log.info(this.getClass() + " hospNo : " + hospNo);
		String reviewTreat = CmmUtil.nvl(req.getParameter("treatVal"));
		log.info(this.getClass() + " reviewTreat : " + reviewTreat);
		String reviewService1 = CmmUtil.nvl(req.getParameter("serviceVal"));
		log.info(this.getClass() + " reviewService : " + reviewService1);
		String reviewFacil = CmmUtil.nvl(req.getParameter("facilVal"));
		log.info(this.getClass() + " reviewFacil : " + reviewFacil);
		String reviewContent = CmmUtil.nvl(req.getParameter("reviewContent"));
		String id = CmmUtil.nvl(req.getParameter("id"));
		log.info(this.getClass() + " id : " + id);
		String regNo = CmmUtil.nvl(req.getParameter("regNo"));
		log.info(this.getClass() + " regNo : " + regNo);
		
		ReviewDTO rDTO = new ReviewDTO();
		rDTO.setHospNo(hospNo);
		rDTO.setReviewTreat(reviewTreat);
		rDTO.setReviewService(reviewService1);
		rDTO.setReviewFacil(reviewFacil);
		rDTO.setReviewContent(reviewContent);
		rDTO.setId(id);
		rDTO.setRegNo(regNo);
		
		int result = reviewService.insertReview(rDTO);
		String msg="";
		String url="";
		if(result!=0) {
			msg="리뷰를 등록했습니다.";
			url="/review/reviewListHosp.do?hosp_no="+hospNo;
		} else {
			msg="리뷰 등록에 실패했습니다.";
			url="/review/reviewReg.do";
		}
		model.addAttribute(rDTO);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		log.info(this.getClass() + " reviewRegProc End!!!");
		return "/alert";
	}
	@RequestMapping(value="review/reviewUpdate",method=RequestMethod.GET)
	public String reviewUpdate(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + " reviewUpdate Start!!!");
		String hospNo = req.getParameter("hosp_no");
		log.info(this.getClass() + " hospNo : " + hospNo);
		String reviewNo = req.getParameter("reviewNo");
		log.info(this.getClass() + " reviewNo : " + reviewNo);
		
		ReviewDTO rDTO1 = new ReviewDTO();
		rDTO1.setHospNo(hospNo);
		rDTO1.setReviewNo(reviewNo);
		
		ReviewDTO rDTO = reviewService.getReviewDetail(rDTO1);
		
		model.addAttribute("rDTO",rDTO);
		log.info(this.getClass() + " reviewUpdate End!!!");
		return "/review/reviewUpdate";
	}
	@RequestMapping(value="review/reviewUpdateProc",method=RequestMethod.POST)
	public String reviewUpdateProc(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + " reviewUpdateProc Start!!!");
		String hospNo = req.getParameter("hosp_no");
		log.info(this.getClass() + " hospNo : " + hospNo);
		String reviewNo = req.getParameter("reviewNo");
		log.info(this.getClass() + " reviewNo : " + reviewNo);
		String reviewTreat = req.getParameter("treatVal");
		log.info(this.getClass() + " reviewTreat : " + reviewTreat);
		String reviewService1 = req.getParameter("serviceVal");
		log.info(this.getClass() + "reviewService : " + reviewService1);
		String reviewFacil = req.getParameter("facilVal");
		log.info(this.getClass() + " reviewFacil : " + reviewFacil);
		String reviewContent = req.getParameter("reviewContent");
		String regNo = req.getParameter("regNo");
		log.info(this.getClass() + " regNo : " + regNo);
		
		ReviewDTO rDTO = new ReviewDTO();
		rDTO.setHospNo(hospNo);
		rDTO.setReviewNo(reviewNo);
		rDTO.setReviewTreat(reviewTreat);
		rDTO.setReviewService(reviewService1);
		rDTO.setReviewFacil(reviewFacil);
		rDTO.setReviewContent(reviewContent);
		rDTO.setRegNo(regNo);
		
		int result = reviewService.updateReview(rDTO);
		String msg="";
		String url="";
		if(result!=0) {
			msg="리뷰를 수정하였습니다.";
			url="/review/reviewListHosp.do?hosp_no=" + hospNo;
		} else {
			msg="수정에 실패하였습니다.";
			url="/review/reviewUpdate.do?hosp_no="+hospNo+"&reviewNo="+reviewNo;
		}
		model.addAttribute("rDTO",rDTO);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		log.info(this.getClass() + " reviewUpdateProc End!!!");
		return "/alert";
	}
}
