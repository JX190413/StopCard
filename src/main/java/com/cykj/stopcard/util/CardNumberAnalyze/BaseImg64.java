package com.cykj.stopcard.util.CardNumberAnalyze;

import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

import java.net.URLEncoder;

public class BaseImg64
{
	/**
	 * 将MultipartFile文件转化成Base64字符串
	 * 图片转化base64后再UrlEncode结果
	 */
	public static String getImageUrlEncode(MultipartFile file) throws Exception{
		BASE64Encoder encoder = new BASE64Encoder();
		// 通过base64来转化图片
		String imgStr = encoder.encode(file.getBytes());
		//进行urlencode
		String data1= URLEncoder.encode(imgStr,"UTF-8");
		String params = URLEncoder.encode("image", "UTF-8") + "=" + data1;
		return params;
	}

	//	public static String getImageStrFromPath(String imgPath) throws Exception{
	//		BufferedInputStream in;
	//		byte[] data = null;
	//		// 读取图片字节数组
	//		try {
	//			in = new BufferedInputStream(new FileInputStream(imgPath));
	//			data = new byte[in.available()];
	//			in.read(data);
	//			in.close();
	//		} catch (IOException e) {
	//			e.printStackTrace();
	//		}
	//		// 对字节数组Base64编码
	//		BASE64Encoder encoder = new BASE64Encoder();
	//		// 返回Base64编码过再URLEncode的字节数组字符串
	//		return URLEncoder.encode(encoder.encode(data),"UTF-8");
	//	}


}
