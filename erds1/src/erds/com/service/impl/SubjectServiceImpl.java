package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Subject;
import erds.com.dao.ISubjectDao;
import erds.com.service.ISubjectService;
@Service("subjectService")
public class SubjectServiceImpl implements ISubjectService {
	
	private static Logger log = LoggerFactory.getLogger(SubjectServiceImpl.class);
	@Autowired
	private ISubjectDao subjectDao;
	@Override
	public int addSubject(Map<String, Object> param) {
		return subjectDao.addSubject(param);
	}
	@Override
	public List<Subject> querySubject(Map<String, Object> param) {
		return subjectDao.querySubject(param);
	}
	@Override
	public int delSubject(int id) {
		return subjectDao.delSubject(id);
	}
	
}
