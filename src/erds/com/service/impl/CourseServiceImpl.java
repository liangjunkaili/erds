package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Course;
import erds.com.dao.ICourseDao;
import erds.com.service.ICourseService;
@Service("courseService")
public class CourseServiceImpl implements ICourseService {

	@Autowired
	private ICourseDao courseDao;
	@Override
	public List<Course> getCourse(Map<String, Object> param) {
		List<Course> list = null;
		try {
			list = courseDao.getCourseList(param);
			for(Course c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int addCourse(Map<String, Object> param) {
		return courseDao.addCourse(param);
	}

	@Override
	public int updateCourse(Map<String, Object> param) {
		return courseDao.updateCourse(param);
	}

	@Override
	public List<Course> getCourseForMe(Map<String, Object> param) {
		List<Course> list = null;
		try {
			list = courseDao.getCourseForMe(param);
			for(Course c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public Course findCoursesById(Map<String, Object> param) {
		Course c=null;
		try {
			c = courseDao.findCourseById(param);
			c.setTotalNum(c.getTotalNum()+c.getRelNum());
		} catch (Exception e) {
		}
		return c;
	}

	@Override
	public List<Course> getCourseAll(Map<String, Object> param) {
		List<Course> list = null;
		try {
			list = courseDao.getCourseAll(param);
			for(Course c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Course> getCoursesForTeacher(Map<String, Object> param) {
		List<Course> list = null;
		try {
			list = courseDao.getCoursesForTeacher(param);
			for(Course c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Course> getCourseList(Map<String, Object> param) {
		List<Course> list = null;
		try {
			list = courseDao.getCourseList(param);
			for(Course c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Course> manGetCourseAll() {
		List<Course> list = null;
		try {
			list = courseDao.manGetCourseAll();
			for(Course c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int delCourse(int id) {
		return courseDao.delCourse(id);
	}


	

}
