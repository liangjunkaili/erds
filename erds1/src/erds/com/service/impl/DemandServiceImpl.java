package erds.com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Demand;
import erds.com.bean.Demandc3;
import erds.com.bean.Subject;
import erds.com.dao.IDemandDao;
import erds.com.dao.ISubjectDao;
import erds.com.service.IDemandService;
@Service("pdemandService")
public class DemandServiceImpl implements IDemandService {

	@Autowired
	private IDemandDao demandDao;
	@Autowired
	private ISubjectDao subjectDao;
	private Logger log = LoggerFactory.getLogger(DemandServiceImpl.class);

	@Override
	public int addDemand(Map<String, Object> param) {
		return demandDao.addDemand(param);
	}
	public int updateDemand(Map<String, Object> param) {
		return demandDao.updateDemand(param);
	}
	@Override
	public List<Demand> getDemand(Map<String, Object> param1) {
		List<Demand> list = new ArrayList<Demand>();
//		List<Demand> list1 = new ArrayList<Demand>();
		try {
			list = demandDao.getDemand(param1);
			Map<String, Object> param = new HashMap<String, Object>();
			for(Demand d:list){
				int did = d.getId();
				param.put("did", did);
				List<Subject> subList = subjectDao.querySubject(param );
				d.setState(subList.size());
				d.setTotalNum(d.getTotalNum()+d.getRelNum());
//				list1.add(d);
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return list;
	}

	@Override
	public Demand findDemandById(Map<String, Object> param) {
		Demand d = null;
		try {
			d = demandDao.findDemandById(param);
			d.setTotalNum(d.getTotalNum()+d.getRelNum());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return d;
	}

	@Override
	public List<Demand> getDemandsForTeacher(Map<String, Object> param) {
		List<Demand> list = null;
		try {
			list = demandDao.getDemandsForTeacher(param);
			for(Demand c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return list;
	}

	@Override
	public List<Demandc3> getDemandc3() {
		List<Demandc3> list = null;
		try {
			list = demandDao.demandc3List();
			for(Demandc3 c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return list;
	}

	@Override
	public List<Demandc3> getDemandc1() {
		List<Demandc3> list = null;
		try {
			list = demandDao.demandc1List();
			for(Demandc3 c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return list;
	}

	@Override
	public List<Demand> getCourseForMe(Map<String, Object> param) {
		List<Demand> list = null;
		try {
			list = demandDao.getDemandsForMe(param);
			for(Demand c :list){
				c.setTotalNum(c.getTotalNum()+c.getRelNum());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return list;
	}
	@Override
	public List<Demandc3> getDemandAll() {
		return demandDao.getDemandAll();
	}
	@Override
	public int delDemand(int id) {
		return demandDao.delDemand(id);
	}
	@Override
	public List<Demand> getIsCenter(Map<String, Object> param) {
		return demandDao.getIsCenter(param);
	}


}
