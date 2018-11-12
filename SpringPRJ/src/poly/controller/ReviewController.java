package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.ApiDTO;
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
	
	@RequestMapping(value="review/reviewDetail")
	public String reviewDetail(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + " reviewDetail Start!!!");
		log.info(this.getClass() + " reviewDetail End!!!");
		return "/review/reviewDetail";
	}
}
