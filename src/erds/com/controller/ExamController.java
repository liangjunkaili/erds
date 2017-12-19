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

import erds.com.bean.Answer;
import erds.com.bean.Evaluation;
import erds.com.bean.Exam;
import erds.com.service.IExamService;
import erds.com.service.IPracticeService;
import erds.com.util.MD5Util;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class ExamController {
	private static Logger log = LoggerFactory.getLogger(StudentController.class);
	@Autowired
	private IExamService examService;
	@Autowired
	private IPracticeService practiceService;
	@Frequency(name="queryExam", limit=100, time=60)
	@RequestMapping("/queryExam")
	@ResponseBody
	private JSONObject queryExam(HttpServletRequest request){
		log.info("queryExam begin ...");
		JSONObject obj = new JSONObject();
		try {
			String grade = request.getParameter("grade");
			String subject = request.getParameter("subject");
			String difficulty = request.getParameter("difficulty");
			String questions = request.getParameter("questions");
			String knowledgePoint = request.getParameter("knowledgePoint");
			Map<String,Object> param = new HashMap<>();
			param.put("grade", grade);
			param.put("subject", subject);
			param.put("difficulty", difficulty);
			param.put("questions", questions);
			param.put("knowledgePoint", knowledgePoint);
			List<Exam> list = examService.queryExam(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	@Frequency(name="queryEvaluation", limit=100, time=60)
	@RequestMapping("/queryEvaluation")
	@ResponseBody
	private JSONObject queryEvaluation(HttpServletRequest request){
		log.info("queryEvaluation begin ...");
		JSONObject obj = new JSONObject();
		try {
			Map<String,Object> param = new HashMap<>();
			List<Evaluation> list = examService.queryEvaluation(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	@Frequency(name="saveExam", limit=100, time=60)
	@RequestMapping("/saveExam")
	private String saveExam(HttpServletRequest request){
		log.info("saveExam begin ...");
		try {
			String title = request.getParameter("title");
			String optiona = request.getParameter("optiona");
			String optionb = request.getParameter("optionb");
			String optionc = request.getParameter("optionc");
			String optiond = request.getParameter("optiond");
			String answer = request.getParameter("answer");
			String grade = request.getParameter("grade");
			String subject = request.getParameter("subject");
			String difficulty = request.getParameter("difficulty");
			String questions = request.getParameter("questions");
			String knowledgePoint = request.getParameter("knowledgePoint");
			Map<String,Object> param = new HashMap<>();
			param.put("title", title);
			param.put("optiona", optiona);
			param.put("optionb", optionb);
			param.put("optionc", optionc);
			param.put("optiond", optiond);
			param.put("answer", answer);
			param.put("grade", grade);
			param.put("subject", subject);
			param.put("difficulty", difficulty);
			param.put("questions", questions);
			param.put("knowledgePoint", knowledgePoint);
			int code = examService.saveExam(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addExam";
	}
	
	@Frequency(name="saveAnswer", limit=100, time=60)
	@RequestMapping("/saveAnswer")
	@ResponseBody
	private JSONObject saveAnswer(HttpServletRequest request){
		log.info("saveAnswer begin ...");
		JSONObject obj = new JSONObject();
		try {
			String uid = request.getParameter("uid");
			String option = request.getParameter("option");
			Map<String,Object> param = new HashMap<>();
			param.put("uid", uid);
			param.put("option", option);
			int code = examService.saveAnswer(param);
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
	@Frequency(name="queryAnswer", limit=100, time=60)
	@RequestMapping("/queryAnswer")
	@ResponseBody
	private JSONObject queryAnswer(HttpServletRequest request){
		log.info("queryAnswer begin ...");
		JSONObject obj = new JSONObject();
		try {
			Map<String,Object> param = new HashMap<>();
			List<Answer> list = examService.queryAnswer(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 *提交考试结果
	 * @param request
	 * @return
	 */
	@Frequency(name="savePractices", limit=100, time=60)
	@RequestMapping("/savePractices")
	@ResponseBody
	private JSONObject savePractices(HttpServletRequest request){
		log.info("savePractices begin ...");
		JSONObject obj = new JSONObject();
		try {
			String uid = request.getParameter("uid");
			String judges = request.getParameter("judge");
			String answers = request.getParameter("answer");
			String sids = request.getParameter("sids");
			String[] judgeArr = judges.split(",");
			String[] answerArr = answers.split("~");
			String[] sidArr = sids.split("~");
			Map<String,Object> param = new HashMap<>();
			param.put("uid", uid);
			for(int i=0;i<sidArr.length;i++){
				param.put("id", MD5Util.getUUID());
				param.put("judge", judgeArr[i]);
				param.put("answer", answerArr[i]);
				param.put("sid", sidArr[i]);
				int code = practiceService.savePractice(param);
				if(code!=1){
					obj.put("code", 100);
					return obj;
				}
			}
			obj.put("code", 200);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 *提交错题原因
	 * @param request
	 * @return
	 */
	@Frequency(name="updatePractices", limit=100, time=60)
	@RequestMapping("/updatePractices")
	@ResponseBody
	private JSONObject updatePractices(HttpServletRequest request){
		log.info("updatePractices begin ...");
		JSONObject obj = new JSONObject();
		try {
			String id = request.getParameter("id");
			String reason = request.getParameter("reason");
			Map<String,Object> param = new HashMap<>();
			param.put("id", id);
			param.put("reason", reason);
			int code = practiceService.updatePractice(param);
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
}
