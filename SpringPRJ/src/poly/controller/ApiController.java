package poly.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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

import poly.dto.ApiDTO;
import poly.service.IApiService;
import poly.service.impl.ApiService;
import poly.util.CmmUtil;
import poly.util.HttpUtil;
import poly.util.StringUtil;

@Controller
public class ApiController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name="ApiService")
	private IApiService apiService;
	@RequestMapping(value="/li")
	public String li(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		log.info(getClass() + "Start!!!");
		BufferedReader br = null;
		
		try {
			String urlstr = "http://apis.data.go.kr/"
					+ "B551182/hospInfoService/getHospBasisList?pageNo=1&numOfRows=10&_type=json&"
					+ "ServiceKey=ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			String result="";
			String line;
			while((line=br.readLine())!=null){
                result=result.concat(line);
			}
			JSONParser parser = new JSONParser();
	        JSONObject obj = (JSONObject) parser.parse(result);
	         
	        // Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
	        JSONObject parse_response = (JSONObject) obj.get("response");
	        // response 로 부터 body 찾아옵니다.
	        JSONObject parse_body = (JSONObject) parse_response.get("body");
	        // body 로 부터 items 받아옵니다.
	        JSONObject parse_items = (JSONObject) parse_body.get("items");
	        // items로 부터 itemlist 를 받아오기 itemlist : 뒤에 [ 로 시작하므로 jsonarray이다
	        JSONArray parse_item = (JSONArray) parse_items.get("item");
	        
	        JSONObject resultObj;
	        
	        String yadmNm="", clCdNm="", sidoCdNm="", sgguCdNm="", emdongNm="", addr="", telno="", hospUrl="", XPos="", YPos="";
	        int clCd=0, sidoCd=0, sgguCd=0, postNo=0, estbDd=0, drTotCnt=0, gdrCnt=0, intnCnt=0, resdntCnt=0, sdrCnt=0;

	        for(int i =0 ; i<parse_item.size(); i++) {
				resultObj = (JSONObject) parse_item.get(i);
				/*if(resultObj.equals("yadmNm")) {
					yadmNm = resultObj.get("yadmNm").toString();
					System.out.println("yadmNm : " + yadmNm);
				}
				if(resultObj.equals("clCd")) {
					clCd = Integer.parseInt(resultObj.get("clCd").toString());
					System.out.println("clCd : " + clCd);
				}
				if(resultObj.equals("clCdNm")) {
					clCdNm = CmmUtil.nvl(resultObj.get("clCdNm").toString());
					System.out.println("clCdNm : " + clCdNm);
				}
				if(resultObj.equals("sidoCd")) {
					sidoCd = Integer.parseInt(CmmUtil.nvl(resultObj.get("sidoCd").toString()));
					System.out.println("sidoCd : " + sidoCd);
				}
				if(resultObj.equals("sidoCdNm")) {
					sidoCdNm = CmmUtil.nvl(resultObj.get("sidoCdNm").toString());
					System.out.println("sidoCdNm : " + sidoCdNm);
				}
				if(resultObj.equals("sgguCd")) {
					sgguCd = Integer.parseInt(CmmUtil.nvl(resultObj.get("sgguCd").toString()));
					System.out.println("sgguCd : " + sgguCd);
				}
				if(resultObj.equals("sgguCdNm")) {
					sgguCdNm = CmmUtil.nvl(resultObj.get("sgguCdNm").toString());
					System.out.println("sgguCdNm : " + sgguCdNm);
				}
				if(resultObj.equals("emdongNm")) {
					emdongNm = CmmUtil.nvl(resultObj.get("emdongNm").toString());
					System.out.println("emdongNm : " + emdongNm);
				}
				if(resultObj.equals("postNo")) {
					postNo = Integer.parseInt(CmmUtil.nvl(resultObj.get("postNo").toString()));
					System.out.println("postNo : " + postNo);
				}
				if(resultObj.equals("addr")) {
					addr = CmmUtil.nvl(resultObj.get("addr").toString());
					System.out.println("addr : " + addr);
				}
				if(resultObj.equals("telno")) {
					telno = CmmUtil.nvl(resultObj.get("telno").toString());
					System.out.println("telno : " + telno);
				}
				if(resultObj.equals("hospUrl")) {
					hospUrl = CmmUtil.nvl(resultObj.get("hospUrl").toString());
					System.out.println("hospUrl : " + hospUrl);
				}
				if(resultObj.equals("estbDd")) {
					estbDd = Integer.parseInt(CmmUtil.nvl(resultObj.get("estbDd").toString()));
					System.out.println("estbDd : " + estbDd);
				}
				if(resultObj.equals("drTotCnt")) {
					drTotCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("drTotCnt").toString()));
					System.out.println("drTotCnt : " + drTotCnt);
				}
				if(resultObj.equals("gdrCnt")) {
					gdrCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("gdrCnt").toString()));
					System.out.println("gdrCnt : " + gdrCnt);
				}
				if(resultObj.equals("intnCnt")) {
					intnCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("intnCnt").toString()));
					System.out.println("intnCnt : " + intnCnt);
				}
				if(resultObj.equals("resdntCnt")) {
					resdntCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("resdntCnt").toString()));
					System.out.println("resdntCnt : " + resdntCnt);
				}
				if(resultObj.equals("sdrCnt")) {
					sdrCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("sdrCnt").toString()));
					System.out.println("sdrCnt : " + sdrCnt);
				}
				if(resultObj.equals("XPos")) {
					XPos = CmmUtil.nvl(resultObj.get("XPos").toString());
					System.out.println("XPos : " + XPos);
				}
				if(resultObj.equals("YPos")) {
					YPos = CmmUtil.nvl(resultObj.get("YPos").toString());
					System.out.println("YPos : " + YPos);
				}
				String regDate = CmmUtil.nvl(req.getParameter("regDate"));*/
				
				/*여기 해결해야됨*/
				System.out.println("----------------------------------");
				yadmNm = CmmUtil.nvl(resultObj.get("yadmNm").toString());
				System.out.println("yadmNm : " + yadmNm);
				clCd = Integer.parseInt(resultObj.get("clCd").toString());
				System.out.println("clCd : " + clCd);
				clCdNm = CmmUtil.nvl(resultObj.get("clCdNm").toString());
				System.out.println("clCdNm : " + clCdNm);
				sidoCd = Integer.parseInt(CmmUtil.nvl(resultObj.get("sidoCd").toString()));
				System.out.println("sidoCd : " + sidoCd);
				sidoCdNm = CmmUtil.nvl(resultObj.get("sidoCdNm").toString());
				System.out.println("sidoCdNm : " + sidoCdNm);
				sgguCd = Integer.parseInt(CmmUtil.nvl(resultObj.get("sgguCd").toString()));
				System.out.println("sgguCd : " + sgguCd);
				sgguCdNm = CmmUtil.nvl(resultObj.get("sgguCdNm").toString());
				System.out.println("sgguCdNm : " + sgguCdNm);
				if(resultObj.get("emdongNm").toString()==""||resultObj.get("emdongNm").toString()==null){
					emdongNm = CmmUtil.nvl(resultObj.get("emdongNm").toString());
					System.out.println("emdongNm : " + emdongNm);	
				}
				postNo = Integer.parseInt(CmmUtil.nvl(resultObj.get("postNo").toString()));
				System.out.println("postNo : " + postNo);
				addr = CmmUtil.nvl(resultObj.get("addr").toString());
				System.out.println("addr : " + addr);
				telno = CmmUtil.nvl(resultObj.get("telno").toString());
				System.out.println("telno : " + telno);
				if(resultObj.equals("hospUrl")) {
					hospUrl = CmmUtil.nvl(resultObj.get("hospUrl").toString());
					System.out.println("hospUrl : " + hospUrl);	
				}
				estbDd = Integer.parseInt(CmmUtil.nvl(resultObj.get("estbDd").toString()));
				System.out.println("estbDd : " + estbDd);
				drTotCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("drTotCnt").toString()));
				System.out.println("drTotCnt : " + drTotCnt);
				gdrCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("gdrCnt").toString()));
				System.out.println("gdrCnt : " + gdrCnt);
				intnCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("intnCnt").toString()));
				System.out.println("intnCnt : " + intnCnt);
				resdntCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("resdntCnt").toString()));
				System.out.println("resdntCnt : " + resdntCnt);
				if(resultObj.equals("sdrCnt")) {
					sdrCnt = Integer.parseInt(CmmUtil.nvl(resultObj.get("sdrCnt").toString()));
					System.out.println("sdrCnt : " + sdrCnt);	
				}
				XPos = CmmUtil.nvl(resultObj.get("XPos").toString());
				System.out.println("XPos : " + XPos);
				YPos = CmmUtil.nvl(resultObj.get("YPos").toString());
				System.out.println("YPos : " + YPos);	
				String regDate = CmmUtil.nvl(req.getParameter("regDate"));
				System.out.println("----------------------------------");
				
				ApiDTO aDTO = new ApiDTO();
				aDTO.setYadmNm(yadmNm);
				aDTO.setClCd(clCd);
				aDTO.setClCdNm(clCdNm);
				aDTO.setSidoCd(sidoCd);
				aDTO.setSidoCdNm(sidoCdNm);
				aDTO.setSgguCd(sgguCd);
				aDTO.setSgguCdNm(sgguCdNm);
				aDTO.setEmdongNm(emdongNm);
				aDTO.setPostNo(postNo);
				aDTO.setAddr(addr);
				aDTO.setTelno(telno);
				aDTO.setHospUrl(hospUrl);
				aDTO.setEstbDd(estbDd);
				aDTO.setDrTotCnt(drTotCnt);
				aDTO.setGdrCnt(gdrCnt);
				aDTO.setIntnCnt(intnCnt);
				aDTO.setResdntCnt(resdntCnt);
				aDTO.setSdrCnt(sdrCnt);
				aDTO.setXPos(XPos);
				aDTO.setYPos(YPos);
				aDTO.setRegDate(regDate);
			
				int result2 = apiService.insertApi(aDTO);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		log.info(getClass() + "End!!!");
		return "/li";
	}
	/*@RequestMapping(value="/li")
	public String li(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		log.info("Start");
		String url = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?pageNo=1&numOfRows=10&_type=json&ServiceKey=ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D";
		List<Object> mList=new ArrayList<>();
		HashMap<String, Object> hashmapRes = new HashMap<String, Object>();
		
		try{
			String charSet = "UTF-8";
			
			HashMap<String, String> hashmapResponse = (HashMap<String, String>) HttpUtil.callURLGet(url, charSet);
			if ("200".equals(hashmapResponse.get("httpStatus"))){
				String responseBody = String.valueOf(hashmapResponse.get("responseBody"));
				System.out.println(responseBody+"김한결 리스폰스 바디");
				hashmapRes = StringUtil.JsonStringToObject(responseBody);
				String bodyJSON = StringUtil.ObjectToJsonString(hashmapRes.get("body"));
			    JSONParser parser = new JSONParser();
			    Object obj = parser.parse(bodyJSON); 
			    JSONObject jsonObj = (JSONObject) obj;
			    JSONArray bodyJSONArray = (JSONArray) jsonObj.get("items");
			    System.out.println(bodyJSONArray);
			   for(int i=0 ; i<bodyJSONArray.size();i++) {
				   System.out.println(bodyJSONArray.get(i));
				   	mList.add(bodyJSONArray.get(i));
				   
			   }
			}else{
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
			}
		}catch (Exception e){
			hashmapRes.put("REP_CODE", "9999");
			hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
		log.info(mList);
	 		log.info("smallcg end:"+this.getClass());
			return "/li";
	}*/
}
