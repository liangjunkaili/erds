package erds.com.study;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;
/**
 * HashSet 无序的，HashMap，可以放null
 * TreeSet 有序的，NavigableMap，不可以放null
 * @author admin
 *
 */
public class SetDemo {

	public static void main(String[] args) {
		Set<String> s = new HashSet<>();
		s.add("333");
		s.add("111");
		s.add("222");
		s.add("sss");
		Set<String> s1 = new TreeSet<>();
		s1.add("111");
		s1.add("222");
		s1.add("333");
		s1.add("sss");
		Set<String> s2 = new LinkedHashSet();
		s2.add("111");
		s2.add("222");
		s2.add("333");
		s2.add("sss");
		for(String str : s){
			System.out.println(str);
		}
		for(String str : s1){
			System.out.println(str);
		}
		for(String str : s2){
			System.out.println(str);
		}
	}
}
