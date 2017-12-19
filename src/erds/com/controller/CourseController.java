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

import com.duobeiyun.DuobeiYunClient;

import cn.beecloud.BCEumeration.PAY_CHANNEL;
import cn.beecloud.BCPay;
import cn.beecloud.BeeCloud;
import cn.beecloud.bean.BCException;
import cn.beecloud.bean.BCOrder;
import cn.beecloud.bean.BCQueryParameter;
import erds.com.bean.Course;
import erds.com.bean.Demand;
import erds.com.bean.Demandc3;
import erds.com.bean.Information;
import erds.com.bean.Offline;
import erds.com.bean.Partners;
import erds.com.bean.PayRecord;
import erds.com.bean.Professor;
import erds.com.bean.Rollimg;
import erds.com.bean.Student;
import erds.com.bean.Teacher;
import erds.com.service.ICourseService;
import erds.com.service.IDemandService;
import erds.com.service.IInformationService;
import erds.com.service.IOfflineService;
import erds.com.service.IPartnerService;
import erds.com.service.IPayRecordService;
import erds.com.service.IRollingService;
import erds.com.service.IStudentService;
import erds.com.service.ITeacherService;
import erds.com.service.IssrService;
import erds.com.service.ProfessorService;
import erds.com.util.DateUtil;
import erds.com.util.DuoBeiYunUtil;
import erds.com.util.JsonUtil;
import erds.com.util.QiNiuUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class CourseController {

	private static Logger log = LoggerFactory.getLogger(CourseController.class);
	@Autowired
	private ICourseService courseService;
	@Autowired
	private IPayRecordService payRecordService;
	@Autowired
	private ITeacherService tearchService;
	@Autowired
	private IPartnerService partnerService;
	@Autowired
	private IDemandService demandService;
	@Autowired
	private IRollingService rollingService;
	@Autowired
	private IssrService ssrService;
	@Autowired
	private IInformationService informationService;
	@Autowired
	private IOfflineService offlineService;
	@Autowired
	private IStudentService studentService;
	@Autowired
	private ProfessorService professorService;
	private static final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	@Frequency(name="getCoursesForTeacher", limit=100, time=60)
	@RequestMapping("/getCoursesForTeacher")
	@ResponseBody
	private JSONObject getCoursesForTeacher(HttpServletRequest request){
		log.info("getCoursesForTeacher begin ...");
		JSONObject obj = new JSONObject();
		try {
			String data = request.getParameter("data");
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			List<Course> courses = courseService.getCoursesForTeacher(param);
			List<Demand> demands = demandService.getDemandsForTeacher(param);
			obj.put("code", 200);
			obj.put("courses", courses);
			obj.put("coursessize", courses.size());
			obj.put("demands", demands);
			obj.put("demandssize", demands.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	
	/**
	 * 
	 * 根据id查询课程详情，以及根据tid查询相关老师详情
	 * 
	 * @param request
	 * @return
	 */
	@Frequency(name="findCourseById", limit=100, time=60)
	@RequestMapping("/findCourseById")
	@ResponseBody
	public JSONObject findCoursesById(HttpServletRequest request){
		log.info("findCoursesById begin ...");
//		String data = request.getParameter("data");
		String cid = request.getParameter("cid");
		String uid = request.getParameter("uid");
		//String series = request.getParameter("series");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("cid", cid);
			param.put("uid", uid);
			Course course = courseService.findCoursesById(param);
			param.put("tid", course.getTid());
			Teacher teacher = tearchService.findTeacherById(param);
			Map<String, Object> param1 = new HashMap<>();
//			String uid = (String) param.get("uid");
//			String cid = (String) param.get("cid");
			param1.put("sid", uid);
			param1.put("cid", course.getSeries());
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
			obj.put("course", course);
			obj.put("teacher", teacher);
			obj.put("parRecord", bcOrder.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 根据类别查询出对应的课程 bigType smallType
	 * @return
	 */
	@Frequency(name="getCourses", limit=100, time=60)  
	@RequestMapping("/getCourses")
	@ResponseBody
	public JSONObject getCourses(HttpServletRequest request){
		log.info("getCourses  begin ...");
		JSONObject obj = new JSONObject();
		try {
			String pageIndex = request.getParameter("pageIndex");
			String pageSize = request.getParameter("pageSize");
			Map<String, Object> param = new HashMap<String,Object>();
			param.put("pageIndex", (Integer.parseInt(pageIndex)-1)*Integer.parseInt(pageSize));
			param.put("pageSize", Integer.parseInt(pageSize));
			List<Course> list = courseService.getCourseAll(param);
			List<Rollimg> rollList = rollingService.queryRollimg(param);
			List<Teacher> teacherList = tearchService.getTeacherList(param);
			param.put("type", "c4");
			List<Demand> demandList = demandService.getDemand(param);
			List<Partners> partnersList = partnerService.getPartners();
			List<Demandc3> demandc3List = demandService.getDemandc3();
			List<Demandc3> demandc1List = demandService.getDemandc1();
			List<Demandc3> demandAllList = demandService.getDemandAll();
			List<Information> infos = informationService.queryInformations();
			List<Demand> centerList = demandService.getIsCenter(param);
			List<Offline> offlines = offlineService.queryOfflines(param);
			List<Professor> professors = professorService.queryProfessor(param);
			obj.put("offlines", offlines);
			obj.put("offlinesSize", offlines.size());
			obj.put("centerList", centerList);
			obj.put("centerListSize", centerList.size());
			obj.put("demandc3List", demandc3List);
			obj.put("demandAllList", demandAllList);
			obj.put("demandAllListSize", demandAllList.size());
			obj.put("demandc3ListSize", demandc3List.size());
			obj.put("demandc1List", demandc1List);
			obj.put("demandc1ListSize", demandc1List.size());
			obj.put("demandList", demandList);
			obj.put("demandListSize", demandList.size());
			obj.put("professors", professors);
			obj.put("professorsSize", professors.size());
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("teacherList", teacherList);
			obj.put("size", list.size());
			obj.put("teacherSize", teacherList.size());
			obj.put("rollList", rollList);
			obj.put("rollListSize",rollList.size());
			obj.put("partnersList", partnersList);
			obj.put("partnersListSize", partnersList.size());
			obj.put("infos", infos);
			obj.put("infosSize", infos.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * (后台)找出所有的直播点播课
	 * @return
	 */
	@Frequency(name="manGetCourses", limit=100, time=60)
	@RequestMapping("/manGetCourses")
	@ResponseBody
	public JSONObject manGetCourses(HttpServletRequest request){
		log.info("manGetCourses  begin ...");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String,Object>();
			List<Course> list = courseService.manGetCourseAll();
			param.put("pageIndex", 0);
			param.put("pageSize", 1000);
			List<Demand> demandList = demandService.getDemand(param);
			List<Demandc3> demandc1List = demandService.getDemandc1();
			obj.put("demandc1List", demandc1List);
			obj.put("demandc1ListSize", demandc1List.size());
			obj.put("demandList", demandList);
			obj.put("demandListSize", demandList.size());
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 更多页面
	 * 根据类别查询出对应的课程 bigType smallType type
	 * @return
	 */
	@Frequency(name="getMoreCourses", limit=100, time=60)
	@RequestMapping("/getMoreCourses")
	@ResponseBody
	public JSONObject getMoreCourses(HttpServletRequest request){
		log.info("getMoreCourses  begin ...");
//		String data = request.getParameter("data");
		String type = request.getParameter("type");
		String bigType = request.getParameter("bigType");
		String smallType = request.getParameter("smallType");
		String pageIndex = request.getParameter("pageIndex");
		String pageSize = request.getParameter("pageSize");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("type", type);
			param.put("bigType", bigType);
			param.put("smallType", smallType);
			param.put("pageIndex", (Integer.parseInt(pageIndex)-1)*Integer.parseInt(pageSize));
			param.put("pageSize", Integer.parseInt(pageSize));
			List<Course> list = courseService.getCourseList(param);
			if(list.size()>0){
				obj.put("code", 200);
				obj.put("list", list);
				obj.put("size", list.size());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 搜索功能 支持按title模糊查询
	 * @param request title
	 * @return
	 */
	@Frequency(name="search", limit=100, time=60)
	@RequestMapping("/search")
	@ResponseBody
	public JSONObject search(HttpServletRequest request){
		log.info("search begin ...");
		String title = request.getParameter("title");
		String pageIndex = request.getParameter("pageIndex");
		String pageSize = request.getParameter("pageSize");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("title", title);
			param.put("pageIndex", (Integer.parseInt(pageIndex)-1)*Integer.parseInt(pageSize));
			param.put("pageSize", Integer.parseInt(pageSize));
			List<Course> list = courseService.getCourseList(param);
			if(list.size()>0){
				obj.put("code", 200);
				obj.put("list", list);
				obj.put("size", list.size());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 获取所有的直播课
	 * @param request 
	 * @return
	 */
	@Frequency(name="live_more", limit=100, time=60)
	@RequestMapping("/live_more")
	@ResponseBody
	public JSONObject live_more(HttpServletRequest request){
		log.info("live_more begin ...");
		JSONObject obj = new JSONObject();
		String pageIndex = request.getParameter("pageIndex");
		String pageSize = request.getParameter("pageSize");
		try {
			Map<String,Object> param = new HashMap<>();
			param.put("pageIndex", (Integer.parseInt(pageIndex)-1)*Integer.parseInt(pageSize));
			param.put("pageSize", Integer.parseInt(pageSize));
			List<Course> list = courseService.getCourseAll(param);
			if(list.size()>0){
				obj.put("code", 200);
				obj.put("list", list);
				obj.put("size", list.size());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 进入课堂，该用户是否登陆，是否已经为该课程付费
	 * @param request sid cid roomId
	 * @return
	 */
	@Frequency(name="enterCourse", limit=100, time=60)
	@RequestMapping("/enterCourse")
	public String enterCourse(HttpServletRequest request){
		log.info("enter course");
		try {
			String roomId = request.getParameter("roomId");
			String cid = request.getParameter("cid");
			String uid = request.getParameter("uid");
			String nickName = request.getParameter("username");
			String former = request.getParameter("former");
			Map<String, Object> param = new HashMap<>();
			if(uid.equals("null")){
				request.getSession().setAttribute("message", "请<a href='login.jsp'>登陆<a/>!");
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
			param.put("sid", uid);
			param.put("cid", cid);
			Course c = courseService.findCoursesById(param);
			param.put("cid", c.getSeries());
			//通过sid查询他是否为该课程付费
			List<PayRecord> list = payRecordService.queryPayRecord(param);
			if(list.size()<=0){
				request.getSession().setAttribute("message", "请先<a href='detail.jsp?cid="+cid+"'>付费</a>!");
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
					request.getSession().setAttribute("message", "请先请先<a href='detail.jsp?cid="+cid+"'>付费</a>!");
					return "error";
				}
			}
			
			String url = DuoBeiYunUtil.generateRoomEnterUrl(uid, roomId, nickName, DuobeiYunClient.ROLE_STUDENT);
			//记录学生的上课情况
			
			param.put("sName", nickName);
			param.put("studyTime", sf.format(new Date()));
			param.put("content", c.getTitle());
			int code = ssrService.saveSSRecord(param);
			if(code!=1){
				log.error("记录日志错误");
			}
			request.getSession().setAttribute("url", url);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "play";
	}
	
	/**
	 * 老师开始讲课
	 * @param request uid roomId nickName
	 * @return
	 */
	@Frequency(name="beginCourse", limit=100, time=60)
	@RequestMapping("/beginCourse")
	public String beginCourse(HttpServletRequest request){
		log.info("beginCourse ...");
		try {
			String roomId = request.getParameter("roomId");
			String uid = request.getParameter("uid");
			String nickName = request.getParameter("username");
			String url = DuoBeiYunUtil.generateRoomEnterUrl(uid, roomId, nickName, DuobeiYunClient.ROLE_TEACHER);
			request.getSession().setAttribute("teacher_url", url);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "tPlay";
	}
	
	/**
	 * 发布课程
	 * @return
	 */
	@Frequency(name="addCourse", limit=100, time=60)
	@RequestMapping(value = "/addCourse", method = RequestMethod.POST)
	private String fildUpload(@RequestParam(value = "cover", required = false) MultipartFile[] file,@RequestParam(value="teacherName")String name,@RequestParam(value="price")String price,@RequestParam(value="oprice")String oprice,
			@RequestParam(value="beginTime")String beginTime,@RequestParam(value="duration")String duration,@RequestParam(value="bigType")String bigType,@RequestParam(value="smallType")String smallType,
			@RequestParam(value="title")String title,@RequestParam(value="totalNum")String totalNum,@RequestParam(value = "video", required = false) MultipartFile video,
			@RequestParam(value="provide")MultipartFile[] provide,@RequestParam(value="directories")String directories,@RequestParam(value="provide1")String provide1,
			@RequestParam(value="announcement")String announcement,@RequestParam(value="type")String type,@RequestParam(value="weeks")String weeks,@RequestParam(value="count")String count,HttpServletRequest request) throws Exception {
		try {
			//获取上课的时间集合
			JSONArray arr = new JSONArray();
			int a = arr.size();
			String dd = beginTime;
			for(;a<Integer.parseInt(count);){
				JSONObject obj = new JSONObject();
				obj.put("title", title+(a+1));
				obj.put("date", dd.replace("T", " "));
				obj.put("duration", duration);
				int i = DateUtil.dayForWeek(dd.replace("T", " "));
				if(i==1&&weeks.contains("w1")){
					arr.add(obj);
					a++;
				}
				if(i==2&&weeks.contains("w2")){
					arr.add(obj);
					a++;
				}
				if(i==3&&weeks.contains("w3")){
					arr.add(obj);
					a++;
				}
				if(i==4&&weeks.contains("w4")){
					arr.add(obj);
					a++;
				}
				if(i==5&&weeks.contains("w5")){
					arr.add(obj);
					a++;
				}
				if(i==6&&weeks.contains("w6")){
					arr.add(obj);
					a++;
				}
				if(i==7&&weeks.contains("w7")){
					arr.add(obj);
					a++;
				}
				dd = DateUtil.getSpecifiedDayAfter(dd.replace("T", " "));
	    	}
			
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("series",(int)new Date().getTime());
			param.put("tid", name);
			Teacher t =tearchService.findTeacherById(param);
			param.put("tName", t.gettName());
			param.put("price", price);
			param.put("oprice", oprice);
			param.put("bigtype", bigType);
			param.put("smalltype", smallType);
			param.put("begintime", beginTime);
			param.put("type", type);
			param.put("announcement", announcement);
			param.put("directories", directories);
			param.put("totalNum", totalNum);
			long l = new Date().getTime();
			QiNiuUtil.Simple_upload_byte(video.getBytes(),  l+video.getOriginalFilename());
			param.put("videourl", QiNiuUtil.BASE_URL+"/"+l+video.getOriginalFilename());
			String provideUrl = provide1+"|";
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
					for(int k=0;k<arr.size();k++){
						JSONObject obj2 = (JSONObject) arr.get(k);
						String date = (String) obj2.get("date");
						Date d = sf.parse(date.replace("T", " "));
						String data = DuoBeiYunUtil.createRoom((String) obj2.get("title"),d,Integer.parseInt(duration));
						Map<String,Object> map = JsonUtil.getMapFromJson(data);
						JSONObject room = (JSONObject) map.get("room");
						param.put("roomId", room.get("roomId"));
						param.put("title", (String) obj2.get("title"));
						param.put("hostCode", room.get("hostCode"));
						param.put("duration", Integer.parseInt(duration));
						log.info(data);
						int code = courseService.addCourse(param);
						if(code!=1){
							return "error";
						}
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addCourses";
	}
	
	/**
	 * 修改课程数量
	 * @param id
	 * @param num
	 * @param request
	 * @return
	 */
	@Frequency(name="updateCourseNum", limit=100, time=60)
	@RequestMapping("/updateCourseNum")
	public String update(
			@RequestParam(value = "id") String id, @RequestParam(value = "num") String num,
			HttpServletRequest request) {
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", id);
			param.put("totalNum", num);
			int code = courseService.updateCourse(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-updateTotalNum";
	}
	
	/**
	 * 修改直播课程数量
	 * @param id
	 * @param num
	 * @param request
	 * @return
	 */
	@Frequency(name="updateDemandNum", limit=100, time=60)
	@RequestMapping("/updateDemandNum")
	public String update1(
			@RequestParam(value = "id") String id, @RequestParam(value = "num") String num,
			HttpServletRequest request) {
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", id);
			param.put("totalNum", num);
			int code = demandService.updateDemand(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "updateTotalNum";
	}
	@Frequency(name="delCourse", limit=100, time=60)
	@RequestMapping("delCourse")
	public String delCourse(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			int code = courseService.delCourse(Integer.parseInt(id));
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-courseList";
	}
	
}
