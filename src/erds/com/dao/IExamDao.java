package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.Answer;
import erds.com.bean.Evaluation;
import erds.com.bean.Exam;

public interface IExamDao {

	public List<Exam> queryExam(Map<String,Object> param);
	public int saveExam(Map<String,Object> param);
	public List<Evaluation> queryEvaluation(Map<String,Object> param);
	public List<Answer> queryAnswer(Map<String,Object> param);
	public int saveAnswer(Map<String,Object> param);
}
