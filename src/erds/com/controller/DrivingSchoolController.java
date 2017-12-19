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

import erds.com.bean.DriveCourse;
import erds.com.bean.DriveRecord;
import erds.com.bean.DrivingSchool;
import erds.com.service.IDrivingSchoolService;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class DrivingSchoolController {

	@Autowired
	private IDrivingSchoolService drivingSchoolService;
	private static Logger log = LoggerFactory.getLogger(DrivingSchoolController.class);
	@Frequency(name="getVideoList", limit=100, time=60)
	@RequestMapping("getVideoList")
	@ResponseBody
	public JSONObject getVideoList(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String courseId = request.getParameter("courseId");
			String uid = request.getParameter("uid");
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("uid", uid);
			List<DriveRecord> drList = drivingSchoolService.queryDR(param);
			param.put("course", courseId);
			List<DrivingSchool> list = drivingSchoolService.queryDS(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
			obj.put("driveRecord", drList.get(0));
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	@Frequency(name="getVideoCourse", limit=100, time=60)
	@RequestMapping("getVideoCourse")
	@ResponseBody
	public JSONObject getVideoCourse(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String uid = request.getParameter("uid");
			Map<String,Object> param = new HashMap<String,Object>();
			List<DriveCourse> list = drivingSchoolService.queryDC(param);
			param.put("uid", uid);
//			param.put("courseId", 1001);
			List<DriveRecord> drList = drivingSchoolService.queryDR(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
			obj.put("driveRecord", drList.get(0));
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 退出视频时更新视频的观看进度
	 * @param request
	 * @return
	 */
	@Frequency(name="updateVideoProgress", limit=100, time=60)
	@RequestMapping("updateVideoProgress")
	@ResponseBody
	public JSONObject updateVideoProgress(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String drId = request.getParameter("drId");
			String dsId = request.getParameter("dsId");
			String courseid = request.getParameter("courseId");
			String duration = request.getParameter("duration");
			String actualtime = request.getParameter("actualtime");
			String currentTime = request.getParameter("currentTime");
			List<Integer> is = drivingSchoolService.queryDSId(courseid);
			Map<String,Object> param = new HashMap<String,Object>();
			List<DriveCourse> dcs = drivingSchoolService.queryDC(param);
			param.put("currentTime", currentTime);
			param.put("drId", drId);
			param.put("dsId", dsId);
			param.put("actualtime", actualtime);
			param.put("duration", duration);
			if(Double.parseDouble(currentTime)+10>=Double.parseDouble(duration)){
				param.put("isend", 1);
				if(returnBig(is,dsId)){
					param.put("courseid", courseid);
					int i = getIndex1(is,dsId);
					param.put("classid", is.get(i+1));
				}else{
					int i = getIndex(dcs,courseid);
					param.put("courseid", dcs.get(i+1).getId());
					List<Integer> is1 = drivingSchoolService.queryDSId(dcs.get(i+1).getId()+"");
					param.put("classid", is1.get(0));
				}
			}else{
				param.put("isend", 2);
				param.put("courseid", courseid);
				param.put("classid", dsId);
			}
			int code = drivingSchoolService.updateDR(param);
			int code1 = drivingSchoolService.updateDS(param);
			if(code==1&&code1==1){
				obj.put("code", 200);
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	
	public static int getIndex(List<DriveCourse> dcs,String courseid){
		int j=0;
		for(int i=0;i<dcs.size();i++){
			if(dcs.get(i).getId()==Integer.parseInt(courseid)){
				j=i;
			}
		}
		return j;
	}
	public static int getIndex1(List<Integer> dcs,String courseid){
		int j=0;
		for(int i=0;i<dcs.size();i++){
			if(dcs.get(i)==Integer.parseInt(courseid)){
				j=i;
			}
		}
		return j;
	}
	public static boolean returnBig(List<Integer> is,String classId){
		for(Integer i :is){
			if(i>Integer.parseInt(classId)){
				return true;
			}
		}
		return false;
	}
}
