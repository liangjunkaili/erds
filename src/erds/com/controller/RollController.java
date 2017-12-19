package erds.com.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import erds.com.bean.Rollimg;
import erds.com.service.IRollingService;
import erds.com.util.QiNiuUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class RollController {

	@Autowired
	private IRollingService rollingService;
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	private static Logger log = LoggerFactory.getLogger(RollController.class);
	@RequestMapping("redisDemo")
	@ResponseBody
	public JSONObject redisDemo(){
		JSONObject obj = new JSONObject();
		try {
			ValueOperations<String, Object> value = redisTemplate.opsForValue();
//			value.set("liangjun", "likaili");
			System.out.println(value.get("liangjun"));
			HashOperations<String, Object, Object>  hash = redisTemplate.opsForHash();
			hash.put("hash", "hash".hashCode(), "hash");
			obj.put("code", 200);
		} catch (Exception e) {
		}
		return obj;
	}
	/**
	 * 更新轮播图的优先级
	 * @param request
	 * @return
	 */
	@Frequency(name="upRoll", limit=100, time=60)
	@RequestMapping("upRoll")
	@ResponseBody
	public JSONObject upRoll(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			String rid1 = request.getParameter("id1");
			String cid1 = request.getParameter("cid1");
			String rid2 = request.getParameter("id2");
			String cid2 = request.getParameter("cid2");
			String rid3 = request.getParameter("id3");
			String cid3 = request.getParameter("cid3");
			String rid4 = request.getParameter("id4");
			String cid4 = request.getParameter("cid4");
			String rid5 = request.getParameter("id5");
			String cid5 = request.getParameter("cid5");
			Map<String,Object> param = new HashMap<>();
			param.put("id", rid1);
			param.put("cid", cid1);
			int code1 = rollingService.updateRollimg(param);
			param.put("id", rid2);
			param.put("cid", cid2);
			int code2 = rollingService.updateRollimg(param);
			param.put("id", rid3);
			param.put("cid", cid3);
			int code3 = rollingService.updateRollimg(param);
			param.put("id", rid4);
			param.put("cid", cid4);
			int code4 = rollingService.updateRollimg(param);
			param.put("id", rid5);
			param.put("cid", cid5);
			int code5 = rollingService.updateRollimg(param);
			if(code1!=1||code2!=1||code3!=1||code4!=1||code5!=1){
				obj.put("code", 100);
				return obj;
			}
			obj.put("code", 200);
		} catch (Exception e) {
		}
		return obj;
	}
	
	/**
	 * 所有的轮播图 
	 * @return
	 */
	@Frequency(name="allRolling", limit=100, time=60)
	@RequestMapping("/allRolling")
	@ResponseBody
	public JSONObject allRolling(HttpServletRequest request){
		log.info("allRolling  begin ...");
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<String,Object>();
			List<Rollimg> list = rollingService.queryRollimg(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
	/**
	 * 删除轮播图 id
	 * @return
	 */
	@Frequency(name="delRolling", limit=100, time=60)
	@RequestMapping("/delRolling")
	public String delRolling(HttpServletRequest request){
		log.info("delRolling  begin ...");
		String id = request.getParameter("id");
		try {
			Map<String, Object> param = new HashMap<String,Object>();
			param.put("id", id);
			int code = rollingService.delRoll(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-rollingList";
	}
	/**
	 * 添加滚动宣传图
	 * @return
	 */
	@Frequency(name="addRoll", limit=100, time=60)
	@RequestMapping(value = "/addRoll", method = RequestMethod.POST)
	private String fildUpload2(@RequestParam(value = "cover", required = false) MultipartFile[] file,@RequestParam(value="type")String type,HttpServletRequest request) throws Exception {
		try {
			
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("href", type);
			long l = new Date().getTime();
			for (MultipartFile mf : file) {
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					param.put("coverImg", url);
					log.info(url);
					int code = rollingService.addRollimg(param);
					if(code!=1){
						return "error";
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addRoll";
	}
}
