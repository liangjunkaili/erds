package erds.com.service;

import java.util.List;
import java.util.Map;

import erds.com.bean.Comments;

public interface ICommentsService {

	public int addComment(Map<String,Object> param);
	
	public List<Comments> queryComment(Map<String,Object> param);
	
	public int updateComment(Map<String,Object> param);
	
	public int delComment(int id);

}
