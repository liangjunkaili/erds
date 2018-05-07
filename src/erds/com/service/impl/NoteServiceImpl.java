package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Note;
import erds.com.dao.INoteDao;
import erds.com.service.INoteService;

@Service("noteService")
public class NoteServiceImpl implements INoteService{

	private static Logger log = LoggerFactory.getLogger(NoteServiceImpl.class);
	@Autowired
	private INoteDao noteDao;
	@Override
	public int addNote(Map<String, Object> param) {
		return noteDao.addNote(param);
	}
	@Override
	public List<Note> queryNote(Map<String, Object> param) {
		return noteDao.queryNote(param);
	}
	@Override
	public int updateNote(Map<String, Object> param) {
		return noteDao.updateNote(param);
	}
	
}
