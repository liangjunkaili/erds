package erds.com.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;

import com.aliyun.oss.OSSClient;

public class AliyunUtil {

	public static String uploadImg(String uid,InputStream inputStream){
		String url = "";
		// 创建OSSClient实例
		OSSClient ossClient = new OSSClient(ConstantUtil.endpoint, ConstantUtil.Access_Key_ID, ConstantUtil.Access_Key_Secret);
		// 上传文件流
		Long l = new Date().getTime();
		String key = l.toString()+"_"+uid+".jpg";
		ossClient.putObject("erds", key, inputStream);
		System.out.println(ConstantUtil.Img_Url+key);
		url = ConstantUtil.Img_Url+key;
		ossClient.shutdown();
		return url;
	}
	
	public static void main(String[] args) {
		try {
			uploadImg("18550442795",new FileInputStream("localFile"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
