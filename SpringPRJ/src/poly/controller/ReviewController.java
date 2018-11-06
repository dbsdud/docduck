package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="review/reviewDetail")
	public String reviewDetail(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		return "/review/reviewDetail";
	}
}
