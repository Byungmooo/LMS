package com.gd.LMS.weather.Controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.exam.controller.professorExController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class WeatherController {
	   @GetMapping("/weather")
	    public String restApiGetWeather() throws Exception {
	    	String updateTime = null;
	    	LocalDate date = LocalDate.now();
	    	String nowYear = date.toString();
	    	nowYear = nowYear.replace("-", "");
	    	LocalTime time = LocalTime.now();
	    	int hour = time.getHour();
	    	
	    	if(hour > 1 && hour < 5) {
	    		updateTime = "0200";
	    	} else if(hour > 4 && hour < 8) {
	    		updateTime = "0500";
	    	} else if(hour > 7 && hour < 11) {
	    		updateTime = "0800";
	    	} else if(hour > 10 && hour < 14) {
	    		updateTime = "1100";
	    	} else if(hour > 13 && hour < 17) {
	    		updateTime = "1400";
	    	} else if(hour > 16 && hour < 20) {
	    		updateTime = "1700";
	    	} else if(hour > 19 && hour < 23) {
	    		updateTime = "2000";
	    	} else {
	    		updateTime = "2300";
	    	}
	    	log.debug(TeamColor.KBW+"nowYear : "+nowYear);
	    	log.debug(TeamColor.KBW+"기상 갱신 시간 : " + updateTime);
	        String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
	            + "?serviceKey=kOeozc2PuA1Xw33w78Tvl1%2BhJxup98e1X297F77%2FcTkYVKHmhK6v0uswhBiZpqQmJIQYm63yZT%2BGVUQkTW712A%3D%3D"
	            + "&dataType=JSON"            // JSON, XML
	            + "&numOfRows=10"             // 페이지 ROWS
	            + "&pageNo=1"                 // 페이지 번호
	            + "&base_date=" + nowYear       // 발표일자
	            + "&base_time=" +  updateTime         // 발표시각
	            + "&nx=58"                    // 예보지점 X 좌표
	            + "&ny=125";                  // 예보지점 Y 좌표
	        
	        HashMap<String, Object> resultMap = getDataFromJson(url, "UTF-8", "get", "");
	        
	        System.out.println("# RESULT : " + resultMap);

	        JSONObject jsonObj = new JSONObject();
	        
	        jsonObj.put("result", resultMap);
	        
	        return jsonObj.toString();
	    }
	    
	    public HashMap<String, Object> getDataFromJson(String url, String encoding, String type, String jsonStr) throws Exception {
	        boolean isPost = false;

	        if ("post".equals(type)) {
	            isPost = true;
	        } else {
	            url = "".equals(jsonStr) ? url : url + "?request=" + jsonStr;
	        }

	        return getStringFromURL(url, encoding, isPost, jsonStr, "application/json");
	    }
	    
	    public HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter, String contentType) throws Exception {
	        URL apiURL = new URL(url);

	        HttpURLConnection conn = null;
	        BufferedReader br = null;
	        BufferedWriter bw = null;

	        HashMap<String, Object> resultMap = new HashMap<String, Object>();

	        try {
	            conn = (HttpURLConnection) apiURL.openConnection();
	            conn.setConnectTimeout(5000);
	            conn.setReadTimeout(5000);
	            conn.setDoOutput(true);

	            if (isPost) {
	                conn.setRequestMethod("POST");
	                conn.setRequestProperty("Content-Type", contentType);
	                conn.setRequestProperty("Accept", "*/*");
	            } else {
	                conn.setRequestMethod("GET");
	            }

	            conn.connect();

	            if (isPost) {
	                bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
	                bw.write(parameter);
	                bw.flush();
	                bw = null;
	            }

	            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));

	            String line = null;

	            StringBuffer result = new StringBuffer();

	            while ((line=br.readLine()) != null) result.append(line);

	            ObjectMapper mapper = new ObjectMapper();

	            resultMap = mapper.readValue(result.toString(), HashMap.class);
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new Exception(url + " interface failed" + e.toString());
	        } finally {
	            if (conn != null) conn.disconnect();
	            if (br != null) br.close();
	            if (bw != null) bw.close();
	        }

	        return resultMap;
	    }
}
