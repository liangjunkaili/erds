package erds.com.util;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.joda.time.DateTime;

import com.duobeiyun.AppBulidSign;
import com.duobeiyun.DuobeiYunClient;
import com.duobeiyun.DuobeiYunConfig;

public class DuoBeiYunUtil {

	private static DuobeiYunClient client = new DuobeiYunClient();
	private static final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	//创建房间1
	public static String createRoom(String title,Date d,int duration){
		return client.createRoom(title, d, duration, true, DuobeiYunClient.COURSE_TYPE_1vN);
	}
	
	// 创建房间2
	public static void createRoomByMinute() {
		String result = client.createRoomByMinute("测试教师", new Date(), 1, true, DuobeiYunClient.COURSE_TYPE_1vN);
		System.out.println(result);
	}
	//更新房间标题
	public static void updateRoomTitle(String roomId,String newTitle){
		client.updateRoomTitle(roomId, newTitle);
	}
	//修改房间开始时间和时长
	public static void updateRoomSchedule(){
		client.updateRoomSchedule("roomId", new Date(), 3);
	}
	//上传文档
	public static void uploadDocument(){
		client.uploadDocument("filename", new File(""));
	}
	//附加文档到房间
	public static void attatchDocument(){
		client.attatchDocument("roomId", "documentId");
	}
	//查询文档转换状态
	public static void getDocumentStatus(){
		client.getDocumentStatus("documentId");
	}
	//生成请求进入房间URL
	public static String generateRoomEnterUrl(String uid,String roomId,String nickname,String role){
		return client.generateRoomEnterUrl(uid, nickname, roomId, role);
	}
	//获取房间文档列表
	public static void listDocuments(){
		client.listDocuments("roomId");
	}
	//从房间删除已附加文档
	public static void removeDocument(){
		client.removeDocument("roomId", "documentId");
	}
	//查看文档列表、按标题搜索文档
	public static void listAllDocument(){
		client.listAllDocument("documentTitle", 1);
	}
	//查看文档详情
	public static void detailDocument(){
		client.detailDocumet("documentId");
	}
	//删除文档
	public static void deleteDocument(){
		client.deleteDocumet("documentId");
	}
	//查看机构详情
	public static void merchantDetail(){
		client.merchantDetail();
	}
	//查看教室房间详情
	public static void roomDetail(){
		client.roomDetail("roomId");
	}
	//查看房间列表、按时间或标题搜索房间
	public static void listRoom(String roomTitle,Date beginTime,Date endTime,int page){
		String result = client.listRoom(roomTitle, page, beginTime, endTime);
		System.out.println(result);
	}
	//生成预览文档URL
	public static void generateDocPreviewUrl(){
		client.generateDocPreviewUrl("uuid");
	}
	//删除房间
	public static String deleteRoom(String roomId){
		return client.deleteRoom(roomId);
	}
	//开通微信直播
	public static void openWeixinLive(){
		client.openWeixinLive("roomId", "teacherName", "teacherBrief", "description");
	}
	//关闭微信直播
	public static void closeWeixinLive(){
		client.closeWeixinLive("roomId");
	}
	//更新微信直播
	public static void updateWeixinLive(){
		client.updateWeixinLive("roomId", "teacherName", "teacherBrief", "description");
	}
	/**
	 * 获取token
	 * @param args
	 */
	public static String upload_token(){
		Map<String, String> map = new HashMap<>();
		String timestamp = String.valueOf(new DateTime().plusMinutes(1).getMillis());
		map.put("partner", DuobeiYunConfig.getInstance().getPartnerId());
		map.put("timestamp", timestamp);
		String sign = AppBulidSign.buildMysign(map, DuobeiYunConfig.getInstance().getAppKey());
		map.put("sign", sign);
		String param = map.toString().substring(1, map.toString().length()-1).replace(", ", "&").trim();
    	System.out.println(param);
		String str = HttpRequest.sendPost("http://api.duobeiyun.com/api/v3/video/uptoken ",param);
    	System.out.println(str);
    	return str;
	}
	/**
	 * 创建点播课
	 * @param args
	 */
	public static String create_demand(String title,String videoKey){
		Map<String, String> map = new HashMap<>();
		String timestamp = String.valueOf(new DateTime().plusMinutes(1).getMillis());
		map.put("partner", DuobeiYunConfig.getInstance().getPartnerId());
		map.put("timestamp", timestamp);
		map.put("title", title);
		map.put("videoKey", videoKey);
		String sign = AppBulidSign.buildMysign(map, DuobeiYunConfig.getInstance().getAppKey());
		map.put("sign", sign);
		String param = map.toString().substring(1, map.toString().length()-1).replace(", ", "&").trim();
		System.out.println(param);
		String str = HttpRequest.sendPost("https://api.duobeiyun.com/api/v3/room/video/create",param);
    	System.out.println(str);
    	return str;
	}
	//Main方法
	public static void main(String[] args) {
//		createRoom("hello");
		try {
			String data = DuoBeiYunUtil.createRoom("sss",sf.parse("2016-05-05 12:12"),1);
			System.out.println(data);
			/*{"success":true,"room":{
			"roomId":"jzca17d2c0d011428eb6c6a9999a528158",
			"title":"sss",
			"startTime":"2016-08-23 11:39:00",
			"endTime":"2016-08-23 12:39:00",
			"validEndTime":"2099-01-01 23:59",
			"video":true,
			"hostCode":"jz4fkahnr7",
			"coverImgUrl":null,
			"convertStatus":0,
			"courseType":2,
			"vod":false,
			"weixinLiving":false}}*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		String roomId = "jz5130ed9a1edd477bb0cc68f6075886e8";
//		listRoom(null, null, null,1);
//		System.out.println(generateRoomEnterUrl("1855044",roomId,"jun",DuobeiYunClient.ROLE_TEACHER));
		System.out.println(generateRoomEnterUrl("1563538",roomId,"kaili",DuobeiYunClient.ROLE_STUDENT));
	}
	


}
