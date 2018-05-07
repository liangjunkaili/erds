package erds.com.study.collection;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class CollectionsAndArrays {

	public static void main(String[] args) {
		List list = null;
		Object key = null;
		//集合工具类
		Collections.binarySearch(list, key);
		Comparator c = null;
		Collections.sort(list, c);
		Collections.reverse(list);
		int distance = 0;
		Collections.rotate(list, distance);
		Collections.swap(list, 2, 3);
		int[] a = null;
		int i = 0;
		//数组工具类
		Arrays.binarySearch(a, i);
		Arrays.sort(a);
		Arrays.asList(a);
	}
}
