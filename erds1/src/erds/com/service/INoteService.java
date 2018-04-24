package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Note;

public interface INoteService {

	public int addNote(Map<String,Object> param);
	
	public List<Note> queryNote(Map<String,Object> param);
	
	public int updateNote(Map<String,Object> param);

}
