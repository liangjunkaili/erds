package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.OfflineRecord;

public interface IOfflineRecordDao {

	public int addOfflineRecord(Map<String,Object> param);
	public List<OfflineRecord> queryOfflineRecord(Map<String,Object> param);
}
