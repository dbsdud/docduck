package poly.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.util.CmmUtil;

@Controller
public class HomeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="/home")
	public String home(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		return "/home";
	}
	// 여기서부터 카카오 로그인
	@RequestMapping(value="/kakaoCallback")
	public String kakaoCallback(HttpServletRequest req, HttpSession session) throws Exception {
		String kId = CmmUtil.nvl(req.getParameter("kId"));
		String kName = CmmUtil.nvl(req.getParameter("kName"));
		
		session.setAttribute("kId", kId);
		session.setAttribute("kName", kName);
		return "redirect:/home.do";
	}
	
	// 여기서 부터 네이버 로그인
	@RequestMapping(value="/naverCallback")
	public String naverCallback(HttpServletRequest req, HttpSession session) throws Exception {
		
		return "/naverCallback";
	}
	@RequestMapping(value="/naverLogin")
	public String naverLogin(HttpServletRequest req, HttpSession session) throws Exception{
		String email = CmmUtil.nvl(req.getParameter("email"));
		log.info(this.getClass() + " email : " + email);
		String uniqId = CmmUtil.nvl(req.getParameter("uniqId"));
		log.info(this.getClass() + " uniqId : " + uniqId);
		session.setAttribute("email", email);
		session.setAttribute("uniqId", uniqId);
		return "redirect:/home.do";
	}
}
