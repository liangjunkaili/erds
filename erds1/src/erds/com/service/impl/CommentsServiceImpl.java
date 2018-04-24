package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Comments;
import erds.com.dao.ICommentsDao;
import erds.com.service.ICommentsService;
@Service("commentsService")
public class CommentsServiceImpl implements ICommentsService{

	private static Logger log = LoggerFactory.getLogger(CommentsServiceImpl.class);
	@Autowired
	private ICommentsDao commentsDao;
	@Override
	public int addComment(Map<String, Object> param) {
		return commentsDao.addComments(param);
	}

	@Override
	public List<Comments> queryComment(Map<String, Object> param) {
		return commentsDao.queryComments(param);
	}

	@Override
	public int updateComment(Map<String, Object> param) {
		return commentsDao.updateComments(param);
	}

	@Override
	public int delComment(int id) {
		return commentsDao.delComment(id);
	}

}
