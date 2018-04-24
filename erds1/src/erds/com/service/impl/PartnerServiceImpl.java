package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Partners;
import erds.com.dao.IPartnerDao;
import erds.com.service.IPartnerService;
@Service("partnerService")
public class PartnerServiceImpl implements IPartnerService {

	@Autowired
	private IPartnerDao partnerDao;

	@Override
	public int addPartner(Map<String, Object> param) {
		return partnerDao.addPartner(param);
	}

	@Override
	public List<Partners> queryPartner(Map<String, Object> param) {
		return partnerDao.queryPartner(param);
	}

	@Override
	public List<Partners> getPartners() {
		return partnerDao.getPartners();
	}

}
