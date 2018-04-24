package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Information;

public interface IInformationDao {

	List<Information> queryInformations();
	public int addInformation(Map<String,Object> param);
}
