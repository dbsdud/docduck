package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.ApiDTO;
import poly.dto.DongDTO;
import poly.dto.GugunDTO;
import poly.service.IFindService;
import poly.util.HttpUtil;
import poly.util.StringUtil;

@Controller
public class FindController {
	@Resource(name="FindService")
	private IFindService findService;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="find/findHospital")
	public String findHospital() throws Exception {
		return "/find/findHospital";
	}
	@RequestMapping(value="/gugun/gugunSearch")
	public @ResponseBody List<GugunDTO> gugunSearch(HttpServletRequest req) throws Exception{
		log.info(this.getClass() + " gugunSearch Start!!!");
		List<GugunDTO> gList=new ArrayList<>();
		String sido=req.getParameter("sido");
		log.info(this.getClass() + " sido : " + sido);
		gList=findService.getGugunList(sido);
		log.info(this.getClass() + " gugunSearch End!!!");
		return gList;
	}
	@RequestMapping(value="/dong/dongSearch")
	public @ResponseBody List<DongDTO> dongSearch(HttpServletRequest req) throws Exception{
		log.info(this.getClass() + " dongSearch Start!!!");
		List<DongDTO> dList = new ArrayList<>();
		String gugun=req.getParameter("gugun");
		dList = findService.getDongList(gugun);
		log.info(this.getClass() + " dongSearch End!!!");
		return dList;
	}
}

