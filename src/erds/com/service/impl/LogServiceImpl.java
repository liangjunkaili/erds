package erds.com.service.impl;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.dao.ILogDao;
import erds.com.service.ILogService;
@Service("logService")
public class LogServiceImpl implements ILogService {
	
	private static Logger log = LoggerFactory.getLogger(LogServiceImpl.class);
	@Autowired
	private ILogDao logDao;
	@Override
	public int addLog(Map<String, Object> param) {
		log.info("addLog ...");
		return logDao.addLog(param);
	}
	
}
