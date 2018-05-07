package erds.com.study;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
/**
 * HashMap是无序的，线程不安全的
 * TreeMap Comparator<? super K>是有序的（根据hashcode）
 * LinkedHashMap 有序的（根据插入的顺序）
 * Hashtable 无序的，线程安全的，synchronized方法
 * @author admin
 *
 */
public class HashMapDemo {

	public static void main(String[] args) {
		Map<String,Double> map = new HashMap<>();
		//有序的map
		TreeMap<String,Double> map1 = new TreeMap<>();
		LinkedHashMap<String,Double> map2 = new LinkedHashMap<>();
		map.put("语文", 88.0);
		map.put("物理", 88.0);
		map.put("英语", 88.0);
		map.put("数学", 88.0);
		map.put("物理2", 88.0);
		map1.put("语文", 88.0);
		map1.put("数学", 88.0);
		map1.put("英语", 88.0);
		map2.put("语文", 88.0);
		map2.put("英语", 88.0);
		map2.put("数学", 88.0);
		for(Entry<String,Double> entry :map.entrySet()){
			System.out.println(entry.getKey()+"---"+entry.getValue());
		}
		System.out.println("===========");
		for(Entry<String,Double> entry :map1.entrySet()){
			System.out.println(entry.getKey()+"---"+entry.getValue());
		}
		System.out.println("===========");
		for(Entry<String,Double> entry :map2.entrySet()){
			System.out.println(entry.getKey()+"---"+entry.getValue());
		}
		System.out.println("语文".hashCode());
		System.out.println("数学".hashCode());
		System.out.println("英语".hashCode());
		/*int i = hash("数学");
		System.out.println(i);
		System.out.println(828406>>>16);
		System.out.println(828406^12);
		System.out.println(2<<1);*/
		Integer i = 4;
		int a = i.compareTo(6);
		System.out.println(a);
		
		Map<String,Double> m1 = new Hashtable<>();
		m1.put("语文", 88.0);
		m1.put("英语", 88.0);
		m1.put("数学", 88.0);
		for(Entry<String,Double> entry :m1.entrySet()){
			System.out.println(entry.getKey()+"---"+entry.getValue());
		}
	}
	static final int hash(Object key) {
        int h;
        return (key == null) ? 0 : (h = key.hashCode()) ^ (h >>> 16);
    }
}
