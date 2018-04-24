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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import erds.com.bean.Exam;
import erds.com.bean.Subject;
import erds.com.service.IExamService;
import erds.com.service.ISubjectService;
import erds.com.util.QiNiuUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class SubjectController {
	private static Logger log = LoggerFactory.getLogger(StudentController.class);
	@Autowired
	private ISubjectService subjectService;
	@Autowired
	private IExamService examService;
	/**
	 * 
	 * @param request
	 * @return
	 */
	@Frequency(name="addSubject", limit=100, time=60)
	@RequestMapping("/addSubject")
	public String addSubject(@RequestParam(value = "video", required = false) String file,@RequestParam(value="title1")String title1,
			@RequestParam(value="title")String title,@RequestParam(value="free")String free,@RequestParam(value="did")String did,HttpServletRequest request) {
		log.info("addSubject begin ...");
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("did", did);
			param.put("videourl", file);
			param.put("title",title);
			param.put("free", free);
			int code = subjectService.addSubject(param);
			if(code !=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addSubject";
	}
	/**
	 * 
	 * @param request
	 * @return did
	 */
	@Frequency(name="getSubject", limit=100, time=60)
	@RequestMapping("/getSubject")
	@ResponseBody
	private JSONObject getSubject(HttpServletRequest request){
		log.info("getSubject begin ...");
		JSONObject obj = new JSONObject();
		try {
			
			String did = request.getParameter("did");
			Map<String,Object> param = new HashMap<>();
			param.put("did", did);
			List<Subject> list = subjectService.querySubject(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}

	@Frequency(name="delSubject", limit=100, time=60)
	@RequestMapping("delSubject")
	public String delSubject(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			int code = subjectService.delSubject(Integer.parseInt(id));
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
		}
		return "manager-SubjectList";
	}
	@Frequency(name="uploadToken", limit=100, time=60)  
	@RequestMapping("uploadToken")
	@ResponseBody
	public JSONObject uploadToken(){
		JSONObject obj = new JSONObject();
		String token="";
		try {
			token = QiNiuUtil.getUpToken();
			obj.put("uptoken", token);
		} catch (Exception e) {
		}
		return obj;
	}
}
