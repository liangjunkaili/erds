package erds.com.controller;

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

import erds.com.bean.Course;
import erds.com.bean.Manager;
import erds.com.bean.Teacher;
import erds.com.service.ICourseService;
import erds.com.service.ILogService;
import erds.com.service.ITeacherService;
import erds.com.util.DateUtil;
import erds.com.util.HaspUtil;
import erds.com.util.HttpRequest;
import erds.com.util.JsonUtil;
import erds.com.util.QiNiuUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class TeacherController {

	private static Logger log = LoggerFactory.getLogger(TeacherController.class);
	@Autowired
	private ITeacherService tearchService;
	@Autowired
	private ICourseService courseService;
	@Autowired
	private ILogService logService;
	/**
	 * 
	 * 根据tid查询相关老师详情
	 * 
	 * @param request
	 * @return
	 */
	@Frequency(name="findTeacherById", limit=100, time=60)
	@RequestMapping("/findTeacherById")
	@ResponseBody
	public JSONObject findTeacherById(HttpServletRequest request){
		log.info("findTeacherById begin ...");
		JSONObject obj = new JSONObject();
		try {
			String tid = request.getParameter("tid");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("tid", tid);
			Teacher teacher = tearchService.findTeacherById(param);
			if(teacher==null){
				obj.put("code", 100);
				return obj;
			}
			obj.put("code", 200);
			obj.put("teacher", teacher);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 老师登录
	 * @param request
	 * @return
	 */
	@Frequency(name="login_teacher", limit=100, time=60)
	@RequestMapping("/login_teacher")
	@ResponseBody
	private JSONObject login_teacher(HttpServletRequest request){
		log.info("login_teacher begin ... ");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		try {
			
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			Teacher teacher = tearchService.findTeacherById(param);
			if(teacher==null){
				obj.put("code", 404);
				obj.put("message", "error");
				return obj;
			}else{
				obj.put("code", 200);
				obj.put("message", "success");
				obj.put("tid", teacher.getTid());
				obj.put("tname", teacher.gettName());
				request.getSession().setAttribute("tname", teacher.gettName());
				request.getSession().setAttribute("tid", teacher.getTid());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 管理员登录
	 * @param request account pwd
	 * @return
	 */
	@Frequency(name="login_manager", limit=100, time=60)
	@RequestMapping("/login_manager")
	@ResponseBody
	private JSONObject login_manager(HttpServletRequest request){
		log.info("login_manager begin ... ");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		try {
			/*if(!HaspUtil.login()){
				obj.put("code", 100);
				obj.put("message", "error");
				return obj;
			}*/
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			param.put("dealtime", DateUtil.DateToStr(new Date()));
			param.put("ip", HttpRequest.getIpAddr(request));
			param.put("dealname", param.get("account"));
			Manager manager = tearchService.findManager(param);
			if(manager==null){
				obj.put("code", 100);
				obj.put("message", "用户名或者密码不正确!");
				return obj;
			}
			int code = logService.addLog(param);
			if(code!=1){
				log.error("日志添加失败!");
			}
			log.info("code:"+code);
			obj.put("code", 200);
			obj.put("message", "success");
			obj.put("account", manager.getAccount());
			request.getSession().setAttribute("account", manager.getAccount());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 录入老师的信息
	 * @return
	 */
	@Frequency(name="addTeacher", limit=100, time=60)
	@RequestMapping(value = "/addTeacher", method = RequestMethod.POST)
	private String fildUpload(@RequestParam(value = "cover", required = false) MultipartFile[] file,@RequestParam(value="tName")String tName,@RequestParam(value="describle")String describle,
			@RequestParam(value="sign")String sign,@RequestParam(value="password")String password,HttpServletRequest request) throws Exception {
		log.info("addTearch begin ...");
		try {
			
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("tname", tName);
			param.put("sign", sign);
			param.put("describle", describle);
			param.put("password", password);
			long l = new Date().getTime();
			for (MultipartFile mf : file) {
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					param.put("headimg", url);
					log.info(url);
					int code = tearchService.addTeacher(param);
					if(code!=1){
						return "error";
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addTeacher";
	}
	/**
	 * 老师的个人风采
	 * @param request 暂无条件
	 * @return
	 */
	@Frequency(name="queryTeacher", limit=100, time=60)
	@RequestMapping("/queryTeacher")
	@ResponseBody
	public JSONObject queryTeacher(HttpServletRequest request){
		log.info("queryTeacher begin ...");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		try {
			
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			List<Teacher> list = tearchService.getTeacherList(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 修改密码
	 * @param request tid password tname
	 * @return
	 */
	@Frequency(name="upTeacher", limit=100, time=60)
	@RequestMapping("/upTeacher")
	public String upTeacher(HttpServletRequest request){
		log.info("upTeacher begin ...");
		try {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String tname = request.getParameter("tName");
			Map<String,Object> param = new HashMap<>();
			param.put("tid", id);
			param.put("password", password);
			param.put("tname", tname);
			int code = tearchService.updateTeacher(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-TeacherList";
	}
	/**
	 * 老师获取到自己的直播课
	 * @param request tid
	 * @return
	 */
	@Frequency(name="queryCourseForMe", limit=100, time=60)
	@RequestMapping("/queryCourseForMe")
	@ResponseBody
	public JSONObject queryCourseForMe(HttpServletRequest request){
		log.info("queryCourseForMe begin ...");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			List<Course> list = courseService.getCourse(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
}
