package erds.com.study;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;
/**
 * ArrayList 线程不安全，对象数组
 * linkedList 线程不安全，链表
 * Vector 线程安全，对象数组
 * @author admin
 *
 */
public class ArrayListDemo {

	public static void main(String[] args) {
		List<String> l1 = new ArrayList<>();
		l1.add("111");
		l1.add("222");
		l1.add("333");
		List<String> l2 = new LinkedList<>();
		l2.add("111");
		l2.add("222");
		l2.add("333");
		List<String> l3 = new Vector<>();
		l3.add("111");
		l3.add("222");
		l3.add("333");
		for(String l :l1){
			System.out.println(l);
		}
		for(String l :l2){
			System.out.println(l);
		}
		for(String l :l3){
			System.out.println(l);
		}
	}
}
