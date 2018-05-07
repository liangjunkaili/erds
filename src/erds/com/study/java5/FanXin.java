package erds.com.study.java5;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.List;

public class FanXin {

	public static <E> void main(String[] args) {
		//泛型只在编译阶段有效,编译之后，程序会采取去泛型化的措施
		ArrayList<String> a = new ArrayList<String>();
		a.add("CSDN");
		ArrayList b = new ArrayList<>();
		Class c1 = a.getClass();
		try {
			Method m = c1.getMethod("add", Object.class);
			try {
				m.invoke(a, 100);
				System.out.println(a);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		Class c2 = b.getClass();
		System.out.println(c1 == c2);
		
		
		List<? extends String> l = new ArrayList<>();
		EnumMap<EnumTest, String> map = new EnumMap<EnumTest, String>(EnumTest.class);
		map.put(EnumTest.DEAD, "this is dead");
		map.put(EnumTest.RUN, "this is run");
		
		for(EnumTest et:EnumTest.values()){
			System.out.println(et+"---"+map.get(et));
		}
	}
}
