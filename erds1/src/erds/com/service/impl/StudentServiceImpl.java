package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Student;
import erds.com.dao.IStudentDao;
import erds.com.service.IStudentService;
@Service("studentService")
public class StudentServiceImpl implements IStudentService {

	@Autowired
	private IStudentDao studentDao;
	@Override
	public List<Student> getStudent(Map<String, Object> param) {
		
		return studentDao.getStudent(param);
	}

	@Override
	public int addStudent(Map<String, Object> param) {
		
		return studentDao.addStudent(param);
	}

	@Override
	public int updateStudent(Map<String, Object> param) {
		
		return studentDao.updateStudent(param);
	}

	@Override
	public Student queryStudent(Map<String, Object> param) {
		return studentDao.queryStudent(param);
	}

}
