package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Student;

public interface IStudentDao {

	public List<Student> getStudent(Map<String,Object> param);
	public Student queryStudent(Map<String,Object> param);
	
	public int addStudent(Map<String,Object> param);
	
	public int updateStudent(Map<String,Object> param);
}
