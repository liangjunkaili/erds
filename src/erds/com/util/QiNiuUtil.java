package erds.com.util;

import java.io.File;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

public class QiNiuUtil {

	public static String BASE_URL = "http://oev6hl3jh.bkt.clouddn.com";
	private static String AK = "1xi26ADLC4_lDpnPWmWxRurDFh8t7qADU2pd8B1f";
	
	private static String SK = "yNzlcf-vKKFZ-PUiahKHsyvZClu78q7hurJrwUej";
	//要上传的空间
	private static String bucketname = "ordos";
	private static Auth auth = Auth.create(AK, SK);
	//简单上传，使用默认策略，只需要设置上传的空间名就可以了
	public static String getUpToken(){
		return auth.uploadToken(bucketname);
	}
	public static void init(){
	}
	/**
	 * 简单上传 上传到七牛后保存的文件名 ,上传文件的路径
	 */
	public static void Simple_upload(File file,String key){
		//创建上传对象
		UploadManager uploadManager = new UploadManager();
		try {
//			Response res = uploadManager.put(file, key, getUpToken());
			Response res = uploadManager.put(file, key, getUpToken());
			System.out.println(res.bodyString());
		} catch (QiniuException e) {
			 Response r = e.response;
	          // 请求失败时打印的异常的信息
	         System.out.println(r.toString());
	         try {
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				
			}
		}
	}
	public static void Simple_upload_byte(byte[] data,String key){
		//创建上传对象
		UploadManager uploadManager = new UploadManager();
		try {
			Response res = uploadManager.put(data, key, getUpToken());
			System.out.println(res.bodyString());
		} catch (QiniuException e) {
			 Response r = e.response;
	          // 请求失败时打印的异常的信息
	         System.out.println(r.toString());
	         try {
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				
			}
		}
	}
	public static void main(String[] args) {
		File file = new File("C:\\Users\\admin\\Desktop\\app\\search.png");
		Simple_upload(file, "11.png");
	}
}
