package com.cykj.stopcard.controller;

import com.cykj.stopcard.bean.Area;
import com.cykj.stopcard.bean.CarInOut;
import com.cykj.stopcard.bean.CardPort;
import com.cykj.stopcard.bean.ResultEntity;
import com.cykj.stopcard.service.CarService;
import com.cykj.stopcard.util.CardNumberAnalyze.CarNumFind;
import com.cykj.stopcard.util.TimeTool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//前端车辆数据交互控制层
@Controller
public class CarController
{

	@Resource
	private CarService cardService;
	@Resource
	private CarInOut carInOut;
	@Resource
	private ChargeController chargeController;

	//车辆入场
	@RequestMapping("/cardIn")
	@ResponseBody
	public Map<String, Object> cardIn(HttpServletRequest request, MultipartFile file)
	{
		Map map1 = new HashMap<String, Object>();


		if (!file.isEmpty()) {
				//车牌识别的方法
				Map map= CarNumFind.pictureFindCar(file);
				if(null!=map){
					System.out.println(map.get("number"));
					map1.put("code", 200);
					map1.put("msg", map.get("number"));
					String nowDate= TimeTool.getDate();
					//入场时间
					carInOut.setIntime(nowDate);
					//缴费情况：4——未缴费
					carInOut.setStateid(4);
					//车牌号
					carInOut.setCarnum(map.get("number").toString());
					//写入数据库
					cardService.cardIn(carInOut);
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

	//车辆出场
	@RequestMapping("/cardOut")
	@ResponseBody
	public Map<String, Object> cardOut(HttpServletRequest request, MultipartFile file)
	{
		Map map1 = new HashMap<String, Object>();
		if (!file.isEmpty()) {
			//车牌识别的方法
			Map map= CarNumFind.pictureFindCar(file);
			if(null!=map){
				System.out.println(map.get("number"));
				String carnum=map.get("number").toString();

				//出场时间
				String carOutTime= TimeTool.getDate();
				//进场时间
				CarInOut carInOut=cardService.searchCarInOut(carnum);
				String carInTime=carInOut.getIntime();
				int inoutid=carInOut.getInoutid();
				//时间差
				Long timeDiff= TimeTool.timeDiff(carInTime,carOutTime);
				//判断是否白名单
				Map map2=cardService.searchWhite(carnum);
				String money="0";
				String paytype="临时";
				int payid=2;
				if(null!=map2){
					payid=3;
					paytype="白名单";
				}else{
					//不是白名单判断是否月缴
					Map map3=cardService.searchBusiness(carnum);
					if(null!=map3){
						payid=1;
						paytype="月缴";
						String paytime=map3.get("paytime").toString();
						String pasttime=map3.get("pasttime").toString();
						boolean isInPayTime=TimeTool.belongCalendar(TimeTool.getDate2(),paytime,pasttime);
						if(!isInPayTime){
							payid=2;
							paytype="临时";
							money=chargeController.selmoney(timeDiff.toString());
						}
					}else{
						//临时用户
						//计费
						money=chargeController.selmoney(timeDiff.toString());

					}
				}
				carInOut.setOuttime(carOutTime);
				//车牌号
				carInOut.setCarnum(carnum);
				//缴费类型
				carInOut.setPayid(payid);
				//缴费金额
				carInOut.setMoney(money);
				if(money.equals("0")){
					carInOut.setStateid(3);
					cardService.updatePortState2("5",carnum);
				}
				carInOut.setStoptime(timeDiff.toString());
				//写入数据库（车辆出场信息）
				int num=cardService.updateCarOut(carInOut);
				if(num==0){
					map1.put("code", 0);
				}else{
					map1.put("code", 200);
				}
				map1.put("msg", carInOut);
				map1.put("paytype", paytype);
				map1.put("inoutid", inoutid);
			}
		}
		return map1;
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
	//免缴费车辆出场！
	@RequestMapping("/carOut")
	public String carOut(HttpServletRequest request,String carNum){
		request.setAttribute("carNum",carNum);
		return "CarOut1";
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
