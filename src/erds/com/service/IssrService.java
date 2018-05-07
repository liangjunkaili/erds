package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.StudentStudyRecord;

public interface IssrService {

	public int saveSSRecord(Map<String,Object> param);
	/**
	 * 分页 一周之内 当前学生 
	 * @param param
	 * @return
	 */
	public List<StudentStudyRecord> querySSRecord(Map<String,Object> param);
}
