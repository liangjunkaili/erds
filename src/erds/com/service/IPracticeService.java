package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Practice;

public interface IPracticeService {

	public int savePractice(Map<String,Object> param);
	public int updatePractice(Map<String,Object> param);
	public List<Practice> queryPractice(Map<String,Object> param);
}
