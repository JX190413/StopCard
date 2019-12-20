package com.cykj.stopcard.util.CardNumberAnalyze;

import org.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public class CarNumFind
{

	//车牌识别
	public static Map pictureFindCar(MultipartFile file){
		Map map=null;
		// 1.车牌识别的接口
		String otherHost = "https://aip.baidubce.com/rest/2.0/ocr/v1/license_plate";
		try {
			String params = BaseImg64.getImageUrlEncode(file);
			/**
			 * 线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
			 */
			String accessToken = AuthService.getAuth();
			String result = HttpUtil.post(otherHost, accessToken, params);
			System.out.println(result);
			//解析JSON串
			JSONObject data = new JSONObject(result);
			//1.车牌识别
			map=(Map)data.toMap().get("words_result");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
