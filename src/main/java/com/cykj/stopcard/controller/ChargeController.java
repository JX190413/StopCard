package com.cykj.stopcard.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.cykj.stopcard.bean.CardPort;
import com.cykj.stopcard.bean.Business;
import com.cykj.stopcard.bean.Msg;
import com.cykj.stopcard.bean.Product;
import com.cykj.stopcard.service.ChargeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

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
	private final String RETURN_URL = "http://localhost:8080/StopCard/alipayNotifyNotice.action";
	@Resource
	private ChargeService chargeService;
	//计算
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
	@RequestMapping("selall")
	@ResponseBody
	public  String selall(){
		List<CardPort> list=chargeService.selall();
		Msg msg=new Msg();
		msg.setCode(0);
		msg.setMsg("");
		msg.setCount(10);
		msg.setData(list);
		return  null;
	}
	@RequestMapping("alipay1")
	public  void zhifubao(String time, HttpServletResponse httpResponse, String type,String carnum) throws IOException
	{
		//实例化客户端,填入所需参数

		int id=chargeService.selcormid(time);
		ZoneId z = ZoneId.of( "America/Montreal" );
		LocalDate today = LocalDate.now(z);
		LocalDate oneMonthLater = today.plusMonths( 3 );
		Business business =new Business();
		business.setBusinessid(id);
		business.setCarnum(carnum);
		business.setPaytime(today.toString());
		business.setPasttime(oneMonthLater.toString());
		int a=chargeService.inserole(business);
		AlipayClient alipayClient = new DefaultAlipayClient(GATEWAY_URL, APP_ID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGN_TYPE);
		AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
		//在公共参数中设置回跳和通知地址
		request.setReturnUrl(RETURN_URL);
		request.setNotifyUrl(NOTIFY_URL);
		//根据订单编号,查询订单相关信息
	/*	Order order = payService.selectById(orderId);
		//商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = order.getOrderId().toString();
		//付款金额，必填
		String total_amount = order.getOrderPrice().toString();
		//订单名称，必填
		String subject = order.getOrderName();*/
		//商品描述，可空
		String body = "";
		request.setBizContent("{\"out_trade_no\":\""+ 20 +"\","
				+ "\"total_amount\":\""+ 5 +"\","
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
