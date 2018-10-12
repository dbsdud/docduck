package poly.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class OpenApi {
	public static void main(String[] args) {
		BufferedReader br = null;
		try {
			String urlstr = "http://apis.data.go.kr/"
					+ "B551182/hospInfoService/getHospBasisList?pageNo=1&numOfRows=1000&_type=json&"
					+ "ServiceKey=ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			String result="";
			String line;
			while((line=br.readLine()) != null) {
				result = result + line + "\n";
			}
			System.out.println(result);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
