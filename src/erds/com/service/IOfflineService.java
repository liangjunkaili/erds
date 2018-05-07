package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Offline;

public interface IOfflineService {

	public int addOffline(Map<String,Object> param);
	public List<Offline> queryOfflines(Map<String,Object> param);
	public int delOffline(String id);
}
