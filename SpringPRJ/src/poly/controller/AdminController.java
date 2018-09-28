package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="admin/adminHome")
	public String adminHome(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception {
		return "/admin/adminHome";
	}
	
}
