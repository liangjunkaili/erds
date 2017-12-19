package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Rollimg;
import erds.com.dao.IRollimgDao;
import erds.com.service.IRollingService;
@Service("rollingService")
public class RollingServiceImpl implements IRollingService {
	
	private static Logger log = LoggerFactory.getLogger(RollingServiceImpl.class);
	@Autowired
	private IRollimgDao rollimgDao;
	
	@Override
	public int addRollimg(Map<String, Object> param) {
		return rollimgDao.addRollimg(param);
	}

	@Override
	public List<Rollimg> queryRollimg(Map<String, Object> param) {
		return rollimgDao.queryRollimg(param);
	}

	@Override
	public int updateRollimg(Map<String, Object> param) {
		return rollimgDao.updateRollimg(param);
	}

	@Override
	public int delRoll(Map<String, Object> param) {
		return rollimgDao.delRoll(param);
	}

}
