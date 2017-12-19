package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Rollimg;

public interface IRollimgDao {

	public int addRollimg(Map<String, Object> param);

	public List<Rollimg> queryRollimg(Map<String, Object> param);

	public int updateRollimg(Map<String, Object> param);
	
	public int delRoll(Map<String, Object> param);

}
