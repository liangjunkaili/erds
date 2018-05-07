package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Practice;
import erds.com.dao.IPracticeDao;
import erds.com.service.IPracticeService;
@Service("practiceService")
public class PracticeServiceImpl implements IPracticeService{

	@Autowired
	private IPracticeDao practiceDao;
	@Override
	public int savePractice(Map<String, Object> param) {
		return practiceDao.savePractice(param);
	}

	@Override
	public int updatePractice(Map<String, Object> param) {
		return practiceDao.updatePractice(param);
	}

	@Override
	public List<Practice> queryPractice(Map<String, Object> param) {
		return practiceDao.queryPractice(param);
	}

}
