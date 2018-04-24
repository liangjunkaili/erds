package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.DriveCourse;
import erds.com.bean.DriveRecord;
import erds.com.bean.DrivingSchool;

public interface IDrivingSchoolService {

	public List<DrivingSchool> queryDS(Map<String,Object> param);
	
	public List<DriveCourse> queryDC(Map<String,Object> param);
	
	public List<DriveRecord> queryDR(Map<String,Object> param);
	
	public int updateDS(Map<String,Object> param);
	
	public int updateDR(Map<String,Object> param);
	
	public List<Integer> queryDSId(String courseId);
}
