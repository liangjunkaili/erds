package erds.com.util;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import erds.com.bean.Course;
import erds.com.bean.PayRecord;
import erds.com.dao.ICourseDao;
import erds.com.dao.IPayRecord;


public class TimerUtil {

	@Autowired
	private ICourseDao courseDao;
	@Autowired
	private IPayRecord payRecord;
	private static Logger log = LoggerFactory.getLogger(TimerUtil.class);
	int hour = 4*60*60*1000;
	long l = new Date().getTime();
	protected void execute()  {  
		try {
			log.info("开始发短信了");
			Map<String, Object> param = new HashMap<>();
			List<Course> list = courseDao.getCourse(param);
			for(Course c:list){
				long begin = c.getBeginTime().getTime();
				if(begin-l<=hour&&begin-l>0){
					param.put("cid", c.getSeries());
					List<PayRecord> pays = payRecord.queryPayRecord(param);
					for(PayRecord pay:pays){
//						String code = MD5Util.sendSMS(pay.getSid(), "86", "五");
//						log.info("发送验证码为："+code);
						log.info("发送成功");
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
    } 
}
