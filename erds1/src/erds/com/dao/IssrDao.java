package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.StudentStudyRecord;

public interface IssrDao {

	public int saveSSRecord(Map<String,Object> param);
	/**
	 * 分页 一周之内 当前学生 
	 * @param param
	 * @return
	 */
	public List<StudentStudyRecord> querySSRecord(Map<String,Object> param);
}
