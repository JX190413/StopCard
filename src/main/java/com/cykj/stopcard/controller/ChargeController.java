package com.cykj.stopcard.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.cykj.stopcard.bean.*;
import com.cykj.stopcard.log.Log;
import com.cykj.stopcard.service.ChargeService;
import javafx.scene.input.DataFormat;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;

@Controller
public class ChargeController
{
	private final String APP_ID = "2016101500691629";
	private final String APP_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCABdJiDrmB+yNopGt36G2MOB+G/3bgXCEh8j7M51HXGp7I5gbAP6a7nFll/gjGKBNHo7t3Tj5jsMQe1FRu/N2mSAbYTadDZqj8OxJz3PF03yuEylH+oX6XfvHbnbkDGzOTfBoVKBMaDH2i0ZRbaquvkJlC0Ja7Oj/Uptdwj7GfB3K2vhrhL7Vse5Y1a48mAESt3PHfxQsen0AIreeL1Iw4NUHttxwXDCw32lvuE1Vn+VN34tiYHj+OzZtreQZyWVXWFQgBCrkvbv+PPdrmTVXxKBq83uBNgzKG4WFBX+a6KbzjtUWZLRxKXtJ2wXAp/ldxg+7XIeDSuq+bcBoxo7SfAgMBAAECggEACqBxFjKis2dlSQpc4VcpwLnn5AzQkU8UcPzquZd586ECDSsK5GpkLK6NvSmZENnCv++XYA/enefOX8DAQXY779GKv+myOKYM4OMGZRex80GTGzKwG7LMD0c6TECLWvanEVb700XAUCk5RIqhBfWUyr31+tXVrTTol35B49YJqGmW6UUopZCzHaxl6wS2aO6GrMu0Igpca3oxLt1/wBgLam7hJJPJoMa4JUu1VL4hHYUFBn4TU/U+hCxgAwrT//UiLw1f/xbGjDIWSzZ4LSZ9Ptbk0M7L7EkRmtQdAXCrK+/idxvcT8TkFGbxWv8TeBTh3Yg7m07T3b5MAUIwuqKmAQKBgQDm5X0CwmehR+F79RB3QzPygDmNRdEfX87IY/WzxBmFFA9xw+XuWW5l3ykReib7+ZZ5xAjqH5uf2FurQY7sdh2uO3f7EJyt6hNl9eSHCxGxej1VHjy0ScmzyKWmRb0kb/n6HxS6z4SLaG9+/DpGsM28GwUTF20iFn2k4MFbYmaMDQKBgQCN8RAQFg8zFxJndI+7YpDbbwg+TrrFEhRjpAdThFocG2GA8R1PaISCBC6ILDsh6xXuPj8dz3KyF9CcnVt216l7vIQ/jXnTadh4mL+RbV3J3F6NiiJTZh/+j0gpZ2pyo0QqWEhJfM1HaPIRIOhdFuode6raE4tfRezFesR8szicWwKBgQDLHc5fAw2Ov2EIXojhoWitR0dZk7VnWCzb87NNNJEOlJsRhTdb+ag4TZwfF8n7l5BcBauh6bRJZVcezEkikrWBdCcT4YUzKNtvsmQauA4Uhmg13KeiIdciJLw0DN1alHbfJUBjJfJ/gJu0pcXOMfKKK2rHZLBIcGiPBniSH3n+cQKBgGSKLNuIFIoWvJWFLc4IGh0kP42KzKaMkN6nL/1LUVx5VI41u5IksT864Q7ZbaUv1F/lvWVLLK3TSpO0rjW2urkHphEyD+ndHlUFtSO4eOdj7aGKB5hVTTJNoUqakv7SgJUR5VoQSYNcZaIWUiCl+3yYvUMs9tqsN/MFa6n8dIvjAoGAKiauA/RiuFC0X3DG6iSop+aKu4DphXjhRnI5OVYy9LyBMRyvrbv9jxQZEgGmxY+GKXPGvleoCMhS2ysYmskr4tkWD4pCciLvjr0r+yitJYbuHRcm2Oag/BkwXmzLanl9qZgI1Buemeke+WAS2nOtpugUrJYWMrMpmzt6772TPKs=";
	private final String CHARSET = "UTF-8";
	private final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAha2r3Gm7CkYjFTW7u4XH5wWoUJHjXWc/U5mjx06G2i9ZW/iILZ1xCNRuEBPPh/9dn2fPD+dPREF+0Uf5+i1K9lzBw82mPuhukQpUjEbFIXX69iT4KEmO/Yh1X12G2tsuoPf6knUtYeIyOkSZkE+vx3zClpDtCpL2/u1fBDd2dLnVkhZJ0lGVaAjEVBeAi5agbJX24W1bNlw7boD5PqmELU4KwsB2p7MUy0VGJlRr1lYxcisPIWU0QpVen7/f3lwmGG+nLSA/AjwOAR9ZGcs57v87L+ppEOyQteEchFzh+/nF86geuCYaIr8cbQBc3SBavvyp88CY6EBjh4fwfNeceQIDAQAB";
	//这是沙箱接口路径,正式路径为https://openapi.alipay.com/gateway.do
	private final String GATEWAY_URL ="https://openapi.alipaydev.com/gateway.do";
	private final String FORMAT = "JSON";
	//签名方式
	private final String SIGN_TYPE = "RSA2";
	//支付宝异步通知路径,付款完毕后会异步调用本项目的方法,必须为公网地址
	private final String NOTIFY_URL = "http://公网地址/notifyUrl";
	//支付宝同步通知路径,也就是当付款完毕后跳转本项目的页面,可以不是公网地址
	private final String RETURN_URL = "http://localhost:8080/StopCard/alipayNotifyNotice";

