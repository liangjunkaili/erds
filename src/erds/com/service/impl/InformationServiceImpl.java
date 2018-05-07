package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Information;
import erds.com.dao.IInformationDao;
import erds.com.service.IInformationService;
@Service("informationService")
public class InformationServiceImpl implements IInformationService{

	@Autowired
	private IInformationDao informationDao;
	@Override
	public List<Information> queryInformations() {
		return informationDao.queryInformations();
	}
	@Override
	public int addInformation(Map<String, Object> param) {
		return informationDao.addInformation(param);
	}

}
