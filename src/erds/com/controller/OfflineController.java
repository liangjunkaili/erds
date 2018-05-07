package erds.com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import erds.com.bean.Offline;
import erds.com.bean.OfflineRecord;
import erds.com.bean.PayRecord;
import erds.com.service.IOfflineRecordService;
import erds.com.service.IOfflineService;
import erds.com.service.IPayRecordService;
import erds.com.util.MD5Util;
import erds.com.util.QiNiuUtil;
import net.sf.json.JSONObject;

@RequestMapping("/")
@Controller
public class OfflineController {

	@Autowired
	private IOfflineService offlineService;
	@Autowired
	private IPayRecordService payRecordService;
	private static Logger log = LoggerFactory.getLogger(OfflineController.class);
	@Autowired
	private IOfflineRecordService offlineRecordService;
	final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Frequency(name="addOffline", limit=100, time=60)
	@RequestMapping(value = "/addOffline", method = RequestMethod.POST)
	public String addOffline(@RequestParam(value="price")String price,
			@RequestParam(value = "cover", required = false) MultipartFile file1,
			@RequestParam(value="title")String title,@RequestParam(value="provide1")String provide1,
			@RequestParam(value="provide")MultipartFile[] provide,
			@RequestParam(value="address")String address,HttpServletRequest request){
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("title", title);
			param.put("price", price);
			param.put("address", address);
			param.put("id", MD5Util.getUUID());
			String provideUrl = provide1+"|";
			long l = new Date().getTime();
			for(MultipartFile mf : provide){
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					provideUrl +=url+",";
				}
				param.put("describe", provideUrl);
			}
			QiNiuUtil.Simple_upload_byte(file1.getBytes(), l+file1.getOriginalFilename());
			param.put("cover", QiNiuUtil.BASE_URL+"/"+l+file1.getOriginalFilename());
			int code = offlineService.addOffline(param );
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addOffline";
	}
	
	@Frequency(name="getMoreOffline", limit=100, time=60)
	@RequestMapping("/getMoreOffline")
	@ResponseBody
	private JSONObject getMoreOffline(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String id = request.getParameter("id");
			String pageIndex = request.getParameter("pageIndex");
			String pageSize = request.getParameter("pageSize");
			String uid = request.getParameter("sid");
			if(uid==null||"null".equals(uid)){
				uid="-1";
			}
			Map<String,Object> param = new HashMap<>();
			param.put("id", id);
			param.put("oid", id);
			param.put("sid", uid);
			param.put("pageIndex", (Integer.parseInt(pageIndex)-1)*Integer.parseInt(pageSize));
			param.put("pageSize", Integer.parseInt(pageSize));
			List<Offline> list = offlineService.queryOfflines(param);
			Map<String, Object> param1 = new HashMap<>();;
			param1.put("cid", id);
			param1.put("sid", uid);
			List<PayRecord> records = payRecordService.queryPayRecord(param1);
//			List<OfflineRecord> records = offlineRecordService.queryOfflineRecord(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
			obj.put("rsize", records.size());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return obj;
	}
	
	@Frequency(name="getAllOffline", limit=100, time=60)
	@RequestMapping("/getAllOffline")
	@ResponseBody
	private JSONObject getAllOffline(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String pageIndex = request.getParameter("pageIndex");
			String pageSize = request.getParameter("pageSize");
			Map<String,Object> param = new HashMap<>();
			param.put("pageIndex", (Integer.parseInt(pageIndex)-1)*Integer.parseInt(pageSize));
			param.put("pageSize", Integer.parseInt(pageSize));
			List<Offline> list = offlineService.queryOfflines(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	@Frequency(name="getUserByoffline", limit=100, time=60)
	@RequestMapping("/getUserByoffline")
	@ResponseBody
	private JSONObject getUserByoffline(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String cid = request.getParameter("cid");
			Map<String,Object> param = new HashMap<>();
			param.put("cid", cid);
			List<PayRecord> list = payRecordService.queryPayRecord(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	@Frequency(name="payOffline", limit=100, time=60)
	@RequestMapping("/payOffline")
	private String payOffline(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String sid = request.getParameter("sid");
			String oid = request.getParameter("oid");
			String otitle = request.getParameter("otitle");
			if(sid==null||"null".equals(sid)){
				request.getSession().setAttribute("message", "请<a href='login.jsp'>登陆<a/>!");
				return "error";
			}
			Map<String,Object> param = new HashMap<>();
			param.put("sid", sid);
			param.put("oid", oid);
			param.put("otitle", otitle);
			param.put("dealTime", sf.format(new Date()));
			int code = offlineRecordService.addOfflineRecord(param);
			obj.put("code", code);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "offline";
	}
	
	@Frequency(name="getSignForPay", limit=100, time=60)
	@RequestMapping("/getSignForPay")
	@ResponseBody
	private JSONObject getSignForPay(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String aprice = request.getParameter("aprice");
			String id = request.getParameter("oid");
			String did = request.getParameter("did");
			String oid = MD5Util.getUUID();
			String uid = request.getParameter("uid");
			String app_id = "2fc29555-49b7-415e-80f0-c5d06f5e799d";
		    String app_secret = "ccb86190-c3c0-43ba-a4c9-29371c00a651";
		    //2.根据订单参数生成 订单签名 sign
		    String sign = MD5Util.MD5(app_id + "悟思教育" + aprice + oid + app_secret);
		    String optional = "{'billNo':'"+oid+"','fee':'"+Double.parseDouble(aprice)/100+"','cid':'"+id+"','uid':'"+uid+"','did':'"+did+"'}";
		    obj.put("code", 200);
		    obj.put("sign", sign);
		    obj.put("optional", optional);
		    obj.put("out_trade_no", oid);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 根据id删除线下课
	 * @param request
	 * @return
	 */
	@Frequency(name="delOffline", limit=100, time=60)
	@RequestMapping("/delOffline")
	private String delOffline(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			int code = offlineService.delOffline(id);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addOffline";
	}
}
