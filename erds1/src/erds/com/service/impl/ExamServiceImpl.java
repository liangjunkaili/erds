package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.Answer;
import erds.com.bean.Evaluation;
import erds.com.bean.Exam;
import erds.com.dao.IExamDao;
import erds.com.service.IExamService;
@Service("examService")
public class ExamServiceImpl implements IExamService {

	@Autowired
	private IExamDao examDao;
	@Override
	public List<Exam> queryExam(Map<String, Object> param) {
		return examDao.queryExam(param);
	}
	@Override
	public int saveExam(Map<String, Object> param) {
		return examDao.saveExam(param);
	}
	@Override
	public List<Evaluation> queryEvaluation(Map<String, Object> param) {
		return examDao.queryEvaluation(param);
	}
	@Override
	public List<Answer> queryAnswer(Map<String, Object> param) {
		return examDao.queryAnswer(param);
	}
	@Override
	public int saveAnswer(Map<String, Object> param) {
		return examDao.saveAnswer(param);
	}

}
