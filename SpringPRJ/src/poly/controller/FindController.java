package poly.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FindController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="find/findHospital")
	public String findHospital() {
		return "/find/findHospital";
	}
	/*@RequestMapping(value="sido/sidoSearch")
	public @ResponseBody List<Object> sidoSearch(HttpServletRequest req) throws Exception{
		// 1. 시도 , 구군 , 동  select 문으로 조회 하면 되고 
		//2. 조회한 결과ㅣ
		
		String addr = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?pageNo=1&numOfRows=10&_type=json&ServiceKey=";
		String myKey = "ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D";
		String serviceKey = URLEncoder.encode(myKey,"UTF-8");
		String parameter="";

		
		return null;
	}*/
}
