package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Professor;
import erds.com.dao.ProfessorDao;
import erds.com.service.ProfessorService;
@Service("professorService")
public class ProfessorServiceImpl implements ProfessorService {

	@Autowired
	private ProfessorDao professorDao;
	@Override
	public int saveProfessor(Map<String, Object> param) {
		return professorDao.saveProfessor(param);
	}
	@Override
	public List<Professor> queryProfessor(Map<String, Object> param) {
		return professorDao.queryProfessor(param);
	}

}
