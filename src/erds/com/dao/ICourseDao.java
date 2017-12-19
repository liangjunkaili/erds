package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Course;

public interface ICourseDao {

	public List<Course> getCourse(Map<String,Object> param);
	public List<Course> getCourseList(Map<String,Object> param);
	
	public List<Course> getCourseForMe(Map<String,Object> param);
	
	public int addCourse(Map<String,Object> param);
	
	public int updateCourse(Map<String,Object> param);

	public Course findCourseById(Map<String, Object> param);

	public List<Course> getCourseAll(Map<String, Object> param);

	public List<Course> getCoursesForTeacher(Map<String, Object> param);
	public List<Course> manGetCourseAll();
	
	public int delCourse(int id);
}
