package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.util.HttpUtil;
import poly.util.StringUtil;

@Controller
public class FindController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="find/findHospital")
	public String findHospital() {
		return "/find/findHospital";
	}
	@RequestMapping(value="sido/sidoSearch")
	public @ResponseBody List<Object> sidoSearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		log.info(this.getClass() + " sidoSearch Start!!!");
		String url = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?pageNo=1&numOfRows=10&_type=json&ServiceKey=ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D";
		List<Object> mList = new ArrayList<>();
		HashMap<String, Object> hashmapRes = new HashMap<String, Object>();
		
		try {
			String charSet = "UTF-8";
			HashMap<String, String> hashMapResponse = (HashMap<String, String>) HttpUtil.callURLGet(url, charSet);
			if("200".equals(hashMapResponse.get("httpStatus"))) {
				String responseBody = String.valueOf(hashMapResponse.get("responseBody"));
				hashmapRes = StringUtil.JsonStringToObject(responseBody);
				String bodyJSON = StringUtil.ObjectToJsonString(hashmapRes.get("body"));
				JSONParser parser = new JSONParser();
				Object obj = parser.parse(bodyJSON);
				JSONObject jsonObj = (JSONObject) obj;
				JSONArray bodyJSONArray = (JSONArray) jsonObj.get("items");
				
				for(int i = 0; i < bodyJSONArray.size(); i++) {
					mList.add(bodyJSONArray.get(i));
				}
			} else {
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
			}
		} catch (Exception e) {
			hashmapRes.put("REP_CODE", "9999");
			hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
		log.info(this.getClass() + " sidoSearch End!!!");
		return mList;
	}
	
	@RequestMapping(value="gugun/gugunSearch")
	public @ResponseBody List<Object> gugunSearch(HttpServletRequest req) throws Exception {
		log.info(this.getClass() + " gugunSearch Start!!!");
		String sido = req.getParameter("sido"); // sido 변수 매뉴얼에 맞게 변경
		String url = "http://apis.data.go.kr/B551182/hospInfoService/"
				+ "getHospBasisList?pageNo=1&numOfRows=10&_type=json"
				// + 시도 코드명
				+ sido
				+ "&ServiceKey=ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D";
		List<Object> mList = new ArrayList<>();
		HashMap<String, Object> hashmapRes = new HashMap<String, Object>();
		
		try {
			String charSet = "UTF-8";
			
			HashMap<String, String> hashmapResponse = (HashMap<String, String>) HttpUtil.callURLGet(url, charSet);
			if("200".equals(hashmapResponse.get("httpStatus"))) {
				String responseBody = String.valueOf(hashmapResponse.get("responseBody"));
				hashmapRes = StringUtil.JsonStringToObject(responseBody);
				String bodyJSON = StringUtil.ObjectToJsonString(hashmapRes.get("body"));
				JSONParser parser = new JSONParser();
				Object obj = parser.parse(bodyJSON);
				JSONObject jsonObj = (JSONObject) obj;
				JSONArray bodyJSONArray = (JSONArray) jsonObj.get("items");
				
				for(int i = 0; i < bodyJSONArray.size(); i++) {
					mList.add(bodyJSONArray.get(i));
				}
			} else {
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
			}
		} catch (Exception e) {
			hashmapRes.put("REP_CODE", "9999");
			hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
		log.info(this.getClass() + " gugunSearch End!!!");
		return mList;
	}
	
	@RequestMapping(value="dong/dongSearch")
	public @ResponseBody List<Object> dongSearch(HttpServletRequest req) throws Exception {
		log.info(this.getClass() + " dongSearch Start!!!");
		String gugun=req.getParameter("gugun"); // gugun 변수 매뉴얼에 맞게 변경
		String url = "http://apis.data.go.kr/B551182/hospInfoService/"
				+ "getHospBasisList?pageNo=1&numOfRows=10&_type=json"
				// + 구군코드명
				+ gugun
				+ "&ServiceKey=ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D";
		List<Object> mList=new ArrayList<>();
		HashMap<String, Object> hashmapRes = new HashMap<String, Object>();
				
		try {
			String charSet = "UTF-8";
			HashMap<String, String> hashmapResponse = (HashMap<String, String>) HttpUtil.callURLGet(url, charSet);
			if ("200".equals(hashmapResponse.get("httpStatus"))){
				String responseBody = String.valueOf(hashmapResponse.get("responseBody"));
				hashmapRes = StringUtil.JsonStringToObject(responseBody);
				String bodyJSON = StringUtil.ObjectToJsonString(hashmapRes.get("body"));
				JSONParser parser = new JSONParser();
				Object obj = parser.parse(bodyJSON); 
				JSONObject jsonObj = (JSONObject) obj;
				JSONArray bodyJSONArray = (JSONArray) jsonObj.get("items");
				for(int i = 0 ; i < bodyJSONArray.size(); i++) {
					mList.add(bodyJSONArray.get(i));
				}
			} else {
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
			}
		} catch (Exception e){
			hashmapRes.put("REP_CODE", "9999");
			hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
		log.info(this.getClass() + " dongSearch End!!!");
		return mList;
	}
}

