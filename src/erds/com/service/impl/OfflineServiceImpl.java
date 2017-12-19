package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Offline;
import erds.com.dao.IOfflineDao;
import erds.com.service.IOfflineService;
@Service("offlineService")
public class OfflineServiceImpl implements IOfflineService{

	@Autowired
	private IOfflineDao offlineDao;
	@Override
	public int addOffline(Map<String, Object> param) {
		return offlineDao.addOffline(param);
	}

	@Override
	public List<Offline> queryOfflines(Map<String, Object> param) {
		return offlineDao.queryOfflines(param);
	}

	@Override
	public int delOffline(String id) {
		return offlineDao.delOffline(id);
	}

}
