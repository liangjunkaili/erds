package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Rollimg;

public interface IRollingService {

	public int addRollimg(Map<String, Object> param);

	public List<Rollimg> queryRollimg(Map<String, Object> param);

	public int updateRollimg(Map<String, Object> param);
	
	public int delRoll(Map<String, Object> param);

}
