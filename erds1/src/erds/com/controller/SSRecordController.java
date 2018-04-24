package erds.com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import erds.com.bean.Parent;
import erds.com.bean.Student;
import erds.com.bean.StudentStudyRecord;
import erds.com.service.IStudentService;
import erds.com.service.ITeacherService;
import erds.com.service.IssrService;
import erds.com.util.HttpRequest;
import erds.com.util.JsonUtil;
import erds.com.util.MD5Util;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class SSRecordController {

	private static Logger log = LoggerFactory.getLogger(SSRecordController.class);
	@Autowired
	private IssrService ssrService;
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private IStudentService studentService;
	@Frequency(name="querySSRecord", limit=100, time=60)
	@RequestMapping("querySSRecord")
	@ResponseBody
	public JSONObject querySSRecord(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String sid = request.getParameter("sid");
//			String pageIndex = request.getParameter("pageIndex");
//			String pageSize = request.getParameter("pageSize");
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("sid", sid);
			param.put("pageIndex", 0);
			param.put("pageSize", 1000);
			List<StudentStudyRecord> list = ssrService.querySSRecord(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 登录parent
	 * 
	 * @return
	 */
	@Frequency(name="login_parent", limit=100, time=60)
	@RequestMapping("/login_parent")
	@ResponseBody
	public JSONObject login_parent(HttpServletRequest request) {
		log.info("login_parent begin ...");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		Map<String, Object> param = JsonUtil.getMapFromJson(data);
		try {
			if(SessionListener.isLoginUser(param.get("uid")+"")){
				obj.put("code", 100);
				obj.put("message", "该用户已经登录");
				return obj;
			}
			Parent p = teacherService.queryParent(param);
			if (p!=null) {
				obj.put("code", 200);
				obj.put("message", "登录成功");
				obj.put("child", p.getChild());
				obj.put("pName", p.getpName());
				obj.put("pid", p.getPid());
				log.info(p.getChild());
				request.getSession().setAttribute("pName", p.getpName());
				request.getSession().setAttribute("pid", p.getPid());
				request.getSession().setAttribute("child", p.getChild());
			}else{
				obj.put("code", 100);
				obj.put("message", "用户名密码不正确!");
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 注册parent pid pName child pwd validateCode
	 * 
	 * @return
	 */
	@Frequency(name="register_parent", limit=100, time=60)
	@RequestMapping("/register_parent")
	@ResponseBody
	public JSONObject register_parent(HttpServletRequest request) {
		log.info("register_parent begin ...");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			int code = teacherService.updateParent(param);
			if(code!=1){
				obj.put("code", 100);
				obj.put("message", "该用户注册error!");
				return obj;
			}
			obj.put("code", code);
			obj.put("message", "注册成功");
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	@Frequency(name="getValidateCode", limit=100, time=60)
	@RequestMapping("/getValidateCode")
	@ResponseBody
	public JSONObject getValidateCode(HttpServletRequest request) {
		log.info("getValidateCode begin ...");
		String phone = request.getParameter("userphone");
//		String validateCode = request.getParameter("validateCode");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param1 = new HashMap<>();
			param1.put("uid", phone);		
			Student ss = studentService.queryStudent(param1);
			if(ss!=null){
				obj.put("code", 100);
				obj.put("message", "该用户已经注册");
				return obj;
			}
			String res = MD5Util.sendSMS(phone, "86", "五");
			Map<String, Object> param = new HashMap<>();
			param.put("uid", phone);
			param.put("validateCode", res);
			int code = studentService.addStudent(param);
//			int code = studentService.updateStudent(param );
			log.info(code+"");
			obj.put("code", res);
			obj.put("message", "success");
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	@Frequency(name="getValidateCode_p", limit=100, time=60)
	@RequestMapping("/getValidateCode_p")
	@ResponseBody
	public JSONObject getValidateCode_p(HttpServletRequest request) {
		log.info("getValidateCode_p begin ...");
		String phone = request.getParameter("userphone");
//		String validateCode = request.getParameter("validateCode");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param1 = new HashMap<>();
			param1.put("pid", phone);		
			Parent ss = teacherService.queryParent(param1);
			if(ss!=null){
				obj.put("code", 100);
				obj.put("message", "该用户已经注册");
				return obj;
			}
			String res = MD5Util.sendSMS(phone, "86", "五");
			Map<String, Object> param = new HashMap<>();
			param.put("pid", phone);
			param.put("validateCode", res);
			int code = teacherService.saveParent(param);
			log.info(code+"");
			obj.put("code", res);
			obj.put("message", "success");
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 重置密码发送短信验证
	 * @param request
	 * @return
	 */
	@Frequency(name="getCodeForReset", limit=100, time=60)
	@RequestMapping("/getCodeForReset")
	@ResponseBody
	public JSONObject getCodeForReset(HttpServletRequest request) {
		log.info("getCodeForReset begin ...");
		String phone = request.getParameter("userphone");
		JSONObject obj = new JSONObject();
		try {
			String ip = HttpRequest.getIpAddr(request);
			log.info("来访者手机号："+phone+",ip:"+ip);
//			String res = MD5Util.sendSMS(phone, "86", "五");
			obj.put("code", 200);
			obj.put("message", "success");
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
}
