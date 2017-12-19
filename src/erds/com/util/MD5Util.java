package erds.com.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import org.json.JSONException;
import org.json.JSONObject;

public class MD5Util {

	
	private static String SDKAPPID = "1400022815";
	private static String APPKEY = "b5dc9d3d93d3618169b05e38f6da643b";
	private static String SMS_URL = "https://yun.tim.qq.com/v3/tlssmssvr/sendsms?sdkappid="+SDKAPPID;
	private static String add_template_URL = "https://yun.tim.qq.com/v5/tlssmssvr/add_template?sdkappid="+SDKAPPID;
	/**
	 * 利用md5加密
	 */
	public final static String MD5(String s) {
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};       

        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	/**
	 * sha256加密
	 * @param str
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	protected static String strToHash(String str) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        byte[] inputByteArray = str.getBytes();
        messageDigest.update(inputByteArray);
        byte[] resultByteArray = messageDigest.digest();
        return byteArrayToHex(resultByteArray);
    }
	public static String byteArrayToHex(byte[] byteArray) {
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        char[] resultCharArray = new char[byteArray.length * 2];
        int index = 0;
        for (byte b : byteArray) {
            resultCharArray[index++] = hexDigits[b >>> 4 & 0xf];
            resultCharArray[index++] = hexDigits[b & 0xf];
        }
        return new String(resultCharArray);
    }
	/**
	 * 随机产生一个四位的验证码
	 */
	public static String validateCode(){
		String validateCode = "";
		Random random = new Random();
		for(int i=0;i<4;i++){
			validateCode+=random.nextInt(10);
		}
		return validateCode;
	}
	
	/**
	 * 向用户发送验证码,并将验证码返回
	 *
	 */
	public static String sendSMS(String phone,String nationcode,String min){
		String validateCode = MD5Util.validateCode();
		
    	String sig = MD5Util.MD5(APPKEY+phone);
    	JSONObject obj = new JSONObject();
    	JSONObject obj1 = new JSONObject();
    	obj1.put("nationcode", nationcode);
    	obj1.put("phone", phone);
    	obj.put("tel", obj1);
    	obj.put("type", "0");
    	if("86".equals(nationcode)){
    		obj.put("msg", "欢迎注册名师课堂您的登录验证码为"+validateCode+"，请于"+min+"分钟内填写。如非本人操作，请忽略本短信。传统价格的十分之一就可以让您感受进步的快乐！");
    	}
    	obj.put("sig", sig);
    	String str = HttpRequest.sendPost(SMS_URL,obj.toString());
    	System.out.println(str);
    	//之后对于返回的json信息入库，留作数据分析，暂时先不开发
    	return validateCode;
	}
	/**
	 * 创建短信模板
	 * @param args
	 * @throws NoSuchAlgorithmException 
	 * @throws JSONException 
	 */
	public static void addTemplate() throws JSONException, NoSuchAlgorithmException{
		Random r = new Random();
		int i = r.nextInt(999999)%900000+100000;
		long l = System.currentTimeMillis()/1000;
		JSONObject obj = new JSONObject();
		obj.put("time",l);
		obj.put("sig", strToHash("appkey="+APPKEY+"&random="+i+"&time="+l));
//		obj.put("title", "添加模板测试");
//		obj.put("remark", "测试");
		obj.put("text", "这是一个{1}短信!");
		obj.put("type", 0);
		String str = HttpRequest.sendPost(SMS_URL+"&random="+i,obj.toString());
		System.out.println(str);
	}
	public static String getUUID() {  
        UUID uuid = UUID.randomUUID();  
        String str = uuid.toString();  
        // 去掉"-"符号  
        String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);  
        return temp;  
    } 
	public static void main(String[] args) {
//		sendSMS("18550442795","86","五");
		try {
			addTemplate();
		} catch (JSONException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
}
