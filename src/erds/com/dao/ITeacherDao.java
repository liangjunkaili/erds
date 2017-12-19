package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Manager;
import erds.com.bean.Parent;
import erds.com.bean.Student;
import erds.com.bean.Teacher;

public interface ITeacherDao {

	public int addTeacher(Map<String,Object> param);
	
	public List<Teacher> getTeacherList(Map<String, Object> param);

	public Teacher findTeacherById(Map<String, Object> param);
	
	public Manager findManager(Map<String, Object> param);
	
	public int updateTeacher(Map<String,Object> param);
	
	public List<Teacher> getTeacher(Map<String,Object> param);
	
	//家长的登录和注册
	public int saveParent(Map<String,Object> param);
	public Parent queryParent(Map<String,Object> param);
	public int updateParent(Map<String,Object> param);
}