	@Resource
	private ChargeService chargeService;
	//计费规则
	public String selmoney(String minute){
		int minte1=Integer.parseInt(minute);
		String money="";
		List<Product> list1=chargeService.selfasttime();
		int fasttime=Integer.parseInt(list1.get(0).getRuletime());
		int twotime=Integer.parseInt(list1.get(1).getRuletime());
		int threetime=Integer.parseInt(list1.get(2).getRuletime());
		int lasttime=Integer.parseInt(list1.get(3).getRuletime());
		int fastmoney=list1.get(1).getMoremoney();
		int nextmoney=list1.get(2).getMoremoney();
		int money3=list1.get(2).getChargemoney();
		int money4=list1.get(1).getChargemoney();
		int money5=list1.get(0).getChargemoney();
		int money6=list1.get(3).getChargemoney();
		if (fasttime>=minte1){
			String money2=String.valueOf(money5);
			return money2;
		}
		else if (fasttime<minte1&&minte1<=twotime){
			String money2=String.valueOf(money4);
			return money2;
		}
		else if (twotime<minte1&&minte1<=threetime){
			int chaoguo=minte1-twotime;
			double allmoney= ((double) fastmoney/60.00)*chaoguo+money4;
			String result = String.format("%.2f", allmoney);
			return result;
		}
		else if (threetime<minte1&&minte1<=lasttime){
			int chaoguo=minte1-threetime;
			double allmoney1= ((double) nextmoney/60.00)*chaoguo+money3;
			String result = String.format("%.2f", allmoney1);
			return result;
		}
		else {
			String result1=String.valueOf(money6);
			return result1;
		}

	}
	//查询车位方法
	@RequestMapping("selall")
	@ResponseBody
	public  Msg selall(  String limit,String page ,String id){
		String where="区";
		if (id!=null){
			if (!id.equals("请选择")){
				where=id;
			}
		}
		int page1=Integer.valueOf(page);
		int limit1=Integer.valueOf(limit);
		System.out.println("进入车位查询");
		List<CardPort> list=chargeService.selall(limit1,page1,where);
		int count=chargeService.selallnumber(where);
		Msg msg=new Msg();
		msg.setCode(0);
		msg.setMsg("");
		msg.setCount(count);
		msg.setData(list);
		return  msg;
	}
	//修改车位状态

