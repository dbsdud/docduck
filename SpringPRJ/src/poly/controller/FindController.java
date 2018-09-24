package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="find/findHospital")
	public String findHospital() {
		return "/find/findHospital";
	}
}
