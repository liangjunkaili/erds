package erds.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.beecloud.BCPay;
import cn.beecloud.BeeCloud;
import cn.beecloud.BCEumeration.PAY_CHANNEL;
import cn.beecloud.bean.BCException;
import cn.beecloud.bean.BCOrder;
import cn.beecloud.bean.BCQueryParameter;
import erds.com.bean.Course;
import erds.com.bean.Student;
import erds.com.dao.IStudentDao;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value="classpath:/erds/resource/spring-mybatis.xml")
public class Demo {

	@Autowired
	private IStudentDao studentDao;
	@Test
	public void testQuery(){
//		Student s = studentDao.getStudent();
//		System.out.println(s.getNickName()+"--"+s.getUserPhone());
	}
	
	public static void main(String[] args) {
//		BeeCloud.registerApp("2fc29555-49b7-415e-80f0-c5d06f5e799d", null, "ccb86190-c3c0-43ba-a4c9-29371c00a651", "3db27c52-220d-41f5-ba05-bf398febb5c0");
//		BCQueryParameter param = new BCQueryParameter();
//		param.setNeedDetail(true);//设置返回messgeDetail
//		param.setBillNo("b3d9d8cd613b46b2b618e9051f6e307c");
//		param.setPayResult(true);
//		param.setChannel(PAY_CHANNEL.valueOf("WX_NATIVE"));//设置查询条件channel
//		try {
//		    List<BCOrder> bcOrders = BCPay.startQueryBill(param);
//		    System.out.println("billSize:" + bcOrders.size());
//		} catch (BCException e) {
//		}
//		
//		
//		List<Course> list = new ArrayList<>();
//		Course cc = new Course();
//		cc.setTotalNum(2);
//		cc.setRelNum(11);
//		list.add(cc);
//		for(Course c : list){
//			c.setTotalNum(c.getTotalNum()+c.getRelNum());
//		}
//		System.out.println(list.size());System.out.println(list.get(0).getTotalNum());
		String email = "12312@qq.com";
		String emailType = email.substring(email.indexOf("@"));
		System.out.println(emailType);
	}
}
