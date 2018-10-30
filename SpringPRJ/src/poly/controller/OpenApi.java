package poly.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import poly.util.CmmUtil;

public class OpenApi {
	public static void main(String[] args) {
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
	        
	        String category;
	        JSONObject resultObj;
	        
	        String yadmNm, clCdNm, sidoCdNm, sgguCdNm, emdongNm, addr, telno, hospUrl, xPos, yPos;
	        int clCd, sidoCd, sgguCd, postNo, estbDd, drTotCnt, gdrCnt, intnCnt, resdntCnt, sdrCnt;
	        
	        String na = null;
	        System.out.println(na);
	        String na2 = CmmUtil.nvl(na);
	        System.out.println(na2);
	        System.out.println("------------------");
	        for(int i =0 ; i<parse_item.size(); i++) {
		        resultObj = (JSONObject)parse_item.get(i);
		        	/*Iterator it = resultObj.keySet().iterator();
		        	while(it.hasNext()) {
		        		it.next();
		        		System.out.println(it.next());
		        		if (resultObj.containsKey(it.next())) {
		        			resultObj
		        		}
		        	}*/
				yadmNm = resultObj.get("yadmNm").toString();
				/*System.out.println("yadmNm : " + yadmNm);*/
				clCd = resultObj.get("clCd").hashCode();
				/*System.out.println("clCd : " + clCd);*/
				clCdNm = resultObj.get("clCdNm").toString();
				/*System.out.println("clCdNm : " + clCdNm);*/
				sidoCd = resultObj.get("sidoCd").hashCode();
				/*System.out.println("sidoCd : " + sidoCd);*/
				sidoCdNm = resultObj.get("sidoCdNm").toString();
				/*System.out.println("sidoCdNm : " + sidoCdNm);*/
				sgguCd = resultObj.get("sgguCd").hashCode();
				/*System.out.println("sgguCd : " + sgguCd);*/
				sgguCdNm = resultObj.get("sgguCdNm").toString();
				/*System.out.println("sgguCdNm : " + sgguCdNm);*/
				emdongNm = resultObj.get("emdongNm").toString();
				/*System.out.println("emdongNm : " + emdongNm);*/
				postNo = resultObj.get("postNo").hashCode();
				/*System.out.println("postNo : " + postNo);*/
				addr = resultObj.get("addr").toString();
				/*System.out.println("addr : " + addr);*/
				telno = resultObj.get("telno").toString();
				/*System.out.println("telno : " + telno);*/
				hospUrl = resultObj.get("hospUrl").toString();
				/*System.out.println("hospUrl : " + hospUrl);*/
				estbDd = resultObj.get("estbDd").hashCode();
				/*System.out.println("estbDd : " + estbDd);*/
				drTotCnt = resultObj.get("drTotCnt").hashCode();
				/*System.out.println("drTotCnt : " + drTotCnt);*/
				gdrCnt = resultObj.get("gdrCnt").hashCode();
				/*System.out.println("gdrCnt : " + gdrCnt);*/
				intnCnt = resultObj.get("intnCnt").hashCode();
				/*System.out.println("intnCnt : " + intnCnt);*/
				resdntCnt = resultObj.get("resdntCnt").hashCode();
				/*System.out.println("resdntCnt : " + resdntCnt);*/
				sdrCnt = resultObj.get("sdrCnt").hashCode();
				/*System.out.println("sdrCnt : " + sdrCnt);*/
				xPos = resultObj.get("xPos").toString();
				/*System.out.println("xPos : " + xPos);*/
				yPos = resultObj.get("yPos").toString();
				/*System.out.println("yPos : " + yPos);*/
				System.out.println(i);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
