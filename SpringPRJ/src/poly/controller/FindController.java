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
import poly.service.impl.ApiService;
import poly.util.HttpUtil;
import poly.util.StringUtil;

@Controller
public class FindController {
	@Resource(name="ApiService")
	private ApiService apiService;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="find/findHospital")
	public String findHospital() throws Exception {
		return "/find/findHospital";
	}
	@RequestMapping(value="sido/sidoSearch")
	public @ResponseBody List<Object> sidoSearch(HttpServletRequest req) throws Exception {
		log.info(this.getClass() + " sidoSearch Start!!!");
		String url = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?"+
					"serviceKey=ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D&"+
					"_type=json";
		List<Object> aList = new ArrayList<>();
		HashMap<String,Object> hashmapRes = new HashMap<String, Object>();
		try {
			String charSet = "UTF-8";
			HashMap<String, String> hashmapResponse = (HashMap<String,String>) HttpUtil.callURLGet(url, charSet);
			if ("200".equals(hashmapResponse.get("httpStatus"))){
				String responseBody = String.valueOf(hashmapResponse.get("responseBody"));
				hashmapRes = StringUtil.JsonStringToObject(responseBody);
				String bodyJSON = StringUtil.ObjectToJsonString(hashmapRes.get("body"));
			    JSONParser parser = new JSONParser();
			    Object obj = parser.parse(bodyJSON); 
			    JSONObject jsonObj = (JSONObject) obj;
			    JSONArray bodyJSONArray = (JSONArray) jsonObj.get("items");
			   for(int i=0 ; i<bodyJSONArray.size();i++) {
				   	aList.add(bodyJSONArray.get(i));
			   }
			} else {
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
			}
		}catch (Exception e){
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
		log.info(aList);
		log.info(this.getClass() + " sidoSearch End!!!");
		return aList;
	}
	@RequestMapping(value="sggu/sgguSearch")
	public @ResponseBody List<Object> sgguSearch(HttpServletRequest req) throws Exception {
		log.info(this.getClass() + " sgguSearch Start!!!");
		String sidoCd = req.getParameter("sidoCd");
		String url = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?"+
					"serviceKey=ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D&"+
					"sidoCd=" + sidoCd +
					"&_type=json";
		List<Object> aList = new ArrayList<>();
		HashMap<String,Object> hashmapRes = new HashMap<String, Object>();
		try {
			String charSet = "UTF-8";
			HashMap<String, String> hashmapResponse = (HashMap<String,String>) HttpUtil.callURLGet(url, charSet);
			if ("200".equals(hashmapResponse.get("httpStatus"))){
				String responseBody = String.valueOf(hashmapResponse.get("responseBody"));
				hashmapRes = StringUtil.JsonStringToObject(responseBody);
				String bodyJSON = StringUtil.ObjectToJsonString(hashmapRes.get("body"));
			    JSONParser parser = new JSONParser();
			    Object obj = parser.parse(bodyJSON); 
			    JSONObject jsonObj = (JSONObject) obj;
			    JSONArray bodyJSONArray = (JSONArray) jsonObj.get("items");
			   for(int i=0 ; i<bodyJSONArray.size();i++) {
				   	aList.add(bodyJSONArray.get(i));
			   }
			} else {
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
			}
		}catch (Exception e){
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
		log.info(this.getClass() + " sgguSearch End!!!");
		return aList;
	}
}

