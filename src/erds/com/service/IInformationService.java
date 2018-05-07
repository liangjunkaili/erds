package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Information;

public interface IInformationService {

	List<Information> queryInformations();
	public int addInformation(Map<String,Object> param);
}
