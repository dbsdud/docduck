package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value="/home")
	public String home(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		return "/home";
	}
	/*@RequestMapping(value="/li")
	public String li(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		return "/li";
	}*/
	// 여기서 부터 네이버 로그인
	@RequestMapping(value="/naverCallback")
	public String naverLogin(HttpServletRequest req) throws Exception {
		return "/naverCallback";
	}
}
