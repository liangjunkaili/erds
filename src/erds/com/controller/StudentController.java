package erds.com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.beecloud.BCEumeration.PAY_CHANNEL;
import cn.beecloud.BCPay;
import cn.beecloud.BCUtil;
import cn.beecloud.BeeCloud;
import cn.beecloud.bean.BCOrder;
import erds.com.bean.Comments;
import erds.com.bean.Demand;
import erds.com.bean.Note;
import erds.com.bean.PayRecord;
import erds.com.bean.Practice;
import erds.com.bean.Student;
import erds.com.bean.Teacher;
import erds.com.service.ICommentsService;
import erds.com.service.IDemandService;
import erds.com.service.INoteService;
import erds.com.service.IPayRecordService;
import erds.com.service.IPracticeService;
import erds.com.service.IStudentService;
import erds.com.service.ITeacherService;
import erds.com.util.DateUtil;
import erds.com.util.JsonUtil;
import erds.com.util.MD5Util;
import erds.com.util.MailUtils;
import erds.com.util.QiNiuUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class StudentController {

	private static Logger log = LoggerFactory.getLogger(StudentController.class);
	final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Autowired
	private IStudentService studentService;
	@Autowired
	private IDemandService demandService;
	@Autowired
	private IPayRecordService payRecordService;
	@Autowired
	private INoteService noteService;
	@Autowired
	private ICommentsService commentsService;
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private IPracticeService practiceService;
	@Frequency(name="findCommentsAll", limit=100, time=60)
	@RequestMapping("/findCommentsAll")
	@ResponseBody
	public JSONObject findCommentsAll(HttpServletRequest request) {
		log.info("addComment begin ...");
		String data = request.getParameter("data");
		Map<String, Object> param = JsonUtil.getMapFromJson(data);
		JSONObject obj = new JSONObject();
		try {
			List<Comments> comments = commentsService.queryComment(param);
			if(comments!=null){
				obj.put("code", 200);
				obj.put("comments", comments);
				obj.put("commentssize", comments.size());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	@Frequency(name="addComment", limit=100, time=60)
	@RequestMapping("/addComment")
	@ResponseBody
	public JSONObject addComment(HttpServletRequest request) {
		log.info("addComment begin ...");
		JSONObject obj = new JSONObject();
		String data = request.getParameter("data");
		String sid = (String) request.getSession().getAttribute("uid");
		String headimg = (String) request.getSession().getAttribute("headimg");
		String nickname = (String) request.getSession().getAttribute("username");
		String date = DateUtil.DateToStr(new Date());
		try {
			if(sid==null||sid.equals("")){
				obj.put("code", 100);
				obj.put("message", "请登录");
				return obj;
			}
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			param.put("time", date);
			param.put("state", 1);
			param.put("sid", sid);
			param.put("headimg", headimg);
			param.put("nickname", nickname);
			int i = commentsService.addComment(param);
			if(i!=1){
				obj.put("code", 100);
				obj.put("message", "评论error！");
				return obj;
			}
			obj.put("code", 200);
			obj.put("message", "评论成功！");
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 查询订单是否存在
	 * 
	 * @return
	 */
	@Frequency(name="queryPayByBillNo", limit=100, time=60)
	@RequestMapping("/queryPayByBillNo")
	@ResponseBody
	public JSONObject queryPayByBillNo(HttpServletRequest request) {
		log.info("queryPayByBillNo begin ...");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			PayRecord payRecord = payRecordService.queryPayByBillNo(param);
			if (payRecord!=null||"".equals(payRecord)) {
				obj.put("code", 200);
				obj.put("payRecord", payRecord);
			}else{
				obj.put("code", 100);
				obj.put("message", "支付失败");
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * 登录
	 * 
	 * @return
	 */
	@Frequency(name="login", limit=100, time=60)
	@RequestMapping("/login")
	@ResponseBody
	public JSONObject login(HttpServletRequest request) {
		log.info("login begin ...");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		Map<String, Object> param = JsonUtil.getMapFromJson(data);
		try {
			if(SessionListener.isLoginUser(param.get("uid")+"")){
				obj.put("code", 100);
				obj.put("message", "该用户已经登录");
				return obj;
			}
			List<Student> s = studentService.getStudent(param);
			if (s.size() > 0) {
				obj.put("code", 200);
				obj.put("message", "登录成功");
				obj.put("uid", s.get(0).getUid());
				obj.put("username", s.get(0).getNickName());
				obj.put("headimg", s.get(0).getHeadimg());
				log.info(s.get(0).getUid());
				request.getSession().setAttribute("username", s.get(0).getNickName());
				request.getSession().setAttribute("uid", s.get(0).getUid());
				request.getSession().setAttribute("headimg", s.get(0).getHeadimg());
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
	 * 退出登录
	 * 
	 * @param request
	 * @return
	 */
	@Frequency(name="logout", limit=100, time=60)
	@RequestMapping("/logout")
	@ResponseBody
	public JSONObject logout(HttpServletRequest request) {
		log.info("logout begin ...");
		JSONObject obj = new JSONObject();
		request.getSession().removeAttribute("username");
		obj.put("code", 200);
		obj.put("message", "退出成功");
		request.getSession().removeAttribute("uid");
		return obj;
	}

	/**
	 * 个人资料
	 * 
	 * @param request
	 *            uid
	 * @return
	 */
	@Frequency(name="getMyInfo", limit=100, time=60)
	@RequestMapping("/getMyInfo")
	@ResponseBody
	public JSONObject getMyInfo(HttpServletRequest request) {
		log.info("getMyInfo begin ...");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			String uid = (String) param.get("uid");
			if (uid == null ||"null".equals(uid)) {
				obj.put("code", 100);
				return obj;
			}
			param.put("sid", uid);
			List<Student> s = studentService.getStudent(param);
			List<Demand> d = demandService.getCourseForMe(param);
			List<Note> note = noteService.queryNote(param);
			param.put("uid", uid);
			List<Practice> practice = practiceService.queryPractice(param);
			obj.put("code", 200);
			obj.put("message", "success");
			obj.put("info", s.get(0));
			obj.put("list", d);
			obj.put("size", d.size());
			obj.put("notelist", note);
			obj.put("notesize", note.size());
			obj.put("practicelist", practice);
			obj.put("practicesize", practice.size());
			request.getSession().setAttribute("address", s.get(0).getAddress());
			log.info(s.get(0).getUid());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}

	/**
	 * 修改个人信息
	 * 
	 * @param request
	 * @return
	 */
	@Frequency(name="updateMyInfo", limit=100, time=60)
	@RequestMapping("/updateMyInfo")
	public String updateMyInfo(@RequestParam(value = "headImg", required = false) MultipartFile[] file,
			@RequestParam(value = "teacherName") String name, @RequestParam(value = "sex") String sex,
			@RequestParam(value = "address") String address, @RequestParam(value = "uid1") String uid1,
			@RequestParam(value = "grade") String grade,
			HttpServletRequest request) {
		log.info("updateMyInfo begin ...");
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("nickName", name);
			param.put("uid", uid1);
			param.put("sex", sex);
			param.put("address", address);
			param.put("grade", grade);
			long l = new Date().getTime();
			String url = null;
			for (MultipartFile mf : file) {
				if (!mf.isEmpty()) {
					try {
						QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
						url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
						param.put("headimg", url);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			log.info(url);
			int code = studentService.updateStudent(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "account";
	}

	/**
	 * 我的课程
	 * 
	 * @param request
	 *            uid
	 * @return
	 */
	@Frequency(name="getMyCourse", limit=100, time=60)
	@RequestMapping("/getMyCourse")
	@ResponseBody
	public JSONObject getMyCourse(HttpServletRequest request) {
		log.info("getMyCourse begin ...");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			String uid = (String) param.get("uid");
			if (uid == null ||"null".equals(uid)) {
				obj.put("code", 100);
				return obj;
			}
			List<Demand> s = demandService.getCourseForMe(param);
			if (s.size() > 0) {
				obj.put("code", 200);
				obj.put("message", "success");
				obj.put("list", s);
				obj.put("size", s.size());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}

	/**
	 * 注册
	 * uid nickname password
	 * @return
	 */
	@Frequency(name="register", limit=100, time=60)
	@RequestMapping("/register")
	@ResponseBody
	public JSONObject register(HttpServletRequest request) {
		log.info("register begin ...");
		String uid = request.getParameter("uid");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("uid", uid);
			Student ss = studentService.queryStudent(param);
			if(ss!=null){
				obj.put("code", 100);
				obj.put("message", "该用户已经注册");
				return obj;
			}
			param.put("nickname", nickname);
			param.put("password", password);
			int code = studentService.addStudent(param);
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

	/**
	 * 学生点击付费，成功后调用此接口，保存该用户的付费记录，确保该用户的上课权限
	 * 
	 * @param request
	 *            sid cid money
	 * @return
	 */
	@Frequency(name="payForCourse", limit=100, time=60)
	@RequestMapping("/payForCourse")
	public String payForCourse(HttpServletRequest request) {
		log.info("payForCourse begin ...");
		String billNo = BCUtil.generateRandomUUIDPure();
		Map<String, Object> optional = new HashMap<String, Object>();
		optional.put("rui", "feng");
		String type = request.getParameter("paytype");
		String fee = request.getParameter("fee");
		String title = request.getParameter("title");
		String cid = request.getParameter("cid");
		String uid = request.getParameter("uid");
		String did = request.getParameter("did");
		String former = request.getParameter("former");
		optional.put("fee", fee);
		optional.put("title", title);
		optional.put("cid", cid);
		optional.put("uid", uid);
		optional.put("did", did);
		optional.put("billNo", billNo);
		request.getSession().setAttribute("billNo", billNo);
		if (uid == null || "undefined".equals(uid) || "null".equals(uid)) {
			request.getSession().setAttribute("message", "请<a href='login.jsp'>登陆<a/>!");
			request.getSession().setAttribute("former", former);
			return "error";
		}
		PAY_CHANNEL channel;
		
		int totalFee = (int) (Double.parseDouble(fee) * 100);
		try {
			channel = PAY_CHANNEL.valueOf(type);
		} catch (Exception e) {
			channel = null;
			log.error(e.getMessage(), e);
		}

		BCOrder bcOrder = new BCOrder(channel, totalFee, billNo, title);
		// BCInternationlOrder internationalOrder = new BCInternationlOrder();
		bcOrder.setBillTimeout(360);
		bcOrder.setOptional(optional);
		bcOrder.setReturnUrl("http://5s-edu.com/");
		try {
			bcOrder = BCPay.startBCPay(bcOrder);
			Thread.sleep(3000);
			request.getSession().setAttribute("success", true);
			request.getSession().setAttribute("codeUrl", bcOrder.getCodeUrl());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return "pay";
	}
	/**
	 * webHook_receiver
	 * @param request
	 * @return
	 */
	@Frequency(name="webHook_receiver", limit=100, time=60)
	@RequestMapping("/webHook_receiver")
	public String webHook_receiver(HttpServletRequest request) {
		log.info("webHook_receiver begin ...");
		BeeCloud.registerApp("2fc29555-49b7-415e-80f0-c5d06f5e799d", null, "ccb86190-c3c0-43ba-a4c9-29371c00a651", "3db27c52-220d-41f5-ba05-bf398febb5c0");
	    StringBuffer json = new StringBuffer();
	    String line = null;
	    try {
	        request.setCharacterEncoding("utf-8");
	        BufferedReader reader = request.getReader();
	        while ((line = reader.readLine()) != null) {
	            json.append(line);
	        }
	        log.info(json.toString());
	        JSONObject jsonObj = JSONObject.fromObject(json.toString());
	        String sign = jsonObj.getString("sign");
	        String timestamp = jsonObj.getString("timestamp");
	        JSONObject jsonObj1 = jsonObj.getJSONObject("optional");
	        String uid = jsonObj1.getString("uid");
	        String fee = jsonObj1.getString("fee");
	        String cid = jsonObj1.getString("cid");
	        String did = jsonObj1.getString("did");
	        String billNo = jsonObj1.getString("billNo");
	        boolean status = JsonUtil.verifySign(sign, timestamp);
	        if (status) { //验证成功
	        	log.info("success");
	        	Map<String, Object> param = new HashMap<String, Object>();
	        	param.put("sid", uid + "");
	        	param.put("money", fee);
	        	param.put("dealTime", sf.format(new Date()));
	        	param.put("billNo", billNo);
	        	if (did != null &&!"".equals(did)&&!"null".equals(did)) {
	        		int d = Integer.parseInt(did);
	        		param.put("did", d);
	        	}else{
//	        		int c = Integer.parseInt(cid);
	        		param.put("cid", cid);
	        	}
	        	List<PayRecord> list = payRecordService.queryPayRecord(param);
	        	if(list.size()<=0){
	        		int code = payRecordService.addPayRecord(param);
	        		if(code!=1){
	        			return "error";
	        		}
	        	}
	        } else { //验证失败
	        	log.info("fail");
	        	return "error";
	        }
	    } catch (Exception e) {
	        log.error(e.getMessage(),e);
	    }
	    return "success";
	}
	/**
	 * 学生提交笔记
	 * 
	 * @param request
	 *            sid sbid content time
	 * @return
	 */
	@Frequency(name="addNote", limit=100, time=60)
	@RequestMapping("/addNote")
	@ResponseBody
	public JSONObject addNote(HttpServletRequest request) {
		log.info("addNote begin ...");
		String sbid = request.getParameter("sbid");
		String sid = (String) request.getSession().getAttribute("uid");
		String content = request.getParameter("content");
		String time = request.getParameter("time");
		String url = request.getParameter("url");
		String did = request.getParameter("did");
		String submitTime = sf.format(new Date());
		String title = request.getParameter("title");
		JSONObject obj = new JSONObject();
		try {
			if(sid==null||sid.equals("")){
				obj.put("code", 100);
				obj.put("message", "请登录");
				return obj;
			}
			Map<String, Object> param = new HashMap<>();
			param.put("sid", sid);
			param.put("sbid", sbid);
			param.put("content", content);
			param.put("time", time);
			param.put("submitTime", submitTime);
			param.put("url", url);
			param.put("did", did);
			param.put("title", title);
			int code = noteService.addNote(param);
			if(code!=1){
				obj.put("code", 100);
				obj.put("message", "error");
				return obj;
			}
			obj.put("code", 200);
			obj.put("message", "提交成功");
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 管理员审核评价
	 * 
	 * @param request
	 * @return  cid
	 */
	@Frequency(name="checkcomment", limit=100, time=60)
	@RequestMapping("/checkcomment")
	public String checkcomment(HttpServletRequest request) {
		log.info("checkcomment begin ...");
		try {
			String cid = request.getParameter("cid");
			String ischeck = request.getParameter("ischeck");
			Map<String, Object> param = new HashMap<>();
			if("1".equals(ischeck)){
				param.put("state", 1);
			}else{
				param.put("state", 2);
			}
			param.put("id", cid);
			int code = commentsService.updateComment(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-checkComments";
	}
	/**
	 * 展示学生的评价(未经过审核的)
	 * 
	 * @param request
	 * @return
	 */
	@Frequency(name="getCommentforT", limit=100, time=60)
	@RequestMapping("/getCommentforT")
	@ResponseBody
	public JSONObject getCommentforT(HttpServletRequest request) {
		log.info("getComment begin ...");
		String data = request.getParameter("data");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = JsonUtil.getMapFromJson(data);
			param.put("state", 1);
			List<Comments> list = commentsService.queryComment(param);
			obj.put("code", 200);
			obj.put("commentList", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 管理员删除不法的言论
	 * 
	 * @param request id
	 * @return
	 */
	@Frequency(name="delComments", limit=100, time=60)
	@RequestMapping("/delComments")
	public String delComments(HttpServletRequest request) {
		log.info("delComments begin ...");
		String id = request.getParameter("id");
		try {
			int code = commentsService.delComment(Integer.parseInt(id));
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-checkComments";
	}
	/**
	 * 发送重置密码邮件
	 * 
	 * @param request
	 * @throws ServletException
	 * @throws IOException
	 */
	@Frequency(name="sendEmail", limit=100, time=60)
	@RequestMapping("/sendEmail")
	@ResponseBody
	public void sendEmail(HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException {
		log.info("resetPossword begin ...");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		String email = request.getParameter("email");
		String uid = request.getParameter("uid");
		String password = MD5Util.getUUID();
		Session session = MailUtils.createSession();
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("wusiedu@163.com"));
			message.setRecipients(Message.RecipientType.TO, email);
			message.setSubject("密码重置");
			message.setContent("<h1><a href='http://5s-edu.com/erds/resetPassword?uid=" + uid + "&password=" + password
					+ "'>点击此处，进行重置密码！</a>重置后的密码是" + password + ",请复制粘贴重置的后密码，重新登录后修改密码！</h1>", "text/html;charset=utf-8");

			MailUtils.sendMail(session, message);
			String emailType = email.substring(email.indexOf("@"));
			if(emailType.equals("@qq.com")){
				response.sendRedirect("https://mail.qq.com/");			
			}else if(emailType.equals("@163.com")){
				response.sendRedirect("http://mail.163.com/");			
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("邮件发送失败！");
		}
//		response.getWriter().println("请登录你的邮箱进行密码重置");
	}
	
	/**
	 * 重置密码
	 * 
	 * @param uid
	 * @param password
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@Frequency(name="resetPassword", limit=100, time=60)
	@RequestMapping("/resetPassword")
	@ResponseBody
	public JSONObject resetPassword(@RequestParam(value = "uid") String uid,
			@RequestParam(value = "password") String password, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		log.info("resetPassword begin ...");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("uid", uid);
			param.put("password", password);
			
			int code = studentService.updateStudent(param);
			if(code!=1){
				obj.put("code", 100);
				return obj;
			}
			obj.put("code", 200);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	/**
	 * (老师)发送重置密码邮件
	 * 
	 * @param request
	 * @throws ServletException
	 * @throws IOException
	 */
	@Frequency(name="sendTeacherEmail", limit=100, time=60)
	@RequestMapping("/sendTeacherEmail")
	@ResponseBody
	public void sendTeacherEmail(HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException {
		log.info("resetPossword begin ...");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		String email = request.getParameter("email");
		String tid = request.getParameter("tid");
		String password = MD5Util.getUUID();;
		Session session = MailUtils.createSession();
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("wusiedu@163.com"));
			message.setRecipients(Message.RecipientType.TO, email);
			message.setSubject("密码重置");
			message.setContent("<h1><a href='http://5s-edu.com/erds/resetTeacherPassword?tid=" + tid + "&password=" + password
					+ "'>点击此处，进行重置密码！</a>重置后的密码是" + password + ",请复制粘贴重置的后密码，重新登录后修改密码！</h1>", "text/html;charset=utf-8");

			MailUtils.sendMail(session, message);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		response.getWriter().println("请登录你的邮箱进行密码重置");
	}
	
	/**
	 * 重置老师密码
	 * 
	 * @param tid
	 * @param password
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@Frequency(name="resetTeacherPassword", limit=100, time=60)
	@RequestMapping("/resetTeacherPassword")
	@ResponseBody
	public void resetTeacherPassword(@RequestParam(value = "tid") String tid,
			@RequestParam(value = "password") String password, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		log.info("resetTeacherPassword begin ...");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("tid", tid);
			param.put("password", password);
			
			int code = teacherService.updateTeacher(param);
			log.info("---" + code);
			response.getWriter().println("重置成功！请<a href='login_teacher.jsp'>登陆</a>之后，将密码修改为你自己的密码！");
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
	}
	
	/**
	 * 修改用户密码
	 * 
	 * @param uid1
	 * @param password
	 * @param request
	 * @return
	 */
	@Frequency(name="updateMyPassword", limit=100, time=60)
	@RequestMapping("/updateMyPassword")
	public String updateMyPassword(@RequestParam(value = "uid1") String uid1,
			@RequestParam(value = "password") String password, HttpServletRequest request) {
		log.info("updateMyPassword begin ...");
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("uid", uid1);
			param.put("password", password);
			
			int code = studentService.updateStudent(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "account";
	}
	/**
	 * 检查用户电话是否存在
	 * @param uid
	 * 
	 * @param request
	 * @return
	 */
	@Frequency(name="checkUid", limit=100, time=60)
	@RequestMapping("/checkUid")
	@ResponseBody
	public JSONObject checkUid(@RequestParam(value = "uid") String uid,
			 HttpServletRequest request) {
		log.info("checkUid begin ...");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("uid", uid);
			
			List<Student> list = studentService.getStudent(param);
			obj.put("code", 200);
			obj.put("List", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
		
	}
	/**
	 * 检查老师工号是否存在
	 * @param tid
	 * 
	 * @param request
	 * @return
	 */
	@Frequency(name="checkTid", limit=100, time=60)
	@RequestMapping("/checkTid")
	@ResponseBody
	public JSONObject checkTid(@RequestParam(value = "tid") String tid,
			 HttpServletRequest request) {
		log.info("checkTid begin ...");
		Map<String, Object> param = new HashMap<String, Object>();
		JSONObject obj = new JSONObject();
		param.put("tid", tid);
		try {
			
			List<Teacher> list = teacherService.getTeacher(param);
			obj.put("code", 200);
			obj.put("List", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
		
	}
	
	
	/**************************shiro******************************/
	@RequestMapping("/dologin.do") //url  
	public String dologin(Student user, Model model){  
	    String info = loginUser(user);  
	    if (!"SUCC".equals(info)) {  
	        model.addAttribute("failMsg", "用户不存在或密码错误！");  
	        return "/jsp/fail";  
	    }else{  
	        model.addAttribute("successMsg", "登陆成功！");//返回到页面说夹带的参数  
	        model.addAttribute("name", user.getUid());  
	        return "/jsp/success";//返回的页面  
	    }  
	  }  
	  
	@RequestMapping("/logout.do")  
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException{  
	    Subject subject = SecurityUtils.getSubject();  
	    if (subject != null) {  
	        try{  
	            subject.logout();  
	        }catch(Exception ex){  
	        }  
	    }  
	    response.sendRedirect("login.jsp");  
	}  
	  
	private String loginUser(Student user) {  
	        if (isRelogin(user)) return "SUCC"; // 如果已经登陆，无需重新登录  
	          
	        return shiroLogin(user); // 调用shiro的登陆验证  
	}  
	private String shiroLogin(Student user) {  
	        // 组装token，包括客户公司名称、简称、客户编号、用户名称；密码  
	    UsernamePasswordToken token = new UsernamePasswordToken(user.getUid(), user.getPassword().toCharArray(), null);   
//	    token.setRememberMe(true);  
	      
	    // shiro登陆验证  
	    try {  
	        SecurityUtils.getSubject().login(token);  
	    } catch (UnknownAccountException ex) {  
	        return "用户不存在或者密码错误！";  
	    } catch (IncorrectCredentialsException ex) {  
	        return "用户不存在或者密码错误！";  
	    } catch (AuthenticationException ex) {  
	        return ex.getMessage(); // 自定义报错信息  
	    } catch (Exception ex) {  
	        ex.printStackTrace();  
	        return "内部错误，请重试！";  
	    }  
	    return "SUCC";  
	}  
	  
	private boolean isRelogin(Student user) {  
	    Subject us = SecurityUtils.getSubject();
	        if (us.isAuthenticated()) {  
	           return true; // 参数未改变，无需重新登录，默认为已经登录成功  
	        }  
	        return false; // 需要重新登陆  
	}
}