	@RequestMapping("/updatetype")
	@Log(operationType="修改车位状态",operationName="收费员进行修改车位状态")
	public ModelAndView Aopupdatetype(String interest1,String interest2){
		System.out.println("进入修改车位状态方法");
		System.out.println(interest1);
		System.out.println(interest2);
		int id=chargeService.selcarid(interest2);
		System.out.println(id);
		ModelAndView modelAndView=new ModelAndView();
		CardPort cardPort=new CardPort();
		cardPort.setStateid(id);
		cardPort.setPortarea(interest1);
		int flay=chargeService.upcartype(cardPort);
		if (flay>0){{

			modelAndView.setViewName("SelCare");
		}
		}
		return modelAndView;
	}
	//查询是否是会员
	@RequestMapping("/selhuiyuan")
	@ResponseBody
	public String selhuiyuan(String carnum){
		String msg="";
		List<Business> list=chargeService.selhuiyuan(carnum,String.valueOf(chargeService.selstateid()));
		if (list.size()==0){
			System.out.println(5555);
			msg="20";
		}
		else  {
			msg="30";
			System.out.println(888);
		}
		return msg;
	}
	//支付接口
	@RequestMapping("alipay1")
	public  void zhifubao(String time, HttpServletResponse httpResponse, String type,String carnum) throws IOException
	{

		//实例化客户端,填入所需参数

		int id=chargeService.selcormid(time);
		ZoneId z = ZoneId.of( "America/Montreal" );
		List<Combo> list1=chargeService.selcomtime(time);
		LocalDate today = LocalDate.now(z);
		LocalDate oneMonthLater = today.plusMonths( list1.get(0).getTimeid() );
		Business business =new Business();
		business.setComboid(list1.get(0).getTimeid());
		business.setBusinessid(id);
		business.setCarnum(carnum);
		business.setPaytime(today.toString());
		business.setPasttime(oneMonthLater.toString());
		business.setCartype(String.valueOf(chargeService.selstateid2()));
		System.out.println(carnum+"77777");
		int ac=chargeService.deleall(carnum,String.valueOf(chargeService.selstateid2()));
		System.out.println("进入方法");
		int a=chargeService.inserole(business);
		System.out.println(carnum);
		if (a>0){
			List<Combo> list=chargeService.selcomtime(time);
			int carnum2=chargeService.selodnumber(carnum,String.valueOf(chargeService.selstateid2()));
			AlipayClient alipayClient = new DefaultAlipayClient(GATEWAY_URL, APP_ID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGN_TYPE);
			AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
			//在公共参数中设置回跳和通知地址
			String time2=java.net.URLEncoder.encode(time,"utf-8");
			String carnum8=java.net.URLEncoder.encode(carnum,"utf-8");
			request.setReturnUrl("http://localhost:8080/StopCard/alipayNotifyNotice?carnum2="+carnum8+"&time2="+time2+"");
			request.setNotifyUrl(NOTIFY_URL);
			//商品描述，可空
			String body = "";
			request.setBizContent("{\"out_trade_no\":\""+ carnum2 +"\","
					+ "\"total_amount\":\""+ list.get(0).getCombomoney() +"\","
					+ "\"subject\":\""+ "会员缴费" +"\","
					+ "\"body\":\""+ body +"\","
					+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
			String form = "";
			try {
				form = alipayClient.pageExecute(request).getBody(); // 调用SDK生成表单
			} catch (AlipayApiException e) {
				e.printStackTrace();
			}
			httpResponse.setContentType("text/html;charset=" + CHARSET);
			httpResponse.getWriter().write(form);// 直接将完整的表单html输出到页面
			httpResponse.getWriter().flush();
			httpResponse.getWriter().close();
		}



	}
	//支付宝异步通知界面
	//办理
	@RequestMapping(value = "alipayNotifyNotice")
	@ResponseBody
	public ModelAndView alipayNotifyNotice1(HttpServletRequest request, HttpServletRequest response,String carnum2) throws Exception {
		ModelAndView modelAndView=new ModelAndView();
		//获取支付宝POST过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			/*valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");*/
			params.put(name, valueStr);
		}
/*		//调用SDK验证签名
		boolean signVerified = AlipaySignature.rsaCheckV1(params, Alipayconfig.ALIPAY_PUBLIC_KEY, Alipayconfig.CHARSET, Alipayconfig.SIGN_TYPE);*/


		//验证成功
	/*	if(signVerified) {*/
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//交易状态
			/*	String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");*/
			//付款金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

			System.out.println("支付成功");

			int uptype=chargeService.uptype(out_trade_no,String.valueOf(chargeService.selstateid()));
			if (uptype>0){
				Date date = new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String money = strs(total_amount);
				System.out.println(money);
				int carid = chargeService.selcombo(money).get(0).getComboid();
				int flay = chargeService.insetsell(total_amount, String.valueOf(carid), dateFormat.format(date), carnum2,"会员缴费");
				if (flay>0){
					modelAndView.addObject("out_trade_no",out_trade_no);
					modelAndView.addObject("trade_no",trade_no);
					modelAndView.addObject("total_amount",total_amount);
					modelAndView.setViewName("/alipaySuccess2");
				}

			}
		/*}*/else {//验证失败
			/*log.info("支付, 验签失败...");*/
			System.out.println("支付失败");
		}
		return modelAndView;
	}
	//续费异步接口
	@RequestMapping(value = "alipayNotifyNotice2" )
	@ResponseBody
	public ModelAndView alipayNotifyNotice(HttpServletRequest request, HttpServletRequest response,String carnum2,String time2) throws Exception {
		ModelAndView modelAndView=new ModelAndView();
		String data=chargeService.selhuiyuan(carnum2,String.valueOf(chargeService.selstateid())).get(0).getPasttime();
		int id=chargeService.selcormid(time2);
		String data5=dat(data,id);
		//获取支付宝POST过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			params.put(name, valueStr);
		}
		//调用SDK验证签名
			/*boolean signVerified = AlipaySignature.rsaCheckV1(params, Alipayconfig.ALIPAY_PUBLIC_KEY, Alipayconfig.CHARSET, Alipayconfig.SIGN_TYPE);*/

