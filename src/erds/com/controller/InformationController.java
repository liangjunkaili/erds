package erds.com.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import erds.com.service.IInformationService;
import erds.com.util.QiNiuUtil;

@Controller
@RequestMapping("/")
public class InformationController {

	@Autowired
	private IInformationService informationService;
	private static Logger log = LoggerFactory.getLogger(InformationController.class);
	/**
	 * 添加滚动宣传图
	 * @return
	 */
	@Frequency(name="addInformation", limit=100, time=60)
	@RequestMapping(value = "/addInformation", method = RequestMethod.POST)
	public String addInformation(@RequestParam(value = "cover", required = false) MultipartFile[] file,@RequestParam(value="href")String href,@RequestParam(value="title")String title,HttpServletRequest request) throws Exception {
		try {
			
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("href", href);
			param.put("title", title);
			long l = new Date().getTime();
			for (MultipartFile mf : file) {
				if (!mf.isEmpty()) {
					QiNiuUtil.Simple_upload_byte(mf.getBytes(),  l+mf.getOriginalFilename());
					String url  = QiNiuUtil.BASE_URL+"/"+l+mf.getOriginalFilename();
					param.put("img", url);
					log.info(url);
					int code = informationService.addInformation(param);
					if(code!=1){
						return "error";
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return "manager-addInformation";
	}
}
