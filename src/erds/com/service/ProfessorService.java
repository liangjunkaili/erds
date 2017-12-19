package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Professor;

public interface ProfessorService {

	public int saveProfessor(Map<String,Object> param);
	public List<Professor> queryProfessor(Map<String,Object> param);
}
