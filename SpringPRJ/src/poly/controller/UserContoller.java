package poly.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping(value="user/userChecked")
	@ResponseBody
	public void getUserIdCheck(HttpServletRequest req, HttpServletResponse res) throws Exception{
		String id = CmmUtil.nvl(req.getParameter("id"));
		
		int count=0;
		count = userService.getUserIdCheck(id);
		log.info(this.getClass()+ " count : " + count);
		System.out.println("count : " + count);
		res.getWriter().println(count);
	}
	
}
