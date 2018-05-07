package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Partners;

public interface IPartnerDao {

	public int addPartner(Map<String,Object> param);
	
	public List<Partners> queryPartner(Map<String,Object> param);

	public List<Partners> getPartners();
}
