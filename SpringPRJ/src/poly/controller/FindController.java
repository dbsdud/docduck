package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import poly.util.CmmUtil;
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
	@RequestMapping(value="find/findHospSearch")
	public @ResponseBody List<ApiDTO> findHospSearch(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + " findHospSearch Start!!!");
		String sido = req.getParameter("sido");
		int sidoCd = Integer.parseInt(sido);
		String gugun = req.getParameter("gugun");
		int sgguCd = Integer.parseInt(gugun);
		String emdongNm = req.getParameter("dong");
		log.info(this.getClass() + " sido : " + sido);
		log.info(this.getClass() + " gugun : " + gugun);
		log.info(this.getClass() + " dong : " + emdongNm);
		
		ApiDTO aDTO = new ApiDTO();
		aDTO.setSidoCd(sidoCd);
		aDTO.setSgguCd(sgguCd);
		aDTO.setEmdongNm(emdongNm);
		
		List<ApiDTO> aList = new ArrayList<>();
		aList = findService.getHospSearch(aDTO);
		log.info(this.getClass() + " findHospSearch End!!!");
		return aList;
	}
	@RequestMapping(value="find/findHospitalDetail")
	public String findHospitalDetail(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + " findHospitalDetail Start!!!");
		String hospNo = CmmUtil.nvl(req.getParameter("hosp_no"));
		int hosp_no = Integer.parseInt(hospNo);
		log.info(this.getClass() + " int hosp_no : " + hosp_no);
		log.info(this.getClass() + " hospNo : " + hospNo);
		
		ApiDTO aDTO = new ApiDTO();
		aDTO.setHosp_no(hosp_no);
		log.info(this.getClass() + " aDTO.setHosp_no : " + aDTO.getHosp_no());
		log.info(this.getClass() + " findHospitalDetail End!!!");
		return "/find/findHospitalDetail";
	}
}

