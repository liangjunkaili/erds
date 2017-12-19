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

import erds.com.bean.Partners;
import erds.com.service.IPartnerService;
import erds.com.util.QiNiuUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class PartnerController {

	private static Logger log = LoggerFactory.getLogger(PartnerController.class);
	@Autowired
	private IPartnerService partnerService;
	/**
	 * 添加合作机构
	 */
	@Frequency(name="addPartner", limit=100, time=60)
	@RequestMapping(value = "/addPartner", method = RequestMethod.POST)
	private String addPartner(@RequestParam(value = "logo", required = false) MultipartFile[] file,@RequestParam(value="pName")String pName,
			@RequestParam(value="url")String uri,HttpServletRequest request) throws Exception {
		log.info("addPartner begin ...");
		try {
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("pName", pName);
			param.put("selfUrl", uri);
			long l = new Date().getTime();
			for (MultipartFile mf : file) {
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					param.put("logo", url);
					log.info(url);
					int code = partnerService.addPartner(param);
					if(code !=1){
						return "error";
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addPartner";
	}
	/**
	 * 合作机构列表
	 * @return
	 */
	@Frequency(name="queryPartner", limit=100, time=60)
	@RequestMapping("queryPartner")
	@ResponseBody
	public JSONObject queryPartner(){
		JSONObject obj = new JSONObject();
		try {
			List<Partners> list = partnerService.getPartners();
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return obj;
	}
}
