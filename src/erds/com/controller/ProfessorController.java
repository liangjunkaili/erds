package erds.com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.beecloud.BCPay;
import cn.beecloud.BeeCloud;
import cn.beecloud.BCEumeration.PAY_CHANNEL;
import cn.beecloud.bean.BCException;
import cn.beecloud.bean.BCOrder;
import cn.beecloud.bean.BCQueryParameter;
import erds.com.bean.Course;
import erds.com.bean.PayRecord;
import erds.com.bean.Professor;
import erds.com.bean.Teacher;
import erds.com.service.IPayRecordService;
import erds.com.service.ITeacherService;
import erds.com.service.ProfessorService;
import erds.com.util.MD5Util;
import erds.com.util.QiNiuUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class ProfessorController {

	private static Logger log = LoggerFactory.getLogger(ProfessorController.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	@Autowired
	private ProfessorService professorService;
	@Autowired
	private ITeacherService tearchService;
	@Autowired
	private IPayRecordService payRecordService;
	@RequestMapping("saveProfessor")
	public String saveProfessor(@RequestParam(value = "cover", required = false) MultipartFile[] file,@RequestParam(value="teacherName")String name,@RequestParam(value="price")String price,@RequestParam(value="oprice")String oprice,
			@RequestParam(value="beginTime")String beginTime,@RequestParam(value="duration")String duration,@RequestParam(value="bigType")String bigType,@RequestParam(value="smallType")String smallType,
			@RequestParam(value="title")String title,@RequestParam(value="totalNum")String totalNum,@RequestParam(value = "video", required = false) String video,
			@RequestParam(value="provide")MultipartFile[] provide,@RequestParam(value="directories")String directories,@RequestParam(value="provide1")String provide1,
			@RequestParam(value="announcement")String announcement){
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("id", UUID.randomUUID().toString().replaceAll("-", ""));
			param.put("tid", name);
			Teacher t =tearchService.findTeacherById(param);
			param.put("tname", t.gettName());
			param.put("price", price);
			param.put("oprice", oprice);
			param.put("bigtype", bigType);
			param.put("smalltype", smallType);
			param.put("begintime", beginTime);
			param.put("announcement", announcement);
			param.put("directories", directories);
			param.put("totalnum", totalNum);
			param.put("duration", duration);
			param.put("video", video);
			param.put("title", title);
			String provideUrl = provide1+"|";
			long l = new Date().getTime();
			for(MultipartFile mf : provide){
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					provideUrl +=url+",";
				}
				param.put("provide", provideUrl);
			}
			for (MultipartFile mf : file) {
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					param.put("coverimg", url);
					log.info(url);
				}
			}
			int code = professorService.saveProfessor(param );
			if(code==0){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addProfessor";
	}
	
	@RequestMapping("/findProfessorById")
	@ResponseBody
	public JSONObject findProfessorById(HttpServletRequest request){
		log.info("findProfessorById begin ...");
		String cid = request.getParameter("cid");
		String uid = request.getParameter("uid");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", cid);
			param.put("uid", uid);
			param.put("pageIndex", 0);
			param.put("pageSize", 2);
			List<Professor> professors = professorService.queryProfessor(param);
			param.put("tid", professors.get(0).getTid());
			Teacher teacher = tearchService.findTeacherById(param);
			Map<String, Object> param1 = new HashMap<>();
			param1.put("sid", uid);
			param1.put("cid", cid);
			List<PayRecord> list = payRecordService.queryPayRecord(param1);
			List<BCOrder> bcOrder=new ArrayList<>();
			if(list.size()>0){
				BeeCloud.registerApp("2fc29555-49b7-415e-80f0-c5d06f5e799d", null, "ccb86190-c3c0-43ba-a4c9-29371c00a651", "3db27c52-220d-41f5-ba05-bf398febb5c0");
				BCQueryParameter param2 = new BCQueryParameter();
				param2.setNeedDetail(true);//设置返回messgeDetail
				param2.setPayResult(true);
				param2.setChannel(PAY_CHANNEL.valueOf("WX_NATIVE"));//设置查询条件channel
				
				for(int i=0;i<list.size();i++){
					param2.setBillNo(list.get(i).getBillNo());
					List<BCOrder> bcOrders = null;
					try {
						bcOrders = BCPay.startQueryBill(param2);
						System.out.println("billSize:" + bcOrders.size());
						bcOrder.addAll(bcOrders);
					} catch (BCException e) {
						log.error(e.getMessage(),e);
					}
				}
				
			}
			obj.put("code", 200);
			obj.put("professor", professors.get(0));
			obj.put("teacher", teacher);
			obj.put("parRecord", bcOrder.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 提交订单,并返回签名
	 * @param request
	 * @return
	 */
	/*@RequestMapping("getSignForPay")
	@ResponseBody
	public JSONObject saveOrder(HttpServletRequest request){
		JSONObject object = new JSONObject();
		try {
			String price = request.getParameter("price");
			String id = request.getParameter("id");
			String uid = (String) request.getSession().getAttribute("userphone");
			String oid = UUID.randomUUID().toString().replaceAll("-", "");
			String app_id = "e2458dd2-d339-4a4e-848f-2067443fc7fe";
		    String app_secret = "8fba821a-c204-4c4d-b858-16d55168204e";
		    //2.根据订单参数生成 订单签名 sign
		    String sign = MD5Util.MD5(app_id + "5s-edu" + price + oid + app_secret);
		    String optional = "{'billNo':'"+oid+"','uid':'"+uid+"','fee':'"+price+"','cid':'"+id+"','did':''}";
		    object.put("code", 200);
		    object.put("sign", sign);
		    object.put("optional", optional);
		    object.put("out_trade_no", oid);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return object;
	}*/
}
