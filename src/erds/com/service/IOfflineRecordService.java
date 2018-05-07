package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.OfflineRecord;

public interface IOfflineRecordService {

	public int addOfflineRecord(Map<String,Object> param);
	public List<OfflineRecord> queryOfflineRecord(Map<String,Object> param);
}
