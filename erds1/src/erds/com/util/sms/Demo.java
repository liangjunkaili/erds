/*package erds.com.util.sms;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;

import org.json.JSONObject;
public class Demo {
	 
		int appid;
		String appkey;
	    String url = "https://yun.tim.qq.com/v5/tlssmssvr/add_template";
		
		SmsSenderUtil util = new SmsSenderUtil();

		public Demo(int appid, String appkey) throws Exception {
			this.appid = appid;
			this.appkey = appkey;
		}

		*//**
		 * 添加短信模板
		 * @param type 短信类型，0 为普通短信，1 营销短信
		 * text 模板内容
		 * @throws Exception
		 *//*
		public void send(int type,String text) throws Exception {
	
	请求包体
	{
    "sig": "30db206bfd3fea7ef0db929998642c8ea54cc7042a779c5a0d9897358f6e9505", //app凭证，具体计算方式见下注
    "time": 1457336869, //unix时间戳，请求发起时间，如果和系统时间相差超过10分钟则会返回失败
    "title": "xxxxx", //模板名称，可选字段
    "remark": "xxxxx", //模板备注，比如申请原因，使用场景等，可选字段
    "text": "xxxxx", //模板内容
    "type": 0 //0：普通短信模板；1：营销短信模板；2：语音模板
	}
	
	        long random = util.getRandom();
	        long curTime = System.currentTimeMillis()/1000;
			JSONObject data = new JSONObject();
	        data.put("type", type);
	        data.put("text", text);
	        data.put("sig", util.strToHash(String.format(
	        		"appkey=%s&random=%d&time=%d",
	        		appkey, random, curTime)));
	        data.put("time", curTime);
	        // 与上面的 random 必须一致
			String wholeUrl = String.format("%s?sdkappid=%d&random=%d", url, appid, random);
	        HttpURLConnection conn = util.getPostHttpConn(wholeUrl);

	        OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream(), "utf-8");
	        wr.write(data.toString());
	        wr.flush();
	        
	        System.out.println(data.toString());

	        // 显示 POST 请求返回的内容
	        StringBuilder sb = new StringBuilder();
	        int httpRspCode = conn.getResponseCode();
	        if (httpRspCode == HttpURLConnection.HTTP_OK) {
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	            String line = null;
	            while ((line = br.readLine()) != null) {
	                sb.append(line);
	            }
	            br.close();
	            System.out.println(sb.toString());
		}
		}
}
*/