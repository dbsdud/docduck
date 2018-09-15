package poly.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.jdbc.log.Log;

import poly.util.CmmUtil;

@Controller
public class UserContoller {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="user/userReg")
	public String userReg() {
		return "/user/userReg";
	}
	
	/*@RequestMapping(value="user/userRegProc", method=RequestMethod.POST)
	public String userRegProc(HttpServletRequest req, Model model) throws Exception{
		String id = CmmUtil.nvl(req.getParameter("id"));
		log.info(this.getClass() + " id : " + id);
		String password = CmmUtil.nvl(req.getParameter("password"));
		log.info(this.getClass() + " password : " + password);
		String userName = CmmUtil.nvl(req.getParameter("userName"));
		log.info(this.getClass() + " userName : " + userName);
		String userTel = CmmUtil.nvl(req.getParameter("userTel"));
		log.info(this.getClass() + " userTel : " + userTel);
		String regDate = CmmUtil.nvl(req.getParameter("regDate"));
		log.info(this.getClass() + " regDate : " + regDate);
		String regNo = CmmUtil.nvl(req.getParameter("regNo"));
		log.info(this.getClass() + " regNo : " + regNo);
		
		return "/alert";
	}*/
	
}
