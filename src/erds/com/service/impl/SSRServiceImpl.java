package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.StudentStudyRecord;
import erds.com.dao.IssrDao;
import erds.com.service.IssrService;
@Service("ssrService")
public class SSRServiceImpl implements IssrService {

	@Autowired
	private IssrDao ssrDao;
	@Override
	public int saveSSRecord(Map<String, Object> param) {
		return ssrDao.saveSSRecord(param);
	}

	@Override
	public List<StudentStudyRecord> querySSRecord(Map<String, Object> param) {
		return ssrDao.querySSRecord(param);
	}

}
