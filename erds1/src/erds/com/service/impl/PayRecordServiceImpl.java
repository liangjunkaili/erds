package erds.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erds.com.bean.PayRecord;
import erds.com.dao.IPayRecord;
import erds.com.service.IPayRecordService;
@Service("payRecordService")
public class PayRecordServiceImpl implements IPayRecordService {

	@Autowired
	private IPayRecord payRecord;
	@Override
	public int addPayRecord(Map<String, Object> param) {
		return payRecord.addPayRecord(param);
	}

	@Override
	public List<PayRecord> queryPayRecord(Map<String, Object> param) {
		return payRecord.queryPayRecord(param);
	}

	@Override
	public PayRecord queryPayByBillNo(Map<String, Object> param) {
		return payRecord.queryPayByBillNo(param);
	}

}
