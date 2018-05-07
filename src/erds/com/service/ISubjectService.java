package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Subject;

public interface ISubjectService {

	public int addSubject(Map<String,Object> param);
	
	public List<Subject> querySubject(Map<String,Object> param);
	public int delSubject(int id);
}
