package erds.com.dao;

import java.util.List;
import java.util.Map;

import erds.com.bean.PayRecord;

public interface IPayRecord {

	public int addPayRecord(Map<String,Object> param);
	
	public List<PayRecord> queryPayRecord(Map<String,Object> param);

	public PayRecord queryPayByBillNo(Map<String, Object> param);
}
