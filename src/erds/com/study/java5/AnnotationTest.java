package erds.com.study.java5;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Test(username="lj",password="123123")
public class AnnotationTest {
	@Test(username="l--j",password="123123")
	private void fun(){
		
	}
	public static void main(String[] args) {
		/*Class<AnnotationTest> c = AnnotationTest.class;
		try {
			Method m = c.getMethod("fun");
			Test t = c.getAnnotation(Test.class);
			System.out.println(t.username());
			Test t1 = m.getAnnotation(Test.class);
			System.out.println(t1.password());
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}*/
		
		try {
			Connection c = getConnection();
			String sql = "select * from manager";
			PreparedStatement statement = c.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString(1)+"--"+rs.getString(2));
			}
			rs.close();
			statement.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@JDBCInfo()
	public static Connection getConnection() throws Exception{
		Method m = AnnotationTest.class.getDeclaredMethod("getConnection");
		if(m.isAnnotationPresent(JDBCInfo.class)){
			JDBCInfo jdbc = m.getAnnotation(JDBCInfo.class);
			String driverClassName = jdbc.driverClassName();
			String url = jdbc.url();
			String username = jdbc.username();
			String password = jdbc.password();
			Class.forName(driverClassName);
			return DriverManager.getConnection(url, username, password);
		}
		return null;
	}
}
