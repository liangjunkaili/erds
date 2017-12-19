package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.DriveCourse;
import erds.com.bean.DriveRecord;
import erds.com.bean.DrivingSchool;
import erds.com.dao.IDrivingSchoolDao;
import erds.com.service.IDrivingSchoolService;
@Service("drivingSchoolService")
public class DrivingSchoolServiceImpl implements IDrivingSchoolService{

	@Autowired
	private IDrivingSchoolDao drivingSchoolDao;
	@Override
	public List<DrivingSchool> queryDS(Map<String, Object> param) {
		return drivingSchoolDao.queryDS(param);
	}
	@Override
	public List<DriveCourse> queryDC(Map<String, Object> param) {
		return drivingSchoolDao.queryDC(param);
	}
	@Override
	public List<DriveRecord> queryDR(Map<String, Object> param) {
		return drivingSchoolDao.queryDR(param);
	}
	@Override
	public int updateDS(Map<String, Object> param) {
		return drivingSchoolDao.updateDS(param);
	}
	@Override
	public int updateDR(Map<String, Object> param) {
		return drivingSchoolDao.updateDR(param);
	}
	@Override
	public List<Integer> queryDSId(String courseId) {
		return drivingSchoolDao.queryDSId(courseId);
	}

}
