package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Demand;
import erds.com.bean.Demandc3;

public interface IDemandDao {

	public int addDemand(Map<String,Object> param);

	public List<Demand> getDemand(Map<String, Object> param);

	public Demand findDemandById(Map<String, Object> param);
	public int updateDemand(Map<String,Object> param);
	public List<Demand> getDemandsForTeacher(Map<String, Object> param);

	public List<Demandc3> demandc3List();

	public List<Demandc3> demandc1List();

	public List<Demand> getDemandsForMe(Map<String, Object> param);

	public List<Demandc3> getDemandAll();
	
	public int delDemand(int id);
	//报班中心
	public List<Demand> getIsCenter(Map<String, Object> param);
}
