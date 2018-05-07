package erds.com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import cn.beecloud.BCPay;
import cn.beecloud.BeeCloud;
import cn.beecloud.BCEumeration.PAY_CHANNEL;
import cn.beecloud.bean.BCException;
import cn.beecloud.bean.BCOrder;
import cn.beecloud.bean.BCQueryParameter;
import erds.com.aop.LogAspect;
import erds.com.bean.Comments;
import erds.com.bean.Demand;
import erds.com.bean.Note;
import erds.com.bean.PayRecord;
import erds.com.bean.Student;
import erds.com.bean.Subject;
import erds.com.bean.Teacher;
import erds.com.service.ICommentsService;
import erds.com.service.IDemandService;
import erds.com.service.IIPService;
import erds.com.service.INoteService;
import erds.com.service.IPayRecordService;
import erds.com.service.IStudentService;
import erds.com.service.ISubjectService;
import erds.com.service.ITeacherService;
import erds.com.service.IssrService;
import erds.com.util.QiNiuUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class DemandController {

	private static Logger log = LoggerFactory.getLogger(DemandController.class);
	@Autowired
	private ITeacherService tearchService;
	@Autowired
	private IPayRecordService payRecordService;
	@Autowired
	private IDemandService demandService;
	@Autowired
	private ICommentsService commentsService;
	@Autowired
	private INoteService noteService;
	@Autowired
	private ISubjectService subjectService;
	@Autowired
	private IssrService ssrService;
	@Autowired
	private IIPService ipService;
	@Autowired
	private IStudentService studentService;
	private static final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	/**
	 * 
	 * @param request type
	 * @return
	 */
	@Frequency(name="getMoreDemand", limit=100, time=60)
	@RequestMapping("/getMoreDemand")
	@ResponseBody
	private JSONObject getMoreDemand(HttpServletRequest request){
		log.info("getMoreDemand begin ...");
		JSONObject obj = new JSONObject();
		try {
			String type = request.getParameter("type");
			String pageIndex = request.getParameter("pageIndex");
			String pageSize = request.getParameter("pageSize");
			Map<String,Object> param = new HashMap<>();
			param.put("type", type);
			param.put("pageIndex", (Integer.parseInt(pageIndex)-1)*Integer.parseInt(pageSize));
			param.put("pageSize", Integer.parseInt(pageSize));
			List<Demand> list = demandService.getDemand(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	@Frequency(name="delDemand", limit=100, time=60)
	@RequestMapping("delDemand")
	public String delDemand(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			int code = demandService.delDemand(Integer.parseInt(id));
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-DemandList";
	}
	/**
	 * 根据id查询同步课程信息
	 * @param request
	 * @return
	 */
	@Frequency(name="findDemandById", limit=100, time=60)
	@RequestMapping("/findDemandById")
	@ResponseBody
	private JSONObject findDemandById(HttpServletRequest request){
		log.info("findDemandById begin ...");
		String id = request.getParameter("id");
		String uid = request.getParameter("uid");
		String sbid = request.getParameter("sbid");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", id);
			param.put("uid", uid);
			Demand demand = demandService.findDemandById(param);
			param.put("tid", demand.getTid());
			Teacher teacher = tearchService.findTeacherById(param);
			param.put("did", demand.getId());
			param.put("state", 1);
			//查询这个主题所包含的所有课时
			List<Subject> slist = subjectService.querySubject(param);
			param.put("sbid", sbid);
			List<Comments> comments = commentsService.queryComment(param);
			List<Note> note = noteService.queryNote(param);
			Map<String, Object> param1 = new HashMap<>();
//			String uid = (String) param.get("uid");
//			String did = (String) param.get("id");
			param1.put("sid", uid);
			param1.put("did", id);
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
					List<BCOrder> bcOrders=null;
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
			obj.put("demand", demand);
			obj.put("teacher", teacher);
			obj.put("subList", slist);
			obj.put("comments", comments);
			obj.put("note", note);
			obj.put("noteSize", note.size());
			obj.put("commentssize", comments.size());
			obj.put("subSize", slist.size());
			obj.put("payRecord", bcOrder.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 发布点播课程
	 * @return
	 */
	@Frequency(name="addDemandN", limit=100, time=60)
	@RequestMapping(value = "/addDemandN", method = RequestMethod.POST)
	private String fildUpload_new(
			@RequestParam(value="teacherName")String name,@RequestParam(value="price")String price,@RequestParam(value="oprice")String oprice,@RequestParam(value="isCenter")String isCenter,
			@RequestParam(value="bigType")String bigType,@RequestParam(value="smallType")String smallType,@RequestParam(value = "cover", required = false) MultipartFile file1,
			@RequestParam(value="title")String title,@RequestParam(value="totalNum")String totalNum,@RequestParam(value="provide1")String provide1,
			@RequestParam(value="accessory")MultipartFile[] accessory,@RequestParam(value="provide")MultipartFile[] provide,@RequestParam(value="directories")String directories,@RequestParam(value="knowledgePoint")String knowledgePoint,
			@RequestParam(value="announcement")String announcement,@RequestParam(value="type")String type,HttpServletRequest request) throws Exception {
		try {
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("tid", name);
			Teacher t =tearchService.findTeacherById(param);
			param.put("tName", t.gettName());
			param.put("price", price);
			param.put("isCenter", isCenter);
			param.put("oprice", oprice);
			param.put("knowledgePoint", knowledgePoint);
			if(price.equals("0")){
				param.put("isfree", 1);
			}
			param.put("bigType", bigType);
			param.put("smallType", smallType);
			param.put("type", type);
			param.put("announcement", announcement);
			param.put("directories", directories);
			param.put("totalNum", totalNum);
			param.put("title", title);
			String provideUrl = provide1+"|";
			String accessoryUrl ="";
			long l = new Date().getTime();
			for(MultipartFile mf : provide){
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					provideUrl +=url+",";
				}
			}
			if(provideUrl.length()>0){
				provideUrl=provideUrl.substring(0, provideUrl.length()-1);
			}
			param.put("provide", provideUrl);
			for(MultipartFile mf : accessory){
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					accessoryUrl +=url+",";
				}
			}
			if(accessoryUrl.length()>0){
				accessoryUrl=accessoryUrl.substring(0, accessoryUrl.length()-1);
			}
			param.put("accessory", accessoryUrl);
			if(file1.getBytes().length>0){
				QiNiuUtil.Simple_upload_byte(file1.getBytes(), l+file1.getOriginalFilename());
			}
			param.put("coverImg", QiNiuUtil.BASE_URL+"/"+l+file1.getOriginalFilename());
			int code = demandService.addDemand(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addDemand";
	}
	/**
	 * 进入课堂，该用户是否登陆，课程是否免费,是否已经为该课程付费
	 * @param request
	 * @return
	 */
	@Frequency(name="enterDemands", limit=100, time=60)
	@RequestMapping("/enterDemands")
	public String enterDemands(HttpServletRequest request){
		log.info("enter Demands");
		String did = request.getParameter("did");
		String uid = request.getParameter("uid");
		String nickName = request.getParameter("username");
		String title = request.getParameter("title");
		String former = request.getParameter("former");
		List<String> ips = ipService.queryIps();
		String ip = LogAspect.getIpAddr(request);
		log.info("来访ip为:"+ip);
		if(ips.contains(ip)){
			return "video";
		}
		Map<String, Object> param = new HashMap<>();
		Map<String, Object> param2 = new HashMap<>();
		if(uid.equals("null")||uid.equals("undefined")||uid.equals("")){
			request.getSession().setAttribute("message", "请先<a href='login.jsp'>登录</a>!");
			request.getSession().setAttribute("former", former);
			return "error";
		}
		Map<String, Object> param3 = new HashMap<>();
		param3.put("uid", uid);
		Student s = studentService.queryStudent(param3);
		if(s.getAddress()==null||s.getAddress()==""){
			request.getSession().setAttribute("message", "请先完善地址信息！");
			request.getSession().setAttribute("former", former);
			return "error";
		}
		param.put("did", did);
		param.put("sid", uid);
		param2.put("id", did);
		Demand d = demandService.findDemandById(param2);
		//记录学生的上课情况
		param.put("sName", nickName);
		param.put("studyTime", sf.format(new Date()));
		param.put("content", d.getTitle());
		if(d.getIsfree()==1){
			int code = ssrService.saveSSRecord(param);
			if(code!=1){
				log.error("记录日志错误");
			}
			return "video";
		}
		//通过did查询该课是否为免费
		param2.put("did", did);
		param2.put("title", title);
		List<Subject> l = subjectService.querySubject(param2);
		
		if(l.size()>0&&"免费".equals(l.get(0).getFree())){
			int code = ssrService.saveSSRecord(param);
			if(code!=1){
				log.error("记录日志错误");
			}
			return "video";
		}else{
		
		//通过sid查询他是否为该课程付费
		List<PayRecord> list = payRecordService.queryPayRecord(param);
		if(list.size()<=0){
			request.getSession().setAttribute("message", "请先<a href='detail2.jsp?did="+did+"'>付费</a>!");
			return "error";
		}else{
			BeeCloud.registerApp("2fc29555-49b7-415e-80f0-c5d06f5e799d", null, "ccb86190-c3c0-43ba-a4c9-29371c00a651", "3db27c52-220d-41f5-ba05-bf398febb5c0");
			BCQueryParameter param1 = new BCQueryParameter();
			param1.setNeedDetail(true);//设置返回messgeDetail
			param1.setPayResult(true);
			param1.setChannel(PAY_CHANNEL.valueOf("WX_NATIVE"));//设置查询条件channel
			List<BCOrder> bcOrder=new ArrayList<>();
			for(int i=0;i<list.size();i++){
				param1.setBillNo(list.get(i).getBillNo());
				List<BCOrder> bcOrders=null;
				try {
					bcOrders = BCPay.startQueryBill(param1);
					System.out.println("billSize:" + bcOrders.size());
					bcOrder.addAll(bcOrders);
				} catch (BCException e) {
					log.error(e.getMessage(),e);
				}
			}
			if(bcOrder.size()<=0){
				request.getSession().setAttribute("message", "请先请先<a href='detail2.jsp?did="+did+"'>付费</a>!");
				return "error";
			}
		}
		int code = ssrService.saveSSRecord(param);
		if(code!=1){
			log.error("记录日志错误");
		}
		}
	
		return "video";
	}
	
	/**
	 * 根据id查询同步课程信息
	 * @param request
	 * @return
	 */
	@Frequency(name="findDemandByDid", limit=100, time=60)
	@RequestMapping("/findDemandByDid")
	@ResponseBody
	private JSONObject findDemandByDid(HttpServletRequest request){
		log.info("findDemandByDid begin ...");
		String id = request.getParameter("id");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", id);
			Demand demand = demandService.findDemandById(param);
			List<Teacher> list = tearchService.getTeacherList(param);
			obj.put("code", 200);
			obj.put("demand", demand);
			obj.put("teachers", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 编辑点播课
	 * @return
	 */
	@Frequency(name="updateDemandN", limit=100, time=60)
	@RequestMapping(value = "/updateDemandN", method = RequestMethod.POST)
	private String updateDemandN(@RequestParam(value="id")String id,
			@RequestParam(value="teacherName")String name,@RequestParam(value="price")String price,@RequestParam(value="oprice")String oprice,@RequestParam(value="isCenter")String isCenter,
			@RequestParam(value="bigType")String bigType,@RequestParam(value="smallType")String smallType,@RequestParam(value = "cover", required = false) MultipartFile file1,
			@RequestParam(value="title")String title,@RequestParam(value="totalNum")String totalNum,@RequestParam(value="provide1")String provide1,
			@RequestParam(value="accessory")MultipartFile[] accessory,@RequestParam(value="provide")MultipartFile[] provide,@RequestParam(value="directories")String directories,@RequestParam(value="knowledgePoint")String knowledgePoint,
			@RequestParam(value="announcement")String announcement,@RequestParam(value="type")String type,HttpServletRequest request) throws Exception {
		try {
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("tid", name.split(",")[0]);
			param.put("tName", name.split(",")[1]);
			param.put("price", price);
			param.put("id", id);
			param.put("isCenter", isCenter);
			param.put("oprice", oprice);
			param.put("knowledgePoint", knowledgePoint);
			if(price.equals("0")){
				param.put("isfree", 1);
			}
			param.put("bigType", bigType);
			param.put("smallType", smallType);
			param.put("type", type);
			param.put("announcement", announcement);
			param.put("directories", directories);
			param.put("totalNum", totalNum);
			param.put("title", title);
			String provideUrl = provide1+"|";
			String accessoryUrl ="";
			long l = new Date().getTime();
			for(MultipartFile mf : provide){
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					provideUrl +=url+",";
				}
			}
			if(provideUrl.length()>0){
				provideUrl=provideUrl.substring(0, provideUrl.length()-1);
			}
			param.put("provide", provideUrl);
			for(MultipartFile mf : accessory){
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					accessoryUrl +=url+",";
				}
			}
			if(accessoryUrl.length()>0){
				accessoryUrl=accessoryUrl.substring(0, accessoryUrl.length()-1);
			}
			param.put("accessory", accessoryUrl);
			if(file1.getBytes().length>0){
				QiNiuUtil.Simple_upload_byte(file1.getBytes(), l+file1.getOriginalFilename());
			}
			param.put("coverImg", QiNiuUtil.BASE_URL+"/"+l+file1.getOriginalFilename());
			int code = demandService.updateDemand(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-DemandListc1";
	}
}