		//验证成功
		/*if(signVerified) {*/
		//商户订单号
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//交易状态
		/*	String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");*/
		//付款金额
		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

		System.out.println("支付成功");
		int uptype=chargeService.uptime5(data5,carnum2,String.valueOf(chargeService.selstateid()));
		if (uptype>0)
		{
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String money = strs(total_amount);
			System.out.println(money);
			int carid = chargeService.selcombo(money).get(0).getComboid();
			int flay = chargeService.insetsell(total_amount, String.valueOf(carid), dateFormat.format(date), carnum2,"会员续费");
			if (flay > 0)
			{
				modelAndView.addObject("out_trade_no", out_trade_no);
				modelAndView.addObject("trade_no", trade_no);
				modelAndView.addObject("total_amount", total_amount);
				modelAndView.setViewName("/alipaySuccess2");
			}
		}
		/*}*/else {//验证失败
			/*log.info("支付, 验签失败...");*/
			System.out.println("支付失败");
		}
		return modelAndView;
	}
	//定时器任务
	@Scheduled(cron="0 0 0,8,16 * * ?")
	//五秒测试一次
//	@Scheduled(cron="*/5 * * * * ?")
	public void executeFileDownLoadTask() {
		System.out.println("定时任务启动");
		int nowtime=nowti();
		int money=0;
		System.out.println(nowtime);
		SimpleDateFormat time1 = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd 08:00:00");
		SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd 16:00:00");
		SimpleDateFormat time3 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
		List<Cost> list;
		switch (nowtime){
			case 1:
				list=chargeService.selmoney(time1.format(new Date()),time.format(new Date()));
				money=Calculatemoney(list);
				String money1=String.valueOf(money);
				chargeService.insetdaile(time.format(new Date()),money1,"早班");
				System.out.println(money);
				break;
			case 2:
				list=chargeService.selmoney(time.format(new Date()),time2.format(new Date()));
				money=Calculatemoney(list);
				System.out.println(money);
				String money2=String.valueOf(money);
				chargeService.insetdaile(time2.format(new Date()),money2,"午班");
				break;
			case 3:
				list= chargeService.selmoney(time2.format(new Date()),time3.format(new Date()));
				money=Calculatemoney(list);
				String money3=String.valueOf(money);
				chargeService.insetdaile(time1.format(new Date()),money3,"晚班");
				System.out.println("增加成功");
				break;
			default:
				break;
		}
	}
	//计算时间段的总金额
	public int Calculatemoney(List<Cost> list){
		int money=0;
		for (int i = 0; i <list.size() ; i++)
		{
			money=Integer.valueOf(list.get(i).getMoney())+money;
		}
		return money;
	}
	//判断当前时间返回int值
	public static int  nowti()
	{
		int time3=0;
		SimpleDateFormat time2 = new SimpleDateFormat("HH");  //提取系统中的小时
		int h = Integer.valueOf(time2.format(new Date()));  //将小时转换为整数型
		if (h <= 8 && h > 0)
		{
			time3 = 1;
		} else
		{
			if (h <= 16 && h > 8)
			{
				time3 = 2;
			} else
			{
				if (h <= 24 && h > 16)
				{
					time3 = 3;
				}
			}
		}
		return  time3;
	}
	//转发到日接单页面
	@RequestMapping("Check")
	public ModelAndView daile(){
		ModelAndView modelAndView=new ModelAndView();
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd 8");
		SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd 16");
		SimpleDateFormat time3 = new SimpleDateFormat("yyyy-MM-dd 0");
		if (chargeService.seldaile(time.format(new Date())).size()>0){
			String morning=chargeService.seldaile(time.format(new Date())).get(0).getDailemoney();
			modelAndView.addObject("morning",morning);
		}
		if (chargeService.seldaile(time2.format(new Date())).size()>0){
			String noon=chargeService.seldaile(time2.format(new Date())).get(0).getDailemoney();
			modelAndView.addObject("noon",noon);
		}
		if (chargeService.seldaile(time3.format(new Date())).size()>0){
			String night=chargeService.seldaile(time3.format(new Date())).get(0).getDailemoney();
			modelAndView.addObject("night",night);
		}
		modelAndView.setViewName("Check");
		return  modelAndView;
	}
	//退费判断
	@RequestMapping("tuifei")
	@ResponseBody
	public Map<String,Object> tuifei(String carnum){
		Map<String,Object> usemap=new HashMap<>();
		List<Business> list=chargeService.selhuiyuan(carnum,String.valueOf(chargeService.selstateid()));
		if (list.size()==0){
			usemap.put("msg","20");
		}
		else {
			System.out.println("是会员");
			usemap.put("msg","30");
			usemap.put("msg1",list.get(0).getPasttime());
			int day=Math.abs(daysBetween(list.get(0).getPasttime()));
			int money=Integer.parseInt(chargeService.selcarbo().get(0).getCombomoney());
			int overmoney= money/30*day;
			String money2=String.valueOf(overmoney);
			usemap.put("msg2",money2);
		}
		return usemap;
	}
	//距离某个日期加上几个月
	public int daysBetween(String dateStr)
	{
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date compareDate = null;
		try
		{
			compareDate = sdf.parse(dateStr);
		} catch (ParseException e)
		{
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(compareDate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(today);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);
		return Integer.parseInt(String.valueOf(between_days));
	}
	//某个判断
	@RequestMapping("tuifeia")
	@ResponseBody
	public Map<String,Object> tuifeia(String money,String carnum){
		Map<String,Object> data=new HashMap<>();
		System.out.println(money);
		int money1=Integer.valueOf(money);
		UserManagement userManagement=new UserManagement();
		userManagement.setCarnum(carnum);
		int money5=chargeService.selbance(carnum).get(0).getBalance();
		userManagement.setBalance(money1+money5);
		int flay=chargeService.overmoney(userManagement);
		if (flay>0){
			int flay1=chargeService.uptypecar(carnum,String.valueOf(chargeService.selstateid3()));
			if (flay1>0){
				String money8=chargeService.selusermoney(carnum);
				data.put("msg","20");
				data.put("msg1",money8);
			}
		}
		return data;
	}
	//续费判断吧应该
	@RequestMapping("xufei5")
	@ResponseBody
	public  String xufei5(String carnum,String time){
		String msg="";
		int money5=chargeService.selbance(carnum).get(0).getBalance();
		int money=Integer.parseInt(chargeService.selcomtime(time).get(0).getCombomoney());
		if(money>money5){
			msg="20";
		}
		else {
			int money2=money5- money;
			UserManagement userManagement=new UserManagement();
			userManagement.setCarnum(carnum);
			userManagement.setBalance(money2);
			int flay=chargeService.overmoney(userManagement);
			if (flay>0){
				String data=chargeService.selhuiyuan
						(carnum,String.valueOf(chargeService.selstateid())).get(0).getPasttime();
				int id=chargeService.selcormid(time);
				String data5=dat(data,id);
				int
						uptype=chargeService.uptime5(data5,carnum,String.valueOf(chargeService.selstateid()));
				if (uptype>0){
					int carid=chargeService.selcombo(String.valueOf(money)).get(0).getComboid();
					Date date = new Date();
					SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
				int flay2=chargeService.insetsell(String.valueOf(money),String.valueOf(carid),dateFormat.format(date),carnum,"会员续费");
				if (flay2>0){
					msg="30";
				}

				}
			}
		}
		return msg;
	}
//续费走的支付宝接口
	@RequestMapping("alipay2")
	public  void zhifubao1(String time, HttpServletResponse httpResponse, String type,String carnum) throws IOException
	{

		//实例化客户端,填入所需参数
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time5=format.format(date);
		ZoneId z = ZoneId.of("America/Montreal");

		List<Combo> list = chargeService.selcomtime(time);
		AlipayClient alipayClient = new DefaultAlipayClient(GATEWAY_URL, APP_ID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGN_TYPE);
		AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();

		//中文转码
		String time2=java.net.URLEncoder.encode(time,"utf-8");
		String carnum2=java.net.URLEncoder.encode(carnum,"utf-8");
		//在公共参数中设置回跳和通知地址
		request.setReturnUrl("http://localhost:8080/StopCard/alipayNotifyNotice2?carnum2="+carnum2+"&time2="+time2+"");
		request.setNotifyUrl(NOTIFY_URL);
		//商品描述，可空
		String body = "";
		request.setBizContent("{\"out_trade_no\":\"" + time5 + "\"," + "\"total_amount\":\"" + list.get(0).getCombomoney() + "\"," + "\"subject\":\"" + "会员缴费" + "\"," + "\"body\":\"" + body + "\"," + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		String form = "";
		try
		{
			form = alipayClient.pageExecute(request).getBody(); // 调用SDK生成表单
		} catch (AlipayApiException e)
		{
			e.printStackTrace();
		}
		httpResponse.setContentType("text/html;charset=" + CHARSET);
		httpResponse.getWriter().write(form);// 直接将完整的表单html输出到页面
		httpResponse.getWriter().flush();
		httpResponse.getWriter().close();
	}


//在某个日期上加上几个月
	public  String dat(String time,int timeid){
		Calendar c = Calendar.getInstance();//获得一个日历的实例
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try{
			date = sdf.parse(time);//初始日期
		}catch(Exception e){
		}
		c.setTime(date);//设置日历时间
		c.add(Calendar.MONTH,timeid);//在日历的月份上增加6个月
		return sdf.format(c.getTime());
	}
//去掉小数点后的和点
	private static String strs(String str)
	{
if (str.indexOf(".") > 0)
	{
		str = str.replaceAll("0+?$", "");//删掉尾数为0的字符
			str = str.replaceAll("[.]$", "");//结尾如果是小数点，则去掉
	}
	return str;


	}
	//月缴用户查询
	@RequestMapping("payment")
	@ResponseBody
	public  Msg selpayment(  String limit,String page ,String fast,String last){
		String fast1="";
		int page1=Integer.valueOf(page);
		int limit1=Integer.valueOf(limit);
		Msg msg=new Msg();
		System.out.println("月缴管理");
		 if (last!=null&&fast!=null&&last.length()>0&&fast.length()>0){

			List<Business> list=chargeService.selbus2(limit1,page1,fast,last);
			int count=chargeService.selallnumber2(fast,last);
			msg.setCode(0);
			msg.setMsg("");
			msg.setCount(count);
			msg.setData(list);
		}
		else {

			List<Business> list=chargeService.selbus(limit1,page1,fast1);
			int count=chargeService.selallnumber3(fast1);
			msg.setCode(0);
			msg.setMsg("");
			msg.setCount(count);
			msg.setData(list);
		}

		return  msg;
	}
	//临时车辆查看
	@RequestMapping("Temporary")
	@ResponseBody
	public  Msg Temporary(  String limit,String page ,String id){
		String caenum2="";
		int page1=Integer.valueOf(page);
		int limit1=Integer.valueOf(limit);
		Msg msg=new Msg();
		System.out.println("临时车辆查看");
		if (id==null){
			id=caenum2;
		}
		int payid=chargeService.selpeyid();
			List<CarInOut> list=chargeService.selbus3(limit1,page1,id,payid);
			int count=chargeService.selallnumber4(id,String.valueOf(payid));
			msg.setCode(0);
			msg.setMsg("");
			msg.setCount(count);
			msg.setData(list);
		return  msg;
	}
	//小程序登录
	@RequestMapping("Ceshi")
	@ResponseBody
	public String ceshi(String zhanghao, String mima){
		String msg="2";
		UserManagement userManagementr=new UserManagement();
		userManagementr.setUsername(zhanghao);
		userManagementr.setUserpass(mima);
		List<UserManagement> list=chargeService.seluser(userManagementr);
		System.out.println(zhanghao);
		System.out.println(mima);
		System.out.println("微信小程序进来了");
		if (list.size()>0){
			System.out.println("登录成功");
			msg="1";
		}

		return msg;
	}
	//小程序注册
	@RequestMapping("Ceshi2")
	@ResponseBody
	public String ceshi2(String username,String psw,String number,String adress,String carnum){
		String msg="2";
		List<UserManagement>list=chargeService.selname(username);
		List<UserManagement>list2=chargeService.selname2(carnum);
		if (list.size()>0){
			msg="3";
		}
		else if (list2.size()>0){
			msg="4";
		}
		else {
			SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(System.currentTimeMillis());
			UserManagement userManagement=new UserManagement();
			userManagement.setUsername(username);
			userManagement.setCarnum(carnum);
			userManagement.setUserpass(psw);
			userManagement.setUserphone(number);
			userManagement.setUseraddress(adress);
			userManagement.setUsertime(formatter.format(date));
			int flay=chargeService.insetuser(userManagement);
			if (flay>0){
				msg="1";
			}
		}


		return msg;
	}
	//首页导航
	@RequestMapping("lunbo")
	@ResponseBody
	public  Map<String,Object> lunbo(){
		System.out.println("进入首页导航");
		int typeid=chargeService.selstateid5("导航");
		int typeid2=chargeService.selstateid5("轮播图");
			List<Partation> list=chargeService.selpartitio(typeid);
		System.out.println(list.get(0).getJumpurl());
		List<Partation> list2=chargeService.selpartitio(typeid2);
		Map<String,Object> map=new HashMap<>();
		map.put("list",list);
		map.put("list2",list2);
		return map;
	}
	//总的商品查询
	@RequestMapping("shop")
	@ResponseBody
	public  List<Commodity> shop(String title){
		System.out.println("进入商品查询页面");
		Map<String,Object> map=new HashMap<>();
		List<Commodity> list=chargeService.selcommid(title);
		return list;
	}
//获取商品主页面
	@RequestMapping("shoplunbo")
	@ResponseBody
	public  Map<String,Object> shop2(String uid){
		System.out.println(uid);
		System.out.println("进入商品主页面");
		List<Partation> list=chargeService.selshoplunbo(uid,"商品轮播图");
		List<Partation> list3=chargeService.selshoplunbo(uid,"商品介绍图");
		List<Commodity> list2=chargeService.selcommid2(Integer.valueOf(uid));
		Map<String,Object> map=new HashMap<>();
		map.put("list",list);
		map.put("list2",list2);
		map.put("list3",list3);
		return map;
		//
	}
	//购物车
	@RequestMapping("shopping")
	@ResponseBody
	public  String shopping(String id,String price,String shopname,String loginname,String shopBuyCount,String image){
		String uid=chargeService.selname(loginname).get(0).getUserid();
		System.out.println("进入购物车");
		System.out.println(id+price+shopname+shopBuyCount);
		String msg="2";
		Shoppingcart shoppingcart=new Shoppingcart();
		shoppingcart.setUserid(Integer.valueOf(uid));
		shoppingcart.setCommodityidprice(Integer.valueOf(price));
		shoppingcart.setCommoditynumber(Integer.valueOf(shopBuyCount));
		shoppingcart.setCommodityname(shopname);
		shoppingcart.setImage(image);
		int  shopid=chargeService.selshop(shopname).get(0).getCommodityid();
		shoppingcart.setShopid(shopid);
		int shopid2=chargeService.selshop(shopname).get(0).getCommodityid();
		List<Shoppingcart> list=chargeService.selshoppingcart2(shopid2);
		if (list.size()>0){
			int number=list.get(0).getCommoditynumber()+Integer.valueOf(shopBuyCount);
			int flay1=chargeService.upnumber(String.valueOf(number),shopname);
			if (flay1>0){
				msg="5";
			}
		}
		else {
			int flay=chargeService.insetshopcart(shoppingcart);
			if (flay>0){
				msg="5";
			}}

		return msg;
		//
	}
	//查找用户购物车商品
	@RequestMapping("shoppingcart")
	@ResponseBody
	public  Map<String,Object> shopping1(String loginname){
		Map<String,Object> map=new HashMap<>();
		String userid=chargeService.selname(loginname).get(0).getUserid();
		List<Shoppingcart> list=chargeService.selshoppingcart(Integer.valueOf(userid));
		List<Commodity> list1=chargeService.selinshop();
		map.put("list",list);
		map.put("list1",list1);
		return map;
		//
	}
	@RequestMapping("seltitle")
	public  ModelAndView shopping2(){
		ModelAndView modelAndView=new ModelAndView();
		int typeid=chargeService.selstateid5("导航");
		List<Partation> list=chargeService.selpartitio(typeid);

		modelAndView.addObject("list",list);

		modelAndView.setViewName("Shoping");
		return modelAndView;
		//
	}
	@RequestMapping("selshopping")
	@ResponseBody
	public  Msg shopping3(String limit,String page,String id,String shopname ){
		System.out.println(shopname);
		System.out.println(id);
		String id2="";
		String name="";
		if (id==null){
			id=id2;
		}
		if (shopname==null){
			shopname=name;
		}
		Msg msg=new Msg();
		List<Commodity> list=chargeService.selbus4(Integer.valueOf(limit),Integer.valueOf(page),id,shopname);
		msg.setData(list);
		msg.setCode(0);
		msg.setMsg("");
		int number=chargeService.selallnumber5(id);
		msg.setCount(number);

		return msg;
		//
	}
	@RequestMapping("upfenqu")
	public  ModelAndView upfenqu(String interest1,String selfenqu ){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("Shoping");
	int flay= chargeService.upfenqu(selfenqu,interest1);
		int flay2= chargeService.upfenqu2(selfenqu,interest1);
	if (flay>0&&flay2>0){
		System.out.println("修改成功");
	}
		int typeid=chargeService.selstateid5("导航");
		List<Partation> list=chargeService.selpartitio(typeid);
		modelAndView.addObject("List",list);
		return modelAndView;
		//
	}


	@RequestMapping("/shopingview")
	@ResponseBody
	public String updateAdImg(HttpServletRequest request,Ad ad, MultipartFile file,String id)
	{
		String code="20";

		String realPath = request.getSession().getServletContext().getRealPath("/");
		try
		{
			if (null != file && ad != null){
				String path=realPath+ "\\hzimages\\"+file.getOriginalFilename();
				ad.setAdimg("img\\ADimg\\"+file.getOriginalFilename());
				file.transferTo(new File(path));
				String upath="http://localhost:8080/StopCard/hzimages/";
				String ipath=upath+file.getOriginalFilename();
				System.out.println(ipath);

				int flay=chargeService.upimage(ipath,id);
				if (flay>0){
					code="0";
				}

			}
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		System.out.println("222"+file.getOriginalFilename());
		return code;
	}
}

