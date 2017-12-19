package erds.com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.dao.IIPDao;
import erds.com.service.IIPService;
@Service("ipService")
public class IpServiceImpl implements IIPService{

	@Autowired
	private IIPDao ipDao;
	@Override
	public List<String> queryIps() {
		return ipDao.queryIps();
	}

}
