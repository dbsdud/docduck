package poly.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.log.Log;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.service.impl.UserService;
import poly.util.CmmUtil;

@Controller
public class UserContoller {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	/*회원가입 시작*/
	//회원가입 폼
	@RequestMapping(value="user/userReg")
	public String userReg() {
		return "/user/userReg";
	}
	//회원가입 처리
	@RequestMapping(value="user/userRegProc", method=RequestMethod.POST)
	public String userRegProc(HttpServletRequest req, Model model) throws Exception{
		String id = CmmUtil.nvl(req.getParameter("id"));
		log.info(this.getClass() + " id : " + id);
		String password = CmmUtil.nvl(req.getParameter("password"));
		log.info(this.getClass() + " password : " + password);
		String userName = CmmUtil.nvl(req.getParameter("userName"));
		log.info(this.getClass() + " userName : " + userName);
		String userTel = CmmUtil.nvl(req.getParameter("userTel"));
		log.info(this.getClass() + " userTel : " + userTel);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setId(id);
		uDTO.setPassword(password);
		uDTO.setUserName(userName);
		uDTO.setUserTel(userTel);
		
		int result = userService.insertUser(uDTO);
		UserDTO uDTO2 = new UserDTO();
		System.out.println("userNo : " + uDTO.getUserNo());
		uDTO2.setRegNo(uDTO.getUserNo());
		int result2 = userService.updateUserRegNo(uDTO2);
		log.info(this.getClass() + " result2 : " + result2);
		String msg="";
		String url="";
		
		if(result != 0) {
			msg = "회원가입에 성공하였습니다.";
			url = "/home.do";
		} else {
			msg = "회원가입에 실패하였습니다.";
			url = "/user/userReg.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/user/userAlert";
	}
	//회원 중복체크
	@RequestMapping(value="user/idCheck.do")
	@ResponseBody
	public Map<Object, Object> idCheck(HttpServletRequest req, HttpServletResponse res) throws Exception{
		String id = CmmUtil.nvl(req.getParameter("id"));
		
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = userService.getUserIdCheck(id);
		log.info(this.getClass() + "count : " + count);
		map.put("cnt", count);
		
		return map;
	}
	
	
	// 로그인
	@RequestMapping(value="user/loginProc", method=RequestMethod.POST)
	public String loginProc(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		String id = CmmUtil.nvl(req.getParameter("id"));
		String password = CmmUtil.nvl(req.getParameter("password"));
		log.info(this.getClass() + " id : " + id);
		log.info(this.getClass() + " password : " + password);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setId(id);
		uDTO.setPassword(password);
		
		uDTO = userService.getUserLogin(uDTO);
		String msg = "";
		String url = "";
		
		if(uDTO==null) {
			msg = "아이디 혹은 비밀번호가 다릅니다.";
			url = "/home.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/alert";
		} else {
			session.setAttribute("id", uDTO.getId());
			session.setAttribute("password", uDTO.getPassword());
			session.setAttribute("userName", uDTO.getUserName());
			session.setAttribute("userNo", uDTO.getUserNo());
			session.setAttribute("regNo", uDTO.getRegNo());
		}
		return "redirect:/home.do";
	}
	// 로그아웃
	@RequestMapping(value="user/logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/home.do";
	}
	// 계정찾기
	@RequestMapping(value="user/findAccount")
	public String findAccount(HttpServletRequest req, HttpServletResponse res) throws Exception{
		return "/user/findAccount";
	}
	// ID 찾기 기능 
	@RequestMapping(value="user/findAccountId", method=RequestMethod.POST)
	public @ResponseBody List<UserDTO> findAccountId(HttpServletRequest req) throws Exception {
		log.info("findAccountId Start!!!");
		String userName = CmmUtil.nvl(req.getParameter("userName"));
		String userTel = CmmUtil.nvl(req.getParameter("userTel"));
		log.info(this.getClass() + " userName : " + userName);
		log.info(this.getClass() + " userTel : " + userTel);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUserName(userName);
		uDTO.setUserTel(userTel);
		log.info("getUserName : " + uDTO.getUserName());
		log.info("getUserTel : " + uDTO.getUserTel());
		
		List<UserDTO> uList = userService.findAccountId(uDTO);
		log.info("id : " + uList.get(0).getId());
		log.info("findAccountId end!!!");
		return uList;
	}
	// 비밀번호 찾기 기능
	@RequestMapping(value="user/findAccountPw", method=RequestMethod.POST)
	public @ResponseBody List<UserDTO> findAccountPw(HttpServletRequest req) throws Exception{
		log.info("findaccountPw Start!!!");
		String id = CmmUtil.nvl(req.getParameter("id"));
		String userName = CmmUtil.nvl(req.getParameter("userName"));
		String userTel = CmmUtil.nvl(req.getParameter("userTel"));
		log.info("findPwId : " + id);
		log.info("findPwName : " + userName);
		log.info("findPwTel : " + userTel);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setId(id);
		uDTO.setUserName(userName);
		uDTO.setUserTel(userTel);
		log.info("getId : " + uDTO.getId());
		log.info("getUserName : " + uDTO.getUserName());
		log.info("getUserTel : " + uDTO.getUserTel());
		
		List<UserDTO> uList = userService.findAccountPw(uDTO);
		log.info("password : " + uList.get(0).getPassword());
		log.info("findAccountPw End!!!");
		return uList;
	}
	// 마이페이지 입장
	@RequestMapping(value="user/myPage")
	public String myPage(HttpServletRequest req, Model model) throws Exception {
		log.info(this.getClass() + " myPage Start!!!");
		log.info(this.getClass() + " myPage End!!!");
		return "/user/myPage";
	}
	// 마이페이지 상세
	@RequestMapping(value="user/myPageDetail",method=RequestMethod.GET)
	public String myPageDetail(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + " myPageDetail Start!!");
		String userNo = CmmUtil.nvl(req.getParameter("userNo"));
		log.info(this.getClass() + " userNo : " + userNo);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUserNo(userNo);
		log.info(this.getClass() + " userNo : " + userNo);
		
		UserDTO uDTO2 = userService.getUserDetail(uDTO);
		model.addAttribute("uDTO2", uDTO2);
		
		log.info(this.getClass() + " myPageDetail End!!");
		return "/user/myPageDetail";
	}
	
	@RequestMapping(value="user/updInfoProc", method=RequestMethod.POST)
	public String updInfoProc(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + " updInfoProc Start!!!");
		String userNo = req.getParameter("userNo");
		log.info(this.getClass() + " userNo : " + userNo);
		String password = req.getParameter("updPassword");
		log.info(this.getClass() + " password : " + password);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUserNo(userNo);
		log.info(this.getClass() + " userNo : " + userNo);
		uDTO.setPassword(password);
		
		int result = userService.updInfo(uDTO);
		String msg="";
		String url="";
		if(result!=0) {
			msg="비밀번호를 변경하였습니다.";
			url="/home.do";
		} else {
			msg="비밀번호 변경에 실패하였습니다.";
			url="/user/myPageDetail.do?userNo=" + userNo;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		log.info(this.getClass() + " updInfoProc End!!!");
		return "/alert";
	}
}
