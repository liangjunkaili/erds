package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Demand;
import erds.com.bean.Demandc3;

public interface IDemandService {

	public int addDemand(Map<String,Object> param);

	public List<Demand> getDemand(Map<String, Object> param);

	public Demand findDemandById(Map<String, Object> param);

	public List<Demand> getDemandsForTeacher(Map<String, Object> param);
	public int updateDemand(Map<String,Object> param);
	public List<Demandc3> getDemandc3();

	public List<Demandc3> getDemandc1();

	public List<Demand> getCourseForMe(Map<String, Object> param);
	public int delDemand(int id);
	public List<Demandc3> getDemandAll();
	public List<Demand> getIsCenter(Map<String, Object> param);
}
