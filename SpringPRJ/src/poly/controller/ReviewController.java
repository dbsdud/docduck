package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
		if(rList==null) {
			rList = new ArrayList<ReviewDTO>();
		}
		
		model.addAttribute("rList",rList);
		
		log.info(this.getClass() + " reviewListHosp End!!!");
		return "/review/reviewListHosp";
	}
	
}
