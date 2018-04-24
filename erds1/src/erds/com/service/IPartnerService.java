package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Partners;

public interface IPartnerService {

	public int addPartner(Map<String,Object> param);
	
	public List<Partners> queryPartner(Map<String,Object> param);

	public List<Partners> getPartners();
}
