package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Manager;
import erds.com.bean.Parent;
import erds.com.bean.Teacher;
import erds.com.dao.ITeacherDao;
import erds.com.service.ITeacherService;
@Service("tearchService")
public class TearchServiceImpl implements ITeacherService {

	@Autowired
	private ITeacherDao teacherDao;
	@Override
	public int addTeacher(Map<String, Object> param) {
		return teacherDao.addTeacher(param);
	}

	@Override
	public List<Teacher> getTeacherList(Map<String, Object> param) {
		return teacherDao.getTeacherList(param);
	}

	@Override
	public Teacher findTeacherById(Map<String, Object> param) {
		return teacherDao.findTeacherById(param);
	}

	@Override
	public Manager findManager(Map<String, Object> param) {
		return teacherDao.findManager(param);
	}

	@Override
	public int updateTeacher(Map<String, Object> param) {
		return teacherDao.updateTeacher(param);
	}

	@Override
	public List<Teacher> getTeacher(Map<String, Object> param) {
		return teacherDao.getTeacher(param);
	}

	@Override
	public int saveParent(Map<String, Object> param) {
		return teacherDao.saveParent(param);
	}

	@Override
	public Parent queryParent(Map<String, Object> param) {
		return teacherDao.queryParent(param);
	}

	@Override
	public int updateParent(Map<String, Object> param) {
		return teacherDao.updateParent(param);
	}


}
