package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Note;

public interface INoteDao {

	public int addNote(Map<String,Object> param);
	
	public List<Note> queryNote(Map<String,Object> param);
	
	public int updateNote(Map<String,Object> param);

}
