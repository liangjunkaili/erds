package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.OfflineRecord;
import erds.com.dao.IOfflineRecordDao;
import erds.com.service.IOfflineRecordService;
@Service("offlineRecordService")
public class OfflineRecordServiceImpl implements IOfflineRecordService{

	@Autowired
	private IOfflineRecordDao offlineRecordDao;
	@Override
	public int addOfflineRecord(Map<String, Object> param) {
		return offlineRecordDao.addOfflineRecord(param);
	}

	@Override
	public List<OfflineRecord> queryOfflineRecord(Map<String, Object> param) {
		return offlineRecordDao.queryOfflineRecord(param);
	}

}
