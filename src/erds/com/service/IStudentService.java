package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Student;

public interface IStudentService {

	public List<Student> getStudent(Map<String,Object> param);
	
	public int addStudent(Map<String,Object> param);
	
	public int updateStudent(Map<String,Object> param);
	
	public Student queryStudent(Map<String,Object> param);
}
