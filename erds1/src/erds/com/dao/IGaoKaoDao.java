package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Gaokao1;
import erds.com.bean.Gaokao2;

public interface IGaoKaoDao {

	public List<Gaokao1> queryGk1(Map<String,Object> param);
	public List<Gaokao2> queryGk2(Map<String,Object> param);
}
