package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Professor;

public interface ProfessorDao {

	public int saveProfessor(Map<String,Object> param);
	public List<Professor> queryProfessor(Map<String,Object> param);
}
