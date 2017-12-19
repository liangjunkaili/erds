package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Comments;

public interface ICommentsDao {

	public int addComments(Map<String,Object> param);
	
	public List<Comments> queryComments(Map<String,Object> param);
	
	public int updateComments(Map<String,Object> param);
	public int delComment(int id);
}
