package com.cykj.stopcard.controller;

import com.cykj.stopcard.bean.Area;
import com.cykj.stopcard.bean.CarInOut;
import com.cykj.stopcard.bean.CardPort;
import com.cykj.stopcard.bean.ResultEntity;
import com.cykj.stopcard.service.CarService;
import com.cykj.stopcard.util.CardNumberAnalyze.AuthService;
import com.cykj.stopcard.util.CardNumberAnalyze.BaseImg64;
import com.cykj.stopcard.util.CardNumberAnalyze.HttpUtil;
import com.cykj.stopcard.util.GetNowTime;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

//前端车辆数据交互控制层
@Controller
public class CarController
{

	@Resource
	private CarService cardService;
	@Resource
	private CarInOut carInOut;

	//车辆入场
	//车牌识别
	@RequestMapping("/cardIn")
	@ResponseBody
	public Map<String, Object> cardIn(HttpServletRequest request, MultipartFile file)
	{
		Map map1 = new HashMap<String, Object>();
		// 1.车牌识别的接口
		String otherHost = "https://aip.baidubce.com/rest/2.0/ocr/v1/license_plate";
		if (!file.isEmpty()) {
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
				Map map=(Map)data.toMap().get("words_result");
				if(null!=map){
					System.out.println(map.get("number"));
					map1.put("code", 200);
					map1.put("msg", map.get("number"));
					String nowDate= GetNowTime.getDate();
					//入场时间
					carInOut.setIntime(nowDate);
					//缴费情况：4——未缴费
					carInOut.setStateid(4);
					//车牌号
					carInOut.setCarnum(map.get("number").toString());
					//写入数据库
					cardService.cardIn(carInOut);


				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return map1;
	}
	//车牌车位绑定
	@RequestMapping("/parkCart")
	@ResponseBody
	public String parkCart(String carnum,String carport){

		//修改车位状态
		cardService.updatePortState("6",carport);
		//绑定车牌
		int num=cardService.updateCarIn(carport,carnum);
	if(num==0){
		return "停车失败！";
		}
		return "停车成功！";
	}



	//查询空余车位
	@RequestMapping("/searchFreeCarPort")
	@ResponseBody
	public  String searchFreeCarPort(){

		return cardService.searchFreeCardPort().size()+"";
	}

	//通过车位或车牌获取停车位坐标（反向寻车）
	@RequestMapping("/searchCardPort")
	@ResponseBody
	public CardPort searchCardPort(String cardnum){

		return cardService.searchCardPort(cardnum);
	}

	//查找数据库中所有车位的信息
	@RequestMapping("/CardPort")
	@ResponseBody
	public List<CardPort> carport_query(){
		return cardService.carPortQuery();
	}


	//查找被点击车位的信息
	@RequestMapping("/carPortClick")
	@ResponseBody
	public CardPort carPortClick(int id){
		CardPort CardPort=cardService.carPortClick(id);
		if (CardPort.getCarnum()==null){
			CardPort.setCarnum("空闲");
		}
		return CardPort;
	}

	//获取分区标注
	@RequestMapping("/carArea")
	@ResponseBody
	public List<Area> carArea(){
		return cardService.carArea();
	}

	//动态修改分区信息
	@RequestMapping("/changeArea")
	@ResponseBody
	public ResultEntity changeArea(String changeArea1,String changeArea2,String changeArea3,String changeArea4,String changeArea5){
		System.out.println(changeArea1);
		System.out.println(changeArea2);
		System.out.println(changeArea3);
		System.out.println(changeArea4);
		System.out.println(changeArea5);

		if (changeArea1!=null&&changeArea1.length()!=0){
			cardService.changeArea(changeArea1,1);
		}
		if (changeArea2!=null&&changeArea2.length()!=0){
			cardService.changeArea(changeArea2,2);
		}
		if (changeArea3!=null&&changeArea3.length()!=0){
			cardService.changeArea(changeArea3,3);
		}
		if (changeArea4!=null&&changeArea4.length()!=0){
			cardService.changeArea(changeArea4,4);
		}
		if (changeArea5!=null&&changeArea5.length()!=0){
			cardService.changeArea(changeArea5,5);
		}
		ResultEntity res = new ResultEntity();
		res.setMsg("修改成功");
		return res;
	}

	//	停车场显示界面跳转
	@RequestMapping("/Parking")
	public String Parking()
	{
		return "Parking";
	}



}
